package com.sms

class StudentDepartment {

    Student student

    Department department

    Date joiningDate = new Date()

    static belongsTo = [
            student: Student,
            department: Department
    ]

    static constraints = {

        student nullable: false,
                unique: 'department'

        department nullable: false

        joiningDate nullable: false
    }

    static mapping = {

        table 'student_department'
    }
}