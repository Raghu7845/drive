
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="admin_lte/bootstrap/css/bootstrap.min.css">
        
       	<!-- Font Awesome -->
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  		
  		<!-- Ionicons -->
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        
        <!-- Theme style -->
        <link rel="stylesheet" href="admin_lte/dist/css/AdminLTE.min.css">
        
        <!-- iCheck -->
        <link rel="stylesheet" href="admin_lte/plugins/iCheck/square/blue.css">
        
        <!-- Input fileld validation -->
		<link rel="stylesheet" href="css/validationEngine.jquery.css">
        
         
         
	
</head>

<body class="hold-transition login-page" >
	
        <div class="login-box">
            <div class="login-logo" id="msg">
                <b>Income Tax</b>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Login</p>

                <form id=login_form>
                    <div class="form-group has-feedback">
                        <input type="email" id="email" name="email" class="form-control validate[required] email-input" placeholder="Email" >
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" id="password" name="password" class="form-control validate[required] text-input" placeholder="Password" >
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                                                       
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox" name="remember"> Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button id="submit" type="submit" value="Submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <div id="spanMessage"></div>
                <a href="forgot_password.jsp">I forgot my password</a><br>
                <a href="register.jsp" class="text-center">Sign Up</a>
            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->
        
        <!-- jQuery 2.2.3 -->
        <script src="admin_lte/plugins/jQuery/jquery-2.2.3.min.js"></script>
        
        <script src="script/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
		</script>
		<script src="script/jquery.validate.min.js" type="text/javascript" charset="utf-8">
		</script>
        
        <!-- Bootstrap 3.3.6 -->
        <script src="admin_lte/bootstrap/js/bootstrap.min.js"></script>
        
        <!-- iCheck -->
        <script src="admin_lte/plugins/iCheck/icheck.min.js"></script>
        
 
        
        <script type="text/javascript">
        $(document).ready(function(){
	    	$("#submit").click(function(e){
	    		
	    		$("#login_form").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
	    					var email = $("#email").val(); 
	    		            var password=$("#password").val();
	    		            console.log("ajax");
	    		            
	    		            $.ajax({
	    	                            
	    		            	type: "post",
	    		                url: "LoginCtrler",
	    		                data: { email:email,
	    	                            password:password},
	    	                 
	    		            	success: function(response) {	    	                    	
	    	                        var data=JSON.parse(response);
	    	                        console.log(data.status);
	    		                        
	    		                   if(data.status=="SUCCESS"){
	    		                	   <% session.setAttribute("login","login");%>
	    		                   		$("#spanMessage").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
	    		                   		setTimeout(function(){
		    		                   		window.location.href = 'MasterCtrler?user_id='+data.user_id;
	    	                			   }, 2000);                             
	    		                    }
	    		                    else{
	    		                    	$("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>'+data.message+'</div>').fadeOut(5000);
	    		                    	$('#email').val('');
	    		                    	$('#password').val('');
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
        
        <script>
        	$(function () {
            	$('input').iCheck({
              		checkboxClass: 'icheckbox_square-blue',
              		radioClass: 'iradio_square-blue',
              		increaseArea: '20%' // optional
            	});
          	});
        </script>
     </body>
</html>
