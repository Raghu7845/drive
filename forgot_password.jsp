<%-- 
    Document   : forgot_password
    Created on : Sep 19, 2016, 1:31:47 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        
         <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="admin_lte/bootstrap/css/bootstrap.min.css">
        
       	<!-- Font Awesome -->
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  		
  		<!-- Ionicons -->
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        
        <!-- Theme style -->
        <link rel="stylesheet" href="admin_lte/dist/css/AdminLTE.min.css">
        
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        
        <!-- Input fileld validation -->
		<link rel="stylesheet" href="css/validationEngine.jquery.css">
       
            
            
    </head>
    <body class="hold-transition login-page">
    
        <div class="login-box">
            <div class="login-logo">
                <b>Income Tax</b>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Forgot Password</p>

                <form name=forgot id=forgot_password>
                    <div class="form-group has-feedback">
                        <input id="email" name=email type="email" class="form-control validate[required] email-input" placeholder="Email" >
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="text" id="mobile" name="mobile" pattern="[7-9][0-9]{9}" maxlength="10" class="form-control validate[required] text-input" placeholder="Mobile Number" >
        				<span class="form-control-feedback"><i class="fa fa-mobile"></i></span>
                    </div>  
                    <div class="row">
                        <!-- /.col -->
                        <div id="submit"  class="col-xs-4">
                            <button type="submit" id="check_credentials"  class="btn btn-primary btn-block btn-flat ">Reset</button>
                        </div>
                        <br>
                        <!-- /.col -->
                    </div>
                    <div id="spanMessage"></div>
                    <div id="new_password" style="display: none">
                        <label>Enter New Password</label>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" name="password" placeholder="New Password">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div> 
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" name="password1" placeholder="Confirm Password">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>                        </div> 
                        <div class="row">
                            <!-- /.col -->
                            <div id="reset_submit" class="col-xs-4">
                                <button type="submit" id="reset_password" class="btn btn-primary btn-block btn-flat ">Submit</button>
                            </div>
                            
                            <!-- /.col -->
                        </div>
                        <br>
                        <div id="spanMessage1"></div>
                    </div>    
                    
                </form>
                <br>
                <a href="index.jsp" class="text-center">Back to Login page</a>
            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->
        
       
        <!-- jQuery 2.2.3 -->
        <script src="admin_lte/plugins/jQuery/jquery-2.2.3.min.js"></script>
        
        <!-- Bootstrap 3.3.6 -->
        <script src="admin_lte/bootstrap/js/bootstrap.min.js"></script>
        
        <script src="script/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
		</script>
		<script src="script/jquery.validate.min.js" type="text/javascript" charset="utf-8">
		</script>
        
        <!-- iCheck -->
        <script src="admin_lte/plugins/iCheck/icheck.min.js"></script>
        
        <script type="text/javascript">
        $(document).ready(function(){
        	$("#check_credentials").click(function(e){
        		$("#forgot_password").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
        					var email=forgot.email.value;
        	 				var mobile=forgot.mobile.value;
        	 	
			        	 	$.ajax({
			                 
				            	type: "post",
				                url: "ForgotCtrler",
				                data: { email:email,
			                            mobile:mobile                            
			                            },
			              
				            	success: function(response) {
			                 	console.log(response);
			                     var data=JSON.parse(response);
			                     console.log(data.status);
			                     if(data.status=="SUCCESS"){
			                    	showPasswordInput();	 
			                     }
			                     else
			                    	 $("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>Wrong credentials</div>').fadeOut(5000);
			                    	
			                     }
			         		});
	    				}
	    			},
	    			promptPosition : "topRight",
	    			scroll: false
        		});    
	        });	   
        });	
	    </script>
        
        <script>
        $(document).ready(function(){
        	$("#reset_password").click(function(e){
        	 	console.log("inside");
        	 	var password=forgot.password.value;
        	 	var password1=forgot.password1.value;
        	 	var email=forgot.email.value;
        	 
        	 	if(password == ''){
        		 	$("#spanMessage1").html("Password is empty").fadeOut(5000);
        	 	}
        	 	else if(password1!=password){
        		 	$("#spanMessage1").html("Password mismatch").fadeOut(5000);
        	 	}
        	 	else{
        		 	$.ajax({
                     
		            	type: "post",
		                url: "ForgotCtrler",
		                data: { email:email,
	                            password:password},
	                    success:function(response){
	                    	var data=JSON.parse(response);
	                        console.log(data.status);
		                        
		                   if(data.status=="SUCCESS"){
		                   		$("#spanMessage1").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
		                	   	setTimeout(function(){
		                		   window.location.href ="index.jsp";
                			   }, 2000);                	   
	                    	}
		                   	else{
		                    	$("#spanMessage1").html('<div class="alert alert-error"><strong>Error! </strong>Password not updated</div>').fadeOut(5000); 
		                   	}
		            	}
        		 	});        		 
        	 	}
         	});	
        });	
        </script>
        <script>
            function showPasswordInput() {
                $('#submit').hide();
                $( "#email" ).prop( "disabled", true );
                $( "#mobile" ).prop( "disabled", true );
                $('#new_password').show();
            }
        </script>    
        
    </body>
</html>

