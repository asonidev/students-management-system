<meta name="layout" content="main"/>
<div class="container-fluid">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2 class="fw-bold">
                 <g:message code="student.list.title" default="Students" />
            </h2>

            <p class="text-muted">
                <%-- Manage student records --%>
                <g:message code="student.list.subtitle" default="Manage student records" />
            </p>

        </div>

        <a href="/student/create"
           class="btn btn-primary">

            <i class="fa fa-plus"></i>
            <%-- Add Student --%>
            <g:message code="default.add.label" args="[message(code: 'student.label', default: 'Student')]" />
        </a>

    </div>

    <div class="card shadow p-4">

        <p class="text-muted mb-3">Click any student row to view details below.</p>

        <table class="table table-hover">

            <thead class="table-dark">

            <tr>

                <%-- <th>ID</th> --%>
                <th><g:message code="student.field.id" default="ID" /></th>
<th><g:message code="student.field.name" default="Name" /></th>
<th><g:message code="student.field.email" default="Email" /></th>
<th><g:message code="student.field.age" default="Age" /></th>
<th><g:message code="student.field.actions" default="Actions" /></th>

            </tr>

            </thead>

            <tbody>

            <g:each in="${students}" var="student">

                <tr class="student-row"
                    data-student-id="${student.id}"
                    data-details-url="${createLink(controller: 'student', action: 'details', id: student.id)}"
                    style="cursor:pointer;">

                    <td>${student.id}</td>

                    <td>
                        ${student.firstName}
                        ${student.lastName}
                    </td>

                    <td>${student.email}</td>

                    <td>${student.age}</td>

                    <td>

                        <a href="/student/show/${student.id}"
                           class="btn btn-info btn-sm action-link">

                            <i class="fa fa-eye"></i>
                        </a>

                        <a href="/student/edit/${student.id}"
                           class="btn btn-warning btn-sm action-link">

                            <i class="fa fa-pen"></i>
                        </a>

                        <a href="/student/delete/${student.id}"
                           class="btn btn-danger btn-sm action-link">

                            <i class="fa fa-trash"></i>
                        </a>

                    </td>

                </tr>

            </g:each>

            </tbody>

        </table>

    </div>

    <div id="student-details-wrapper" class="mt-3" style="display:none;">
        <div class="card shadow p-4" id="student-details-content">
            <p class="text-muted mb-0">Loading student details...</p>
        </div>
    </div>

</div>

<script>
    $(function () {
        $('.student-row').on('click', function (e) {
            if ($(e.target).closest('.action-link').length > 0) {
                return;
            }

            $('.student-row').removeClass('table-active');
            $(this).addClass('table-active');

            const detailsUrl = $(this).data('details-url');
            const wrapper = $('#student-details-wrapper');
            const content = $('#student-details-content');

            wrapper.show();
            content.html('<p class="text-muted mb-0">Loading student details...</p>');

            $.get(detailsUrl)
                .done(function (html) {
                    content.html(html);
                })
                .fail(function () {
                    content.html('<div class="alert alert-danger mb-0">Unable to load student details. Please try again.</div>');
                });
        });
    });
</script>