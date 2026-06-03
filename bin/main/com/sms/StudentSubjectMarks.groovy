package com.sms

class StudentSubjectMarks {
    Student student
    Subject subject
    Integer marks
    Integer total = 100

    static constraints = {
        marks min: 0
        total nullable: false
    }
}