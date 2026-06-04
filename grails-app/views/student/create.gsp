<meta name="layout" content="main"/>

<div class="container-fluid">

    <div class="card custom-shadow p-5">

        <%-- <h2 class="mb-4">
            Add Student
        </h2> --%>
        <h2 class="mb-4">
    <g:message code="student.create.title" default="Add Student" />
</h2>

        <g:hasErrors bean="${student}">

    <div class="alert alert-danger">

        <ul>

            <g:eachError bean="${student}" var="error">

                <li>

                    <g:message error="${error}"/>

                </li>

            </g:eachError>

        </ul>

    </div>

</g:hasErrors>

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

        <g:form controller="student"
                action="save">

            <!-- FIRST NAME -->

            <div class="mb-3">

                <%-- <label class="fw-bold">
                    First Name
                </label> --%>
                <label class="fw-bold">
    <g:message code="student.firstName.label" default="First Name" />
</label>

                <input type="text"
                       name="firstName"
                       value="${student?.firstName}"
                       class="form-control"
                       placeholder="Enter First Name"/>

                <small class="text-danger">

                    <%-- Must contain 3 to 30 characters --%>

                </small>

            </div>

            <!-- LAST NAME -->

            <div class="mb-3">

                <label class="fw-bold">
    <g:message code="student.lastName.label" default="Last Name" />
</label>

                <input type="text"
                       name="lastName"
                       value="${student?.lastName}"
                       class="form-control"
                       placeholder="Enter Last Name"/>

                <small class="text-danger">

                    <%-- Must contain minimum 2 characters --%>

                </small>

            </div>

            <!-- EMAIL -->

            <div class="mb-3">

                <label class="fw-bold">
    <g:message code="student.email.label" default="Email" />
</label>

                <input type="email"
                       name="email"
                       value="${student?.email}"
                       class="form-control"
                       placeholder="Enter Valid Email"/>

                <small class="text-danger">

                    <%-- Please enter a valid email address --%>

                </small>

            </div>

            <!-- AGE -->

            <div class="mb-4">

                <label class="fw-bold">
    <g:message code="student.age.label" default="Age" />
</label>

                <input type="number"
                       name="age"
                       value="${student?.age}"
                       class="form-control"
                       placeholder="Enter Age"/>

                <small class="text-danger">

                    <%-- Age must be between 18 and 60 --%>

                </small>

            </div>

            <button class="btn btn-primary px-5">

                <g:message code="student.create.button" default="Create Student" />

            </button>

        </g:form>

    </div>

</div>