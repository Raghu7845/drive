<%-- 
    Document   : master
    Created on : Sep 18, 2016, 6:20:34 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
     	<style>
        
			
			input.invalid, textarea.invalid{
				border: 2px solid red;
			}
			
			input.valid, textarea.valid{
				border: 2px solid green;
			}
        	
		</style> 

        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<%if(session.getAttribute("login")!=null){ %>
<body class="skin-blue">
	<div class="wrapper">
		<!-- Header -->
		
        <jsp:include page="header.jsp" />

		
		<!-- Sidebar -->
		<jsp:include page="admin_sidebar.jsp" />


		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					New Employee
					<small></small>
				</h1>
				
				 <ol class="breadcrumb">
                                    <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                                    <li class="active">Home</li>
				</ol> 
			</section>
			<section class="content">
				<div class="col-md-6">
					<div class="box box-primary">
            			<div class="box-header with-border">
              				<h3 class="box-title">New Employee</h3>
            			</div>
            			<!-- /.box-header -->
            			<!-- form start -->
            			<form role="form" name="employee" id="employee_form">
              				<div class="box-body">
                				<div class="form-group">
                				<input type="hidden" name="type" value="DEPARTMENT">
                  					<label for="email">Email address</label>
                  					<input type="email" class="form-control validate[required] email-input" name="email" id="email" onblur="checkMail()" placeholder="Enter email">
                  					<span id="spanMessage1"></span>
                				</div>
                				<div class="form-group">
                  					<label for="FirstName">FirstName</label>
                  					<input type="text" class="form-control validate[required] text-input" name="fname" id="fname" placeholder="First Name">
                				</div>
                				<div class="form-group">
                  					<label for="GENDER">Gender</label>
                  					<select class="form-control" name="sex">
  									<option value="MALE">Male</option>
  									<option value="FEMALE">Female</option>
  									<option value="OTHER">Other</option>
                  					</select>
                				</div>
                				<div class="form-group">
                  					<label for="password">Password</label>
                  					<input type="password" class="form-control validate[required] text-input" name="password" id="password" placeholder="Password">
                				</div>
                				<div class="form-group has-feedback">
                					<label for="number">Mobile Number</label>
        							<input id="number" type="text" name="number" pattern="[7-9][0-9]{9}" maxlength="10" class="form-control validate[required] text-input" placeholder="Mobile Number" >
        						</div>
                        	</div>
              				<!-- /.box-body -->

              				<div class="box-footer">
                				<button type="submit" id="submit" class="btn btn-primary">Submit</button>
                				<span id="spanMessage"></span>
              				</div>
            			</form>
          			</div>
				</div>
                                
			</section><!-- /.content -->
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
        
	        function checkMail(){
	        	var email=employee.email.value;
	        
	        	$.ajax({
	                
	                type: "post",
	                url: "NewEmployeeCtrler",
	                data:{email:email},
		        	success: function(response){
		        		var data=JSON.parse(response);
		        		if(data.status=="SUCCESS"){
		        			$('#email').removeClass("valid").addClass("invalid");
		        			$("#spanMessage1").html("Email already exists");
		        			$('#submit').prop('disabled', true);
		        				                                                               
	                    }
		        		else{
		        			$('#email').removeClass("invalid").addClass("valid");
		        			$("#spanMessage1").html("");
		        			$('#submit').prop('disabled', false);
		        		}
		        		
		        	}
		        });
	        }
	      
        </script>
         <script type="text/javascript">
        $(document).ready(function() {
	        $("#submit").click(function(e){
	        	$("#employee_form").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
	    					
	    		            console.log("ajax");
	    		            $('#submit').prop('disabled', true);
		    		            $.ajax({
		    		                 
		    		                 type: "post",
		    		                 url: "NewEmployeeCtrler",
		    		                 data: $('#employee_form').serialize(),
		    		                 
		    		                 success: function(response) {
		    		                         
		    		                         var data=JSON.parse(response);
		    		                         console.log(data.status);
		    		                     
		    		                      if(data.status=="SUCCESS"){
		    		                          	$("#spanMessage").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
		    		                          	setTimeout(function(){
			    			                		   window.location.href ="admin_master.jsp";
			    	                			   }, 2000);
		    		                                      
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
