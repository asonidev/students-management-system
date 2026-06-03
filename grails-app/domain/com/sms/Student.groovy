package com.sms

class Student {

    String firstName
    String lastName
    String email
    Integer age

        static hasMany = [
                studentDepartments: StudentDepartment,
                subjectMarks: StudentSubjectMarks
        ]

    static constraints = {

        firstName blank: false,
                nullable: false,
                size: 3..30

        lastName blank: false,
                nullable: false,
                size: 2..30

        email blank: false,
                nullable: false,
                email: true,
                unique: true

        age nullable: false,
                min: 18,
                max: 60
    }

    String toString() {

        return firstName + " " + lastName
    }
}