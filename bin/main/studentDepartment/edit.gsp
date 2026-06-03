<%@ page contentType="text/html;charset=UTF-8" %>
<h1>Edit StudentDepartment</h1>
<g:form controller="studentDepartment" action="update" method="PUT">
    <g:hiddenField name="id" value="${studentDepartment?.id}" />
    <div class="form-group">
        <label for="student">Student</label>
        <g:select name="student.id" from="${com.sms.Student.list()}" optionKey="id" optionValue="toString" value="${studentDepartment?.student?.id}" required="true" class="form-control" />
    </div>
    <div class="form-group">
        <label for="joiningDate">Joining Date</label>
        <g:datePicker name="joiningDate" value="${studentDepartment?.joiningDate}" required="true" class="form-control" />
    </div>
    <g:submitButton name="update" value="Update" class="btn btn-primary" />
</g:form>
