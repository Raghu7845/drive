<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
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
        <!-- Calender -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
            
        <style>
        	textarea {
    			resize: none;
			}
			
			input.invalid, textarea.invalid{
				border: 2px solid red;
			}
			
			input.valid, textarea.valid{
				border: 2px solid green;
			}
        	
		</style>    
	</head>
	<body class="hold-transition register-page">
		
		<div class="register-box">
  			<div class="register-logo">
    			<a href="index.jsp"><b>Income Tax</b></a>
  			</div>

  			<div class="register-box-body">
    			<p class="login-box-msg">New user</p>

    			<form id="register_form" name=register>
      				<div class="form-group has-feedback">
        				<input type="text" class="form-control validate[required] text-input" name="fname" placeholder="First Name" >
        				<span class="glyphicon glyphicon-user form-control-feedback"></span>
      				</div>
      				<div class="form-group has-feedback">
        				<input type="text" class="form-control validate[required] text-input" name="lname"placeholder="Last Name" >
        				<span class="glyphicon glyphicon-user form-control-feedback"></span>
      				</div>
      				<div class="form-group has-feedback">
        				<input id="email" type="email" class="form-control validate[required] email-input" name="email" placeholder="Email" onblur="checkMail()">
        				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        				<span id="spanMessage1"></span>
      				</div>
      				
      				<div class="form-group has-feedback">
        				<input id="password" type="password" class="form-control validate[required] text-input" name="password" placeholder="Password" >
        				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
      				</div>
      				<div class="form-group has-feedback">
        				<input id="confirm_password" type="password" class="form-control validate[required] text-input" onblur="checkPassword()" name="retypePassword" placeholder="Retype password">
        				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
        				<span id="spanMessage2"></span>
      				</div>
      				<div class="form-group has-feedback">
        				<input type="text" name="number" pattern="[7-9][0-9]{9}" maxlength="10" class="form-control validate[required] text-input" placeholder="Mobile Number" >
        				<span class="form-control-feedback"><i class="fa fa-mobile"></i></span>
      				</div>
      				<div class="form-group has-feedback">
        				<input type="text" id="date_of_birth" name=dob class="form-control validate[required] text-input" placeholder="Date Of Birth" >
        				
      				</div>
      				<div class="form-group has-feedback">
        				<select class="form-control" name="sex">
  							<option value="MALE">Male</option>
  							<option value="FEMALE">Female</option>
  							<option value="OTHER">Other</option>
  						</select>
        				
      				</div>
      				<div class="form-group has-feedback">
        				<input type="text" name="father" class="form-control validate[required] text-input" placeholder="Father Name" >
        				
      				</div>
      				<div class="form-group has-feedback">
        				<input type="text" class="form-control validate[required] text-input" name="mother" placeholder="Mother Name" >
        				
      				</div>
      				<div class="form-group has-feedback">
        				<textarea rows="3" cols="50" name="addr" class="form-control validate[required] text-input" placeholder="Address"></textarea>
        				
      				</div>
      				<div class="row">
        			 <div class="col-xs-8">
          					<!-- <div class="checkbox icheck">
            					<label>
              						<div class="icheckbox_square-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div> I agree to the terms
            					</label>
          					</div>-->
        				</div>
                		<div class="col-xs-4">
          					<button type="submit" id="submit" class="btn btn-primary btn-block btn-flat">Register</button>
        				</div>
             		</div>
    			</form>
    			<div id="spanMessage"></div>

    			<a href="index.jsp" class="text-center">I already have a membership</a>
  			</div><!-- /.form-box -->
		</div>
		
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
        
        <!-- Calender -->
        <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
        
        <script type="text/javascript">
        
	        function checkMail(){
	        	var email=register.email.value;
	        
	        	$.ajax({
	                
	                type: "post",
	                url: "RegisterCtrler",
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
		        			$('#submit').prop('disabled', false);
		        		}
		        		
		        	}
		        });
	        }
	        function checkPassword(){
	        	var password=register.password.value;
	        	var retypePassword=register.retypePassword.value;
	        	if(password!=retypePassword){
	        		$('#spanMessage2').html("Password mismatch");
	        		$('#password').removeClass("valid").addClass("invalid");
	        		$('#confirm_password').removeClass("valid").addClass("invalid");
	        		$('#submit').prop('disabled', true);
	        		return false;
	        	}
	        	else{
	        		$('#password').removeClass("invalid").addClass("valid");
	        		$('#confirm_password').removeClass("invalid").addClass("valid");
	        		$('#submit').prop('disabled', false);
	        		return true;
	        	}
	        }
        </script>
        
            
        <script>
        	$('#date_of_birth').datepicker({
 		   		format: 'yyyy-mm-dd'
 			});
        
          	$(function () {
            	$('input').iCheck({
              		checkboxClass: 'icheckbox_square-blue',
              		radioClass: 'iradio_square-blue',
              		increaseArea: '20%' // optional
            	});
          	});
        </script>
        <script type="text/javascript">
        $(document).ready(function() {
	        $("#submit").click(function(e){
	        	$("#register_form").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
	    					
	    		            console.log("ajax");
	    		            if(checkPassword()){
		    		            $.ajax({
		    		                 
		    		                 type: "post",
		    		                 url: "RegisterCtrler",
		    		                 data: $('#register_form').serialize(),
		    		                 
		    		                 success: function(response) {
		    		                         
		    		                         var data=JSON.parse(response);
		    		                         console.log(data.status);
		    		                     
		    		                      if(data.status=="SUCCESS"){
		    		                          $("#spanMessage").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
		    		                          setTimeout(function(){
		    			                		   window.location.href ="index.jsp";
		    	                			   }, 2000); 
		    		                                      
		    		                      }
		    		                      else{
		    		                    	  $("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>Registration failed</div>').fadeOut(5000);	    			                    		                         
		    		                  	}
		    		                                    
		    		                 },
		    		      
		    		             });
	    		            }
	    		            else{
		                    	  $("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>Password mismatch</div>').fadeOut(5000);	    			                    		                         

	    		            }
	    				}
	    					
	    			},
	    			promptPosition : "topRight",
	    			scroll: false
	    		}); 
        	 
	        });

	    });
        
        </script>
	</body>
</html>