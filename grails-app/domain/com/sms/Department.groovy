package com.sms

class Department {

    String name
    String code

    static hasMany = [
            studentDepartments: StudentDepartment
    ]

    static constraints = {

        name blank: false,
                nullable: false,
                unique: true,
                size: 3..50

        code blank: false,
                nullable: false,
                unique: true,
                matches: /[A-Z]{2,5}/
    }

    String toString() {

        return name
    }
}