<meta name="layout" content="main"/>

<div class="container-fluid">
    <div class="card custom-shadow p-5">
        <h2 class="mb-4">Student Details</h2>


        <div class="row mb-4">
            <div class="col-md-6">
                <p><strong>Name:</strong> ${student.firstName} ${student.lastName}</p>
                <p><strong>Email:</strong> ${student.email}</p>
                <p><strong>Age:</strong> ${student.age}</p>
                <p><strong>Percentage:</strong> ${percentage != null ? percentage + '%' : 'N/A'}</p>
            </div>
        </div>

        <hr/>

        <h3>Assigned Departments</h3>

        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <ul class="list-group mb-4">
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

        <div class="mt-4">
            <h5>Assign Subjects to Student</h5>
            <g:form controller="student" action="assignSubjects" class="row g-3">
                <g:hiddenField name="studentId" value="${student.id}"/>
                <div class="col-12">
                    <g:each in="${com.sms.Subject.list()}" var="subject">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="subjectIds" value="${subject.id}" id="subject_${subject.id}">
                            <label class="form-check-label" for="subject_${subject.id}">${subject.name}</label>
                        </div>
                    </g:each>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Assign Selected Subjects</button>
                </div>
            </g:form>
        </div>
            <h5>Assign to New Department</h5>
            <g:form controller="department" action="saveAssignment" class="row g-3">
                <g:hiddenField name="studentId" value="${student.id}"/>
                <g:hiddenField name="redirectController" value="student"/>
                <g:hiddenField name="redirectAction" value="show"/>
                
                <div class="col-auto">
                    <g:select name="departmentId"
                              from="${allDepartments}"
                              optionKey="id"
                              optionValue="name"
                              noSelection="['': 'Select Department']"
                              class="form-select"/>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-success">
                        <i class="fa fa-plus-lg"></i>
                        Add
                    </button>
                </div>
            </g:form>
        </div>
        <div class="mt-4">
            <h5 style="text-align: center;">Subject Marks</h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Marks</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${subjectMarks}" var="sm">
                        <tr>
                            <td>${sm.subject.name}</td>
                            <td>
                                <g:form controller="student" action="updateSubjectMark" method="POST" style="display:inline;">
                                    <g:hiddenField name="id" value="${sm.id}"/>
                                    <g:hiddenField name="studentId" value="${student.id}"/>
                                    <input type="number" name="marks" value="${sm.marks}" min="0" class="form-control d-inline-block" style="width:80px; display:inline;" required/>
                                    <button type="submit" class="btn btn-success btn-sm ms-1">Update</button>
                                </g:form>
                            </td>
                            <td>${sm.total}</td>
                            <td>
                                <g:form controller="student" action="deleteSubjectMark" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this subject mark?');">
                                    <g:hiddenField name="id" value="${sm.id}"/>
                                    <g:hiddenField name="studentId" value="${student.id}"/>
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>
                    <g:if test="${!subjectMarks}">
                        <tr><td colspan="4" class="text-muted">No subject marks entered yet.</td></tr>
                    </g:if>
                </tbody>
            </table>
        </div>
    </div>
</div>