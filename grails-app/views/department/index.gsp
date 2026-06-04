<meta name="layout" content="main"/>
<div class="container-fluid">

    <div class="d-flex justify-content-between mb-4">

        <%-- <h2 class="fw-bold">
            Departments
        </h2> --%>
        <h2 class="fw-bold"> 
        <g:message code="department.list.title" default="Departments" /> 
        </h2>

        <%-- <a href="/department/create"
           class="btn btn-success">
            <i class="fa fa-plus"></i>
            Add Department
        </a> --%>
            <g:link controller="department" action="create" class="btn btn-success">
            <i class="fa fa-plus"></i>
        <g:message code="default.add.label" args="[message(code: 'Department')]" />
    </g:link>

    </div>

    <div class="card shadow p-4">

        <table class="table table-hover">

            <thead class="table-dark">

            <tr>

                <%-- <th>ID</th> --%>
                <th><g:message code="department.field.id" default="ID" /></th>
<th><g:message code="department.field.name" default="Name" /></th>
<th><g:message code="department.field.code" default="Code" /></th>
<th><g:message code="department.field.actions" default="Actions" /></th>

            </tr>

            </thead>

            <tbody>

            <g:each in="${departments}" var="department">

                <tr>

                    <td>${department.id}</td>

                    <td>${department.name}</td>

                    <td>${department.code}</td>

                    <td>

                        <%-- <a href="/department/edit/${department.id}"
                           class="btn btn-warning btn-sm">

                            Edit
                        </a> --%>
                        <g:link controller="department" action="edit" id="${department.id}" class="btn btn-warning btn-sm">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                        <%-- <a href="/department/delete/${department.id}"
                           class="btn btn-danger btn-sm">

                            Delete
                        </a> --%>
                        <g:link controller="department" action="delete" id="${department.id}" class="btn btn-danger btn-sm">
                        <g:message code="default.button.delete.label" default="Delete" />
                    </g:link>
                    </td>

                </tr>

            </g:each>

            </tbody>

        </table>

    </div>

</div>