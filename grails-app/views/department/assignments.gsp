<meta name="layout" content="main"/>

<div class="container-fluid">

    <div class="card p-5 custom-shadow">


        <div class="d-flex justify-content-between mb-4 align-items-center">
            <%-- <h2>
                Student Department Assignments
            </h2> --%>
            <h2>
                <g:message code="department.assignment.list.title" default="Student Department Assignments" />
            </h2>

            <div>
                <%-- <a href="/department/assignStudent" class="btn btn-primary me-2">
                    New Assignment
                </a> --%>
                <g:link controller="department" action="assignStudent" class="btn btn-primary me-2">
                    <g:message code="department.assignment.button.new" default="New Assignment" />
                </g:link>
                
                <g:link controller="department" action="exportAssignmentsExcel">
                    <button class="btn btn-success" type="button">
                        <i class="fa fa-file-excel"></i> Export
                    </button>
                </g:link>
            </div>
        </div>

        <table class="table table-hover">

            <thead class="table-dark">

            <tr>

                <%-- <th>ID</th> --%>

                <th><g:message code="department.assignment.field.id" default="ID" /></th>

                <th><g:message code="department.assignment.field.studentId" default="Student ID" /></th>

                <th><g:message code="department.assignment.field.studentName" default="Student Name" /></th>

                <th><g:message code="department.assignment.field.departmentId" default="Department ID" /></th>

                <th><g:message code="department.assignment.field.departmentName" default="Department" /></th>

                <th><g:message code="department.assignment.field.joiningDate" default="Joining Date" /></th>

            </tr>

            </thead>

            <tbody>

            <g:each in="${assignments}" var="a">

                <tr>

                    <td>${a.id}</td>

                    <td>${a.student.id}</td>

                    <td>

                        ${a.student.firstName}
                        ${a.student.lastName}

                    </td>

                    <td>${a.department.id}</td>

                    <td>${a.department.name}</td>

                    <td>

                        <g:formatDate
                                date="${a.joiningDate}"
                                format="dd-MM-yyyy HH:mm"/>

                    </td>

                </tr>

            </g:each>

            </tbody>

        </table>

    </div>

</div>