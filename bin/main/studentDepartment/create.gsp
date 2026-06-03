<%@ page contentType="text/html;charset=UTF-8" %>
<h1>Create StudentDepartment</h1>
<g:form controller="studentDepartment" action="save">
    <div class="form-group">
        <label for="student">Student</label>
        <g:select name="student.id" from="${com.sms.Student.list()}" optionKey="id" optionValue="toString" required="true" class="form-control" />
    </div>
    <div class="form-group">
        <label for="department">Department</label>
        <g:select name="department.id" from="${com.sms.Department.list()}" optionKey="id" optionValue="name" required="true" class="form-control" />
    </div>
    <div class="form-group">
        <label for="joiningDate">Joining Date</label>
        <g:datePicker name="joiningDate" value="${studentDepartment?.joiningDate}" required="true" class="form-control" />
    </div>
    <g:submitButton name="create" value="Create" class="btn btn-primary" />
</g:form>
