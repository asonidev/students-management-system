<meta name="layout" content="main"/>

<div class="container-fluid">

    <div class="custom-header custom-shadow">

        <h1 class="page-title">
            Student Management Dashboard
        </h1>

        <p class="text-muted">
            Welcome to Student Management System
        </p>

    </div>

    <div class="row g-4">

        <!-- STUDENT CARD -->

        <div class="col-md-6">

            <div class="dashboard-card student-card custom-shadow">

                <div class="d-flex justify-content-between">

                    <div>

                        <h2>
                            Students
                        </h2>

                        <p>
                            Manage student records
                        </p>

                    </div>

                    <i class="fa fa-user-graduate fa-4x"></i>

                </div>

                <a href="/student/index"
                   class="btn btn-light mt-4">

                    Manage Students

                </a>

            </div>

        </div>


        <!-- SUBJECT CARD -->
        <div class="col-md-6">
            <div class="dashboard-card subject-card custom-shadow">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2>Subjects</h2>
                        <p>Manage subjects and max marks</p>
                    </div>
                    <i class="fa fa-book fa-4x"></i>
                </div>
                <a href="/subject/index" class="btn btn-light mt-4">Manage Subjects</a>
            </div>
        </div>

        <!-- DEPARTMENT CARD -->

        <div class="col-md-6">

            <div class="dashboard-card department-card custom-shadow">

                <div class="d-flex justify-content-between">

                    <div>

                        <h2>
                            Departments
                        </h2>

                        <p>
                            Manage departments
                        </p>

                    </div>

                    <i class="fa fa-building fa-4x"></i>

                </div>

                <a href="/department/index"
                   class="btn btn-light mt-4">

                    Manage Departments

                </a>

            </div>

        </div>

    </div>

</div>