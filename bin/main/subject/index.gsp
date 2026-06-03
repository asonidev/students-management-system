<meta name="layout" content="main"/>

<div class="container-fluid">
    <div class="card custom-shadow p-5">
        <h2 class="mb-4">Subject Management</h2>

        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <h4>Add New Subject</h4>
        <g:form controller="subject" action="save" class="row g-3 mb-4">
            <div class="col-auto">
                <input type="text" name="name" class="form-control" placeholder="Subject Name" required/>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Add Subject</button>
            </div>
        </g:form>

        <h4>All Subjects</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${subjects}" var="subject">
                    <tr>
                        <td>${subject.name}</td>
                        <td>
                            <g:form controller="subject" action="delete" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this subject?');">
                                <g:hiddenField name="id" value="${subject.id}"/>
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </g:form>
                        </td>
                    </tr>
                </g:each>
                <g:if test="${!subjects}">
                    <tr><td colspan="2" class="text-muted">No subjects found.</td></tr>
                </g:if>
            </tbody>
        </table>
    </div>
</div>
