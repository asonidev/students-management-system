<meta name="layout" content="main"/>
<div class="container-fluid">

    <div class="d-flex justify-content-between mb-4">

        <h2 class="fw-bold">
            Departments
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

                <th>ID</th>
                <th>Name</th>
                <th>Code</th>
                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <g:each in="${departments}" var="department">

                <tr>

                    <td>${department.id}</td>

                    <td>${department.name}</td>

                    <td>${department.code}</td>

                    <td>

                        <a href="/department/edit/${department.id}"
                           class="btn btn-warning btn-sm">

                            Edit
                        </a>

                        <a href="/department/delete/${department.id}"
                           class="btn btn-danger btn-sm">

                            Delete
                        </a>

                    </td>

                </tr>

            </g:each>

            </tbody>

        </table>

    </div>

</div>