<g:link controller="department" action="export">
        <i class="fa fa-file-excel"></i>
        Export Students to Excel
    </g:link>
<!DOCTYPE html>
<html>
<head>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">

    <title>
        Student Management System
    </title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Font Awesome -->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          rel="stylesheet">

    <style>

        body{
            margin:0;
            padding:0;
            background:#edf2f7;
            font-family:Arial, sans-serif;
        }

        .sidebar{

            width:250px;
            height:100vh;
            position:fixed;
            background:#0f172a;
            color:white;
            left:0;
            top:0;
            padding-top:20px;
        }

        .sidebar h2{

            text-align:center;
            margin-bottom:40px;
            color:#38bdf8;
            font-weight:bold;
        }

        .sidebar a{

            display:block;
            color:white;
            text-decoration:none;
            padding:15px 25px;
            transition:0.3s;
        }

        .sidebar a:hover{

            background:#2563eb;
        }

        .main-content{

            margin-left:250px;
            padding:30px;
        }

        .dashboard-card{

            border:none;
            border-radius:15px;
            color:white;
            padding:30px;
            transition:0.3s;
        }

        .dashboard-card:hover{

            transform:translateY(-5px);
        }

        .student-card{

            background:linear-gradient(135deg,#2563eb,#1d4ed8);
        }

        .department-card{

            background:linear-gradient(135deg,#059669,#047857);
        }

        .card{

            border:none;
            border-radius:15px;
            background:white;
        }

        .table{

            background:white;
            border-radius:10px;
            overflow:hidden;
        }

        .btn{

            border-radius:10px;
        }

        .form-control{

            border-radius:10px;
            padding:12px;
        }

        .page-title{

            font-weight:bold;
            margin-bottom:20px;
        }

        .custom-header{

            background:white;
            padding:20px;
            border-radius:15px;
            margin-bottom:20px;
        }

        .custom-shadow{

            box-shadow:0 4px 15px rgba(0,0,0,0.1);
        }

        .subject-card {
            background: linear-gradient(135deg, #6d28d9, #312e81);
            border-left: 6px solid #a78bfa;
            color: #f3f4f6;
        }
        .subject-card h2, .subject-card p {
            color: #f3f4f6;
        }

    </style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h2>
        SMS
    </h2>

    <a href="/">
        <i class="fa fa-home"></i>
        Dashboard
    </a>

    <a href="/student/index">
        <i class="fa fa-user-graduate"></i>
        Students
    </a>

    <g:link controller="department" action="index">
        <i class="fa fa-building"></i>
        Departments
    </g:link>

    <g:link controller="department" action="assignStudent">
        <i class="fa fa-link"></i>
        Assign Student
    </g:link>

    <g:link controller="department" action="assignments">
        <i class="fa fa-table"></i>
        Assignments
    </g:link>

    <g:link controller="subject" action="index">
        <i class="fa fa-book"></i>
        Subjects
    </g:link>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <g:layoutBody/>

</div>

</body>
</html>