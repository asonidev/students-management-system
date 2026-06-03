package students.management.system

import com.sms.Role
import com.sms.User
import com.sms.UserRole
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class BootStrap {

    def init = {
        createDefaultAdmin()
    }

    def destroy = {
    }

    private void createDefaultAdmin() {
        User.withTransaction {
            def passwordEncoder = new BCryptPasswordEncoder()

            Role adminRole = Role.findByAuthority('ROLE_ADMIN')
            if (!adminRole) {
                adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            }

            User adminUser = User.findByUsername('admin')
            if (!adminUser) {
                adminUser = new User(
                    username: 'admin',
                    password: passwordEncoder.encode('Admin@1234'),
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false
                ).save(flush: true, failOnError: true)
            } else {
                if (!passwordEncoder.matches('Admin@123', adminUser.password)) {
                    adminUser.password = passwordEncoder.encode('Admin@123')
                }
                adminUser.enabled = true
                adminUser.accountExpired = false
                adminUser.accountLocked = false
                adminUser.passwordExpired = false
                adminUser.save(flush: true, failOnError: true)
            }

            if (!UserRole.exists(adminUser.id as long, adminRole.id as long)) {
                UserRole.create(adminUser, adminRole, true)
            }
        }
    }

}
