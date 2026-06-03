package com.sms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class StudentSpec extends Specification implements DomainUnitTest<Student> {

    def setup() {
    }

    def cleanup() {
    }

    void "test student constraints"() {
        when: "A valid student is created"
        Student student = new Student(firstName: "John", lastName: "Doe", email: "john@test.com", age: 25)

        then: "Validation passes"
        student.validate()
        !student.hasErrors()
        student.firstName == "John"
        student.age == 25
    }
}
