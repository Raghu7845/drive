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
        
        <!-- Input fileld validation -->
	<link rel="stylesheet" href="css/validationEngine.jquery.css">
        
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
            <jsp:include page="employee_sidebar.jsp" />


            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                            Edit Salary
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
                                            <span class="fa fa-phone margin-r-5"></span> <b> Mobile</b> <a class="pull-right">${usm.mobile}</a>
                                        </li>
                                        <%if (request.getAttribute("status").equals("ACTIVE")){ %>
	                                    	<li class="list-group-item">
	                                            <span class="fa fa-phone margin-r-5"></span> <b> Status</b> <label class="label label-success pull-right">ACTIVE</label>
	                                        </li>
	                                    	<a href="InactiveCtrler?type=employee&id=${usm.userId}" class="btn btn-danger btn-block"><span class="glyphicon glyphicon-edit"></span>INACTIVATE</a>
                                		<%}else{ %>
	                                		<li class="list-group-item">
	                                            <span class="fa fa-phone margin-r-5"></span> <b> Status</b> <label class="label label-danger pull-right">INACTIVE</label>
	                                        </li>
	                                    	<a href="InactiveCtrler?type=employee&id=${usm.userId}" class="btn btn-success btn-block"><span class="glyphicon glyphicon-edit"></span>ACTIVATE</a>
                                		<%} %>
                                    </ul>                          
                                    
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
                                <form name="salary" id="salary_form">
                                <input type="hidden" name="id" value="${usm.userId}">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"><strong>Salary Details</strong></h3>
                                    </div>
                                    <div class="box-body">
                                        <table class="table table-striped" cellspacing="0" width="100%">
                                            <thead>
                                                <tr class="form-group">
                                                        <td>Basic Pay</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="basic_pay" type="number" onblur="calc()" class="form-control validate[required] text-input" value="${usm.basicPay}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>House Rent Allowance</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="hra" id=hra type="number" class="form-control validate[required] text-input" value="${usm.hra}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Dearness Allowance</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="da" id=da type="number" class="form-control validate[required] text-input" value="${usm.da}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>General Provident Fund</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="gpf" id=gpf type="number" class="form-control validate[required] text-input" value="${usm.gpf}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Income Tax</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="it" id=it type="number" class="form-control validate[required] text-input" value="${usm.IT}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Misc Allowence</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="misc" type="number" onblur="calc()" class="form-control validate[required] text-input" value="${usm.miscAllowance}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Central Government Health Scheme</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="cgps" id=cghs type="number" class="form-control validate[required] text-input" value="${usm.cghs}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Bonus</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="bonus" type="number" class="form-control validate[required] text-input" value="${usm.bonus}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Net Salary</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="net_sal" id=net type="number" class="form-control validate[required] text-input" value="${usm.netSalary}" disabled="disabled"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="box-footer">
                                        <div class="container">
                                            <div class="row">
                                                <div class="text-center">
                                                    <input name="update_salary" id="submit"  type="submit" class="btn btn-success" value="UPDATE" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
           
                                    
                                </form>
                                <div id="spanMessage"></div>
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
        
        <script src="script/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
		</script>
	<script src="script/jquery.validate.min.js" type="text/javascript" charset="utf-8">
		</script>
		
		  <!-- Bootstrap 3.3.6 -->
        <script src="admin_lte/bootstrap/js/bootstrap.min.js"></script>
        
        <!-- AdminLTE App -->
        <script src="admin_lte/dist/js/app.min.js"></script>
        <script type="text/javascript">
         function calc(){
        	var basic=parseInt(salary.basic_pay.value);
        	var misc=parseInt(salary.misc.value);
           	var tot=basic+misc;
        	var it=parseInt(tot)*0.2;
        	var cghs=parseInt(tot)*0.02;
        	var hra=parseInt(tot)*0.05;
        	var da=parseInt(tot)*0.05;
        	var bonus=parseInt(tot)*0.05;
        	var gpf=parseInt(tot)*0.1;
   			var net=tot+bonus+da+hra-it-cghs-gpf;
   			salary.cgps.value=cghs
   			salary.it.value=it
   			salary.hra.value=hra
   			salary.da.value=da
   			salary.bonus.value=bonus
   			salary.net_sal.value=net
   			salary.gpf.value=gpf
         }
        </script>
        <script type="text/javascript">
        $(document).ready(function() {
	        $("#submit").click(function(e){
	        	$("#salary_form").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
                                            $('#submit').prop('disabled', true);
                                            console.log("ajax");
                                            console.log("details = "+$('#salary_form').serialize());
                                            
		    		            $.ajax({
		    		                 
		    		                 type: "post",
		    		                 url: "SalaryUpdateCtrler",
		    		                 data: $('#salary_form').serialize(),
		    		                 
		    		                 success: function(response) {
		    		                         
		    		                         var data=JSON.parse(response);
		    		                         console.log(data.status);
		    		                     
		    		                      if(data.status=="SUCCESS"){
		    		                          	$("#spanMessage").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
		    			                		window.location.href ='UserViewCtrler?type=employee&user_id='+${usm.userId};
		    		                                      
		    		                      }
		    		                      else{
		    		                    	  $('#submit').prop('disabled', false);
		    		                    	  $("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>Registration failed</div>').fadeOut(5000);	    			                    		                         
		    		                  	}
		    		                                    
		    		                 },
		    		      
		    		             });
   				}
	    					
	    			},
	    			promptPosition : "topRight",
	    			scroll: false
	    		}); 
        	 
	        });

	    });
        
        </script>
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
