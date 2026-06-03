package students.management.system

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.springframework.context.annotation.Import
import students.management.system.security.SecurityConfig

import groovy.transform.CompileStatic

@CompileStatic
@Import(SecurityConfig)
class Application extends GrailsAutoConfiguration {
    static void main(String[] args) {
        GrailsApp.run(Application, args)
    }
}