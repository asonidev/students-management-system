
package com.sms

import grails.gorm.transactions.Transactional
import javax.sql.DataSource

@Transactional
class StudentService {
    DataSource dataSource

    def saveStudent(params) {

        Student student = new Student(params)

        if(student.validate()) {

            student.save(flush:true)

            return student
        }

        return null
    }

    def updateStudent(Long id, params) {

        Student student = Student.get(id)

        if(!student) {
            return null
        }

        student.properties = params

        if(student.validate()) {

            student.save(flush:true)

            return student
        }

        return null
    }

    def deleteStudent(Long id) {

        Student student = Student.get(id)


        if(student) {
            StudentSubjectMarks.findAllByStudent(student)*.delete()
            StudentDepartment.findAllByStudent(student)*.delete()
            student.delete(flush:true)
            return true
        }

        return false
    }
    /**
     * Calls the MySQL stored procedure to calculate percentage for a student
     */
    BigDecimal getStudentPercentage(Long studentId) {
        def sql = new groovy.sql.Sql(dataSource)
        def percentage = 0
        sql.call("{call calculate_percentage(?, ?)}", [studentId, groovy.sql.Sql.DECIMAL]) { out ->
            percentage = out
        }
        return percentage
    }
}
