<%-- 
    Document   : master
    Created on : Sep 18, 2016, 6:20:34 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<title>Income Tax</title>

	 <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="admin_lte/bootstrap/css/bootstrap.min.css">

        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        
        <!-- Ionicons -->
        <link href="https://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        
        <!-- Theme style -->
        <link rel="stylesheet" href="admin_lte/dist/css/AdminLTE.min.css">
        
        <!-- Theme skin-blue -->
        <link rel="stylesheet" href="admin_lte/dist/css/skins/skin-blue.min.css">
        

        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
    </head>
    <body class="skin-blue">
    <%if(session.getAttribute("login")!=null){ %>
	<div class="wrapper">
            <!-- Header -->
            <jsp:include page="header.jsp" />

		
            <!-- Sidebar -->
           
            <jsp:include page="Users_sidebar.jsp" />
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                            View user
                            <small></small>
                    </h1>
				
                    <ol class="breadcrumb">
                       <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                       <li class="active">Home</li>
                   </ol> 
		</section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-3">
                        <!-- Profile Image -->
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <img class="profile-user-img img-responsive img-circle" src="img/avatar5.png" class="imgsize" />
                                    <h3 class="profile-username text-center">${usm.firstName}</h3>

                                    <p class="text-muted text-center">${usm.lastName}</p>
                                    
                                    <ul class="list-group list-group-unbordered">
                                        <li class="list-group-item">
                                            <span class="fa fa-child margin-r-5" aria-hidden="true"></span>
                                            <b>Gender</b> <a class="pull-right">
                                            <%! String gender="MALE"; %>
                               				<%if (request.getAttribute("gender").equals("MALE")){ %>
                                            <span class="fa fa-male margin-r-5"></span>Male
                                			<%}else{ %>
                                            <span class="fa fa-female margin-r-5"></span>Female
                                			<%} %>
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <span class="fa fa-calendar margin-r-5"></span> <b> DOB</b> <a class="pull-right">${usm.dob}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <span class="fa fa-phone margin-r-5"></span> <b> Mobile</b> <a class="pull-right"><%=request.getAttribute("mobile") %></a>
                                        </li>
                                    </ul>
                        			<a href="EditCtrler?type=user&id=${usm.userId}" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-edit"></span> Edit Profile</a>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <!-- Personal details Box -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Personal Details</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <strong><i class="fa fa-user margin-r-5"></i> Father Name</strong>
                                    <p class="text-muted">
                                        ${usm.fatherName}
                                    </p>
                                    <hr>
                                    <strong><i class="fa fa-user margin-r-5"></i> Mother Name</strong>
                                    <p class="text-muted">
                                        ${usm.motherName}
                                    </p>
                                    <hr>
                                    <strong><i class="fa fa-envelope margin-r-5"></i> Email</strong>
                                    <p class="text-muted">
                                        ${usm.email}
                                    </p>
                                    <hr>
                                    <strong><i class="fa fa-home margin-r-5"></i> Address</strong>
                                    <p class="text-muted">
                                        ${usm.address}
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                        <div class="col-md-9">
                            <div class="box box-warning">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><strong>Salary Details</strong></h3>

                                    <div class="box-tools pull-right">
                        
                                        
                                    </div>
                                </div>
				<div class="box-body">
                                    <table class="table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr class="form-group">
                                                    <td>Basic Pay</td>
                                                    <td>:</td>
                                                    <td>${usm.basicPay}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>House Rent Allowance</td>
                                                    <td>:</td>
                                                    <td> ${usm.hra}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Dearness Allowance</td>
                                                    <td>:</td>
                                                    <td>${usm.da}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>General Provident Fund</td>
                                                    <td>:</td>
                                                    <td>${usm.gpf}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Income Tax</td>
                                                    <td>:</td>
                                                    <td>${usm.IT}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Misc Allowance</td>
                                                    <td>:</td>
                                                    <td>${usm.miscAllowance}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Central Government Health Scheme</td>
                                                    <td>:</td>
                                                    <td>${usm.cghs}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Bonus</td>
                                                    <td>:</td>
                                                    <td>${usm.bonus}</td>
                                            </tr>
                                            <tr class="form-group">
                                                    <td>Net Salary</td>
                                                    <td>:</td>
                                                    <td>${usm.netSalary}</td>
                                            </tr>
                                        </thead>
                                    </table>
                        
			        </div>
                            </div>
                        </div>
                    </div><!-- /.row -->
                </section>
            </div><!-- /.content-wrapper -->

            <!-- Footer -->
            <jsp:include page="footer.jsp" />
	</div><!-- ./wrapper -->
	
	<!-- Scripts -->
        <script src="plugins/jQuery/jquery.js"></script>
		
		  <!-- Bootstrap 3.3.6 -->
        <script src="admin_lte/bootstrap/js/bootstrap.min.js"></script>
        
        <!-- AdminLTE App -->
        <script src="admin_lte/dist/js/app.min.js"></script>
               <%}else{%>
               <script type="text/javascript">
               window.onload = function() {
                   setTimeout(function() {
                       window.location = "index.jsp";
                   }, 1);
               };
               
           </script>
           <%}%>
    </body>
</html>
