package com.sms

import grails.gorm.transactions.Transactional

@Transactional
class StudentController {

    StudentService studentService

    def index() {

        [students: Student.list(sort:'id', order:'asc')]
    }

    def create() {

        [student:new Student()]
    }

    def save() {

        def student = studentService.saveStudent(params)

        if(student) {

            flash.message = "Student Added Successfully"

            redirect(action:'index')

        } else {

            flash.error = "Validation Failed"

            render(view:'create',
                    model:[student:new Student(params)])
        }
    }

    def edit(Long id) {

        [student: Student.get(id)]
    }

    def update(Long id) {

        def student = studentService.updateStudent(id, params)

        if(student) {

            flash.message = "Student Updated Successfully"

            redirect(action:'index')

        } else {

            flash.error = "Update Failed"

            redirect(action:'edit', id:id)
        }
    }

    def delete(Long id) {

        studentService.deleteStudent(id)

        flash.message = "Student Deleted Successfully"

        redirect(action:'index')
    }

    def show(Long id) {
        def student = Student.get(id)
        if (!student) {
            flash.error = "Student not found"
            redirect(action: "index")
            return
        }
        def percentage = studentService.getStudentPercentage(student.id)
        def subjectMarks = StudentSubjectMarks.findAllByStudent(student)
        [
            student: student,
            allDepartments: Department.list(sort: 'name', order: 'asc'),
            percentage: percentage,
            subjectMarks: subjectMarks
        ]
    }

    /**
     * Return student details as partial view for AJAX rendering on index page
     */
    def details(Long id) {
        def student = Student.get(id)
        if (!student) {
            render status: 404, text: "Student not found"
            return
        }

        def percentage = studentService.getStudentPercentage(student.id)
        def subjectMarks = StudentSubjectMarks.findAllByStudent(student)

        render(template: 'detailsPanel', model: [
            student: student,
            percentage: percentage,
            subjectMarks: subjectMarks
        ])
    }
    /**
     * Add or update marks for a subject for a student
     */
    def addOrUpdateMarks() {
        def student = Student.get(params.studentId as Long)
        def subject = Subject.get(params.subjectId as Long)
        def marks = params.marks as Integer

        if (student && subject && marks != null) {
            def ssm = StudentSubjectMarks.findByStudentAndSubject(student, subject) ?: new StudentSubjectMarks(student: student, subject: subject)
            ssm.marks = marks
            if (ssm.save(flush: true)) {
                flash.message = "Marks saved!"
            } else {
                flash.error = "Failed to save marks."
            }
        } else {
            flash.error = "Invalid input."
        }
        redirect(action: 'show', id: params.studentId)
    }
    /**
     * Assign multiple subjects to a student
     */
    def assignSubjects() {
        def student = Student.get(params.studentId as Long)
        def subjectIds = params.list('subjectIds')*.toLong()
        if (student && subjectIds) {
            subjectIds.each { sid ->
                def subject = Subject.get(sid)
                if (subject && !StudentSubjectMarks.findByStudentAndSubject(student, subject)) {
                    new StudentSubjectMarks(student: student, subject: subject, marks: 0).save(flush: true)
                }
            }
            flash.message = "Subjects assigned!"
        } else {
            flash.error = "Please select at least one subject."
        }
        redirect(action: 'show', id: params.studentId)
    }
    /**
     * Update marks for a subject mark
     */
    def updateSubjectMark() {
        def ssm = StudentSubjectMarks.get(params.id as Long)
        def studentId = params.studentId
        def marks = params.marks as Integer
        if (ssm && marks != null) {
            ssm.marks = marks
            if (ssm.save(flush: true)) {
                flash.message = "Marks updated."
            } else {
                flash.error = "Failed to update marks."
            }
        } else {
            flash.error = "Invalid input."
        }
        redirect(action: 'show', id: studentId)
    }

    /**
     * Delete a subject mark for a student
     */
    def deleteSubjectMark() {
        def ssm = StudentSubjectMarks.get(params.id as Long)
        def studentId = params.studentId
        if (ssm) {
            ssm.delete(flush: true)
            flash.message = "Subject mark deleted."
        } else {
            flash.error = "Subject mark not found."
        }
        redirect(action: 'show', id: studentId)
    }
}