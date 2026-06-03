package students.management.system.security

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.authentication.dao.DaoAuthenticationProvider
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.web.SecurityFilterChain

@Configuration
@EnableMethodSecurity
class SecurityConfig {

    @Bean
    CustomUserDetailsService customUserDetailsService() {
        new CustomUserDetailsService()
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http, AuthenticationProvider authenticationProvider) throws Exception {
        http
            .authenticationProvider(authenticationProvider)
            .authorizeHttpRequests { auth ->
                auth
                    .requestMatchers(
                        '/',
                        '/index',
                        '/index.gsp',
                        '/error',
                        '/notFound',
                        '/favicon.ico',
                        '/assets/**',
                        '/webjars/**',
                        '/images/**',
                        '/css/**',
                        '/js/**',
                        '/login',
                        '/logout'
                    ).permitAll()
                    .requestMatchers(
                        '/student/create/**',
                        '/student/save/**',
                        '/student/edit/**',
                        '/student/update/**',
                        '/student/delete/**',
                        '/department/create/**',
                        '/department/save/**',
                        '/department/edit/**',
                        '/department/update/**',
                        '/department/delete/**',
                        '/subject/create/**',
                        '/subject/save/**',
                        '/subject/edit/**',
                        '/subject/update/**',
                        '/subject/delete/**'
                    ).hasRole('ADMIN')
                    .anyRequest().authenticated()
            }
            .formLogin { login ->
                login.permitAll()
            }
            .logout { logout ->
                logout.permitAll()
            }

        return http.build()
    }

    @Bean
    AuthenticationProvider authenticationProvider(CustomUserDetailsService customUserDetailsService, PasswordEncoder passwordEncoder) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider()
        provider.setUserDetailsService(customUserDetailsService)
        provider.setPasswordEncoder(passwordEncoder)
        provider
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        new BCryptPasswordEncoder()
    }
}
