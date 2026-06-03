package students.management.system.security

import com.sms.UserRole
import com.sms.User
import grails.gorm.transactions.ReadOnly
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service

@Service
class CustomUserDetailsService implements UserDetailsService {

    @Override
    @ReadOnly
    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return User.withNewSession {
            User appUser = User.findByUsername(username)
            if (!appUser) {
                throw new UsernameNotFoundException("User not found: ${username}")
            }

            Collection<GrantedAuthority> authorities = UserRole.findAllByUser(appUser).collect {
                new SimpleGrantedAuthority(it.role.authority)
            }

            if (!authorities) {
                authorities = [new SimpleGrantedAuthority('ROLE_USER')]
            }

            new org.springframework.security.core.userdetails.User(
                appUser.username,
                appUser.password,
                appUser.enabled,
                !appUser.accountExpired,
                !appUser.passwordExpired,
                !appUser.accountLocked,
                authorities
            )
        }
    }
}
