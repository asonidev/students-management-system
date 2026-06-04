<div class="card custom-shadow p-4 mt-3" id="student-details-panel">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <%-- <h4 class="mb-0">Student Details</h4> --%>
        <h4 class="mb-0"><g:message code="student.details.title" default="Student Details" /></h4>
        <a href="/student/show/${student.id}" class="btn btn-outline-primary btn-sm"><g:message code="student.details.viewFullDetails" default="View Full Details" /></a>
    </div>

    <div class="row mb-3">
        <div class="col-md-6">
            <p class="mb-2"><strong>Name:</strong> ${student.firstName} ${student.lastName}</p>
            <p class="mb-2"><strong>Email:</strong> ${student.email}</p>
            <p class="mb-2"><strong>Age:</strong> ${student.age}</p>
            <p class="mb-0"><strong>Percentage:</strong> ${percentage != null ? percentage + '%' : 'N/A'}</p>
        </div>
    </div>

    <hr/>

    <%-- <h5>Assigned Departments</h5> --%>
    <h5><g:message code="student.details.assignedDepartments" default="Assigned Departments" /></h5>
    <ul class="list-group mb-3">
        <g:each in="${student.studentDepartments}" var="sd">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                ${sd.department.name}
                <span class="badge bg-primary rounded-pill">
                    <g:formatDate date="${sd.joiningDate}" format="yyyy-MM-dd"/>
                </span>
            </li>
        </g:each>
        <g:if test="${!student.studentDepartments}">
            <li class="list-group-item text-muted">No departments assigned yet.</li>
        </g:if>
    </ul>

    <%-- <h5>Subject Marks</h5> --%>
    <h5><g:message code="student.details.subjectMarks" default="Subject Marks" /></h5>
    <table class="table table-bordered mb-0">
        <thead>
            <tr>
                <th><g:message code="student.details.subject.label" default="Subject" /></th>
<th><g:message code="student.details.marks.label" default="Marks" /></th>
<th><g:message code="student.details.total.label" default="Total" /></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${subjectMarks}" var="sm">
                <tr>
                    <td>${sm.subject.name}</td>
                    <td>${sm.marks}</td>
                    <td>${sm.total}</td>
                </tr>
            </g:each>
            <g:if test="${!subjectMarks}">
                <tr>
                    <td colspan="3" class="text-muted">No subject marks entered yet.</td>
                </tr>
            </g:if>
        </tbody>
    </table>
</div>
