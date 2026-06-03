<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Export Students to Excel</title>
</head>
<body>
    <h1>Export Students to Excel</h1>
    <g:form controller="department" action="exportStudentsExcel" method="GET">
        <div class="row mb-3">
            <div class="col-sm-2 col-form-label text-sm-end">
                <label for="departmentId">Department</label>
            </div>
            <div class="col-sm-4">
                <g:select name="id" from="${com.sms.Department.list()}" optionKey="id" optionValue="name" required="true" class="form-control" />
            </div>
            <div class="col-sm-2 col-form-label text-sm-end">
                <label for="startDate">Start Date</label>
            </div>
            <div class="col-sm-4">
                <g:datePicker name="startDate" class="form-control" />
            </div>
            <div class="col-sm-2 col-form-label text-sm-end">
                <label for="endDate">End Date</label>
            </div>
            <div class="col-sm-4">
                <g:datePicker name="endDate" class="form-control" />
            </div>
        </div>
        <button class="btn btn-success" type="submit">
            <i class="bi-file-earmark-excel"></i> Generate Excel
        </button>
    </g:form>
</body>
</html>
