    package com.sms
    import com.sms.Department
    import com.sms.DepartmentService
    import com.sms.Student
    import com.sms.StudentDepartment
    import grails.converters.*
    import java.text.SimpleDateFormat
    import org.apache.poi.ss.usermodel.*
    import org.apache.poi.xssf.usermodel.XSSFWorkbook
    
  
class DepartmentController {

    DepartmentService departmentService

    // ======================
    // DEPARTMENT CRUD
    // ======================

    def index() {

        [departments: Department.list(sort: 'id', order: 'asc')]
    }

    def create() {

        [department: new Department()]
    }

    def save() {

        def department = departmentService.saveDepartment(params)

        if (department) {

            flash.message = "Department Added Successfully"
            redirect(action: 'index')

        } else {

            flash.error = "Validation Failed"
            render(view: 'create',
                    model: [department: new Department(params)])
        }
    }

    def edit(Long id) {

        [department: Department.get(id)]
    }

    def update(Long id) {

        def department = departmentService.updateDepartment(id, params)

        if (department) {

            flash.message = "Department Updated Successfully"
            redirect(action: 'index')

        } else {

            flash.error = "Update Failed"
            redirect(action: 'edit', id: id)
        }
    }

    def delete(Long id) {

        departmentService.deleteDepartment(id)

        flash.message = "Department Deleted Successfully"
        redirect(action: 'index')
    }

    def show(Long id) {

        [department: Department.get(id)]
    }


    // ======================
    // ASSIGNMENT FEATURES
    // ======================

    def assignStudent(Long studentId) {

        [
                students: Student.list(),
                departments: Department.list(),
                selectedStudentId: studentId
        ]
    }

    def saveAssignment() {

        if (!params.studentId || !params.departmentId) {

            flash.error = "Please select student and department"
            redirect(action: 'assignStudent')
            return
        }

        def result = departmentService.assignStudent(
                params.long('studentId'),
                params.long('departmentId')
        )

        if (result == "EXISTS") {

            flash.error = "Student is already assigned to this department"

        } else if (result == "INVALID") {

            flash.error = "Invalid student or department"

        } else if (result) {

            flash.message = "Student assigned successfully"

        } else {

            flash.error = "Assignment failed"
        }

        if (params.redirectAction == 'show' && params.redirectController == 'student') {
            redirect(controller: 'student', action: 'show', id: params.long('studentId'))
            return
        }

        redirect(action: 'assignStudent')
    }

    def assignments() {

        [
                assignments: StudentDepartment.list(sort: 'id', order: 'asc')
        ]
    }
    /**
     * Export assignments to Excel using MySQL procedure
     */
    def exportAssignmentsExcel() {
        def sql = groovy.sql.Sql.newInstance(
            grailsApplication.config.dataSource.url,
            grailsApplication.config.dataSource.username,
            grailsApplication.config.dataSource.password,
            grailsApplication.config.dataSource.driverClassName
        )

        def assignments = sql.rows("CALL export_assignments()")

        Workbook workbook = new XSSFWorkbook()
        Sheet sheet = workbook.createSheet('Assignments')

        // Header
        Row header = sheet.createRow(0)
        def headers = ['Assignment ID', 'Student ID', 'Student Name', 'Department ID', 'Department Name', 'Joining Date']
        headers.eachWithIndex { h, i ->
            header.createCell(i).setCellValue(h)
        }

        // Data
        assignments.eachWithIndex { a, idx ->
            Row row = sheet.createRow(idx + 1)
            row.createCell(0).setCellValue(a.assignment_id ?: '')
            row.createCell(1).setCellValue(a.student_id ?: '')
            row.createCell(2).setCellValue(a.student_name ?: '')
            row.createCell(3).setCellValue(a.department_id ?: '')
            row.createCell(4).setCellValue(a.department_name ?: '')
            def dateStr = ''
            if (a.joining_date) {
                if (a.joining_date instanceof java.sql.Date || a.joining_date instanceof java.util.Date) {
                    dateStr = new SimpleDateFormat('yyyy-MM-dd').format(a.joining_date)
                } else if (a.joining_date instanceof String) {
                    dateStr = a.joining_date
                }
            }
            row.createCell(5).setCellValue(dateStr)
        }

        response.contentType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        def fileName = "assignments_export.xlsx"
        response.setHeader('Content-Disposition', "attachment; filename=${fileName}")

        workbook.write(response.outputStream)
        workbook.close()
        response.outputStream.flush()
    }
}