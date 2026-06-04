<meta name="layout" content="main"/>

<div class="container-fluid">

    <div class="card custom-shadow p-5">

        <%-- <h2 class="mb-4">
            Add Department
        </h2> --%>
        <h2 class="mb-4">
        <g:message code="department.create.title" default="Add Department" />
        </h2>

        <g:hasErrors bean="${department}">

    <div class="alert alert-danger">

        <ul>

            <g:eachError bean="${department}" var="error">

                <li>

                    <g:message error="${error}"/>

                </li>

            </g:eachError>

        </ul>

    </div>

</g:hasErrors>

        <g:if test="${flash.message}">

            <div class="alert alert-success">

                ${flash.message}

            </div>

        </g:if>

        <g:if test="${flash.error}">

            <div class="alert alert-danger">

                ${flash.error}

            </div>

        </g:if>

        <g:form controller="department"
                action="save">

            <!-- NAME -->

            <div class="mb-3">

                <%-- <label class="fw-bold">
                    Department Name
                </label> --%>
                <label class="fw-bold">
    <g:message code="department.name.label" default="Department Name" />
</label>

                <input type="text"
                       name="name"
                       value="${department?.name}"
                       class="form-control"
                       placeholder="Enter Department Name"/>

                <small class="text-danger">

                    <%-- Minimum 3 characters required --%>

                </small>

            </div>

            <!-- CODE -->

            <div class="mb-4">

                <%-- <label class="fw-bold">
                    Department Code
                </label> --%>
                <label class="fw-bold">
    <g:message code="department.code.label" default="Department Code" />
</label>

                <input type="text"
                       name="code"
                       value="${department?.code}"
                       class="form-control"
                       placeholder="Example: CSE"/>

                <small class="text-danger">

                    <%-- Only capital letters allowed (2-5 chars) --%>

                </small>

            </div>

            <%-- <button class="btn btn-success px-5">

                Save Department

            </button> --%>
            <button class="btn btn-success px-5">
    <g:message code="department.button.save" default="Save Department" />
</button>

        </g:form>

    </div>

</div>