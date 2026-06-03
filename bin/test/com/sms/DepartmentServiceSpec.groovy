package com.sms

import grails.testing.services.ServiceUnitTest
import grails.testing.gorm.DataTest
import spock.lang.Specification

class DepartmentServiceSpec extends Specification implements ServiceUnitTest<DepartmentService>, DataTest {

    void setupSpec() {
        mockDomains Student, Department, StudentDepartment
    }

    def "test assignStudent logic"() {
        given: "A student and a department"
        def student = new Student(firstName: "Alice", lastName: "Smith", email: "alice@test.com", age: 20).save(flush: true)
        def dept = new Department(name: "Computer Science", code: "CS").save(flush: true)

        when: "The student is assigned to the department"
        def result = service.assignStudent(student.id, dept.id)

        then: "Assignment is successful"
        result instanceof StudentDepartment
        result.student == student
        result.department == dept
        StudentDepartment.count() == 1

        when: "Assigning the same student to the same department again"
        def duplicateResult = service.assignStudent(student.id, dept.id)

        then: "The service returns EXISTS"
        duplicateResult == "EXISTS"
        StudentDepartment.count() == 1
    }

    def "test assignStudent with invalid IDs"() {
        when: "Assigning with non-existent IDs"
        def result = service.assignStudent(999L, 888L)

        then: "The service returns INVALID"
        result == "INVALID"
    }

    def "test deleteDepartment cleanup"() {
        given: "A department with an assigned student"
        def student = new Student(firstName: "Bob", lastName: "Jones", email: "bob@test.com", age: 22).save(flush: true)
        def dept = new Department(name: "Physics", code: "PHYS").save(flush: true)
        service.assignStudent(student.id, dept.id)

        expect: "Assignment exists"
        StudentDepartment.count() == 1

        when: "The department is deleted"
        service.deleteDepartment(dept.id)

        then: "The assignment mapping is also deleted"
        StudentDepartment.count() == 0
        Department.count() == 0
    }
}