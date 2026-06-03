package com.sms

import grails.gorm.transactions.Transactional

@Transactional
class SubjectController {

    def index() {
        [subjects: Subject.list(sort: 'name', order: 'asc')]
    }

    def save() {
        def subject = new Subject(params)
        if (subject.save(flush: true)) {
            flash.message = "Subject added!"
        } else {
            flash.error = "Failed to add subject."
        }
        redirect(action: 'index')
    }
    def delete(Long id) {
        def subject = Subject.get(id)
        if (StudentSubjectMarks.findBySubject(subject)) {
            flash.error = "Cannot delete: Subject is assigned to students."
        } else {
            subject.delete(flush: true)
            flash.message = "Subject deleted."
        }
        redirect(action: 'index')
    }
}
