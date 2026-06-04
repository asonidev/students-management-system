<meta name="layout" content="main"/>

<div class="container-fluid">

    <div class="card p-5 custom-shadow">

        <%-- <h2 class="mb-4">
            Assign Student To Department
        </h2> --%>
        <h2 class="mb-4">
    <g:message code="department.assignment.create.title" default="Assign Student To Department" />
</h2>

        <!-- SUCCESS -->

        <g:if test="${flash.message}">

            <div class="alert alert-success">

                ${flash.message}

            </div>

        </g:if>

        <!-- ERROR -->

        <g:if test="${flash.error}">

            <div class="alert alert-danger">

                ${flash.error}

            </div>

        </g:if>

        <g:form controller="department"
                action="saveAssignment">

            <!-- STUDENT -->

            <div class="mb-4">

                <%-- <label class="fw-bold">
                    Select Student
                </label> --%>
                <label class="fw-bold">
    <g:message code="department.assignment.student.select.label" default="Select Student" />
</label>

                <g:select
                        name="studentId"
                        from="${students}"
                        optionKey="id"
                        optionValue="${{
                            it.firstName + ' ' +
                            it.lastName
                        }}"
                        noSelection="[
                            '':'Select Student'
                        ]"
                        class="form-control"/>

                <small class="text-danger">

                    <%-- Please choose a valid student --%>

                </small>

            </div>

            <!-- DEPARTMENT -->

            <div class="mb-4">

                <%-- <label class="fw-bold">
                    Select Department
                </label> --%>
                <label class="fw-bold">
    <g:message code="department.assignment.department.select.label" default="Select Department" />
</label>

                <g:select
                        name="departmentId"
                        from="${departments}"
                        optionKey="id"
                        optionValue="name"
                        noSelection="[
                            '':'Select Department'
                        ]"
                        class="form-control"/>

                <small class="text-danger">

                    <%-- Please choose a department --%>

                </small>

            </div>

            <%-- <button class="btn btn-primary px-5">

                Assign Student

            </button> --%>
            <button class="btn btn-primary px-5">
    <g:message code="department.assignment.button.assign" default="Assign Student" />
</button>

        </g:form>

    </div>

</div>