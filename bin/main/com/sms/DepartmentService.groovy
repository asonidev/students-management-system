package com.sms
import org.apache.poi.ss.usermodel.*
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.text.SimpleDateFormat
import grails.util.Holders
import grails.gorm.transactions.Transactional

@Transactional
class DepartmentService {

    /**
     * Scheduled export of assignments to Excel (every 5 minutes)
     * Optionally, email the file to admins (add mail logic if needed)
     */
    def exportAssignmentsToExcelAndEmail() {
        def grailsApplication = Holders.grailsApplication
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


        // Save file to user's Downloads folder
        String userHome = System.getProperty('user.home')
        File downloadsDir = new File(userHome, 'Downloads')
        if (!downloadsDir.exists()) downloadsDir.mkdirs()
        def filePath = new File(downloadsDir, "assignments_export_${System.currentTimeMillis()}.xlsx")
        filePath.withOutputStream { os ->
            workbook.write(os)
        }
        workbook.close()

        // (Optional) Email logic can be added here using Grails mail plugin
        // Example:
        // mailService.sendMail {
        //     to "admin@example.com"
        //     subject "Scheduled Assignment Export"
        //     body "Please find the latest assignments export attached."
        //     attach file
        // }

        println "[Scheduled Export] Assignments exported to ${filePath.absolutePath} at ${new Date()}"
    }

    def saveDepartment(params) {

        Department department = new Department(params)

        if(department.validate()) {

            department.save(flush:true)

            return department
        }

        return null
    }

    def updateDepartment(Long id, params) {

        Department department = Department.get(id)

        if(!department) {
            return null
        }

        department.properties = params

        if(department.validate()) {

            department.save(flush:true)

            return department
        }

        return null
    }

    def deleteDepartment(Long id) {

        Department department = Department.get(id)

        if(department) {

            StudentDepartment.findAllByDepartment(department)*.delete()

            department.delete(flush:true)

            return true
        }

        return false
    }

    def assignStudent(Long studentId,
                  Long departmentId) {

    Student student = Student.get(studentId)

    Department department = Department.get(departmentId)

    if(!student || !department) {

        return "INVALID"
    }

    StudentDepartment existing =
            StudentDepartment.findByStudentAndDepartment(
                    student,
                    department
            )

    if(existing) {

        return "EXISTS"
    }

    StudentDepartment assignment =
            new StudentDepartment()

    assignment.student = student
    assignment.department = department
    assignment.joiningDate = new Date()

    if(assignment.validate()) {

        assignment.save(flush:true)

        return assignment
    }

    return null
}
}
