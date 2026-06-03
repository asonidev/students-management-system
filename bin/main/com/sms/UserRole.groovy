package com.sms

import grails.gorm.DetachedCriteria
import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode(includes = ['user', 'role'])
class UserRole implements Serializable {

    User user
    Role role

    static constraints = {
        role validator: { Role r, UserRole ur ->
            if (ur.user?.id) {
                UserRole.withNewSession {
                    if (UserRole.exists(ur.user.id, r.id)) {
                        return 'userRole.exists'
                    }
                }
            }
        }
    }

    static mapping = {
        id composite: ['user', 'role']
        version false
    }

    private static DetachedCriteria<UserRole> criteriaFor(long userId, long roleId) {
        UserRole.where {
            user == User.load(userId) && role == Role.load(roleId)
        }
    }

    static boolean exists(long userId, long roleId) {
        criteriaFor(userId, roleId).count() > 0
    }

    static UserRole create(User user, Role role, boolean flush = false) {
        def instance = new UserRole(user: user, role: role)
        instance.save(flush: flush)
        instance
    }

    static boolean remove(User u, Role r) {
        if (u == null || r == null) {
            return false
        }

        int rowCount = criteriaFor(u.id, r.id).deleteAll() as int
        rowCount > 0
    }

    static int removeAll(User u) {
        u == null ? 0 : UserRole.where { user == u }.deleteAll() as int
    }

    static int removeAll(Role r) {
        r == null ? 0 : UserRole.where { role == r }.deleteAll() as int
    }
}
