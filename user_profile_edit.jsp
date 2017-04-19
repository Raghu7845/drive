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
        
        <!-- Calender -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
        
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
                            Edit Profile
                            <small></small>
                    </h1>
				
                    <ol class="breadcrumb">
                       <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                       <li class="active">Home</li>
                   </ol> 
		</section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-warning">
                                <form name="profile" id="profile_form">
                                <input type="hidden" name="id" value="${usm.userId}">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"><strong>Edit Profile</strong></h3>
                                    </div>
                                    <div class="box-body">
                                        <table class="table table-striped" cellspacing="0" width="100%">
                                            <thead>
                                                <tr class="form-group">
                                                        <td>First Name</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="first_name" type="text" class="form-control validate[required] text-input" value="${usm.firstName}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Last Name</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="last_name" type="text" class="form-control validate[required] text-input" value="${usm.lastName}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Date of Birth</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
                                                                <input name="dob" id="date_of_birth" type="text" class="form-control validate[required] text-input" value="${usm.dob}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                     
                                                <tr class="form-group">
                                                        <td>Mobile</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="mobile" type="text" pattern="[7-9][0-9]{9}" maxlength="10" class="form-control validate[required] text-input" value="${usm.mobile}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Father Name</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="father_name" type="text" class="form-control validate[required] text-input" value="${usm.fatherName}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Mother Name</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="mother_name" type="text" class="form-control validate[required] text-input" value="${usm.motherName}"/>
                                                            </div>
                                                        </td>
                                                </tr>
                                                <tr class="form-group">
                                                        <td>Address</td>
                                                        <td>:</td>
                                                        <td>
                                                            <div class="form-input col-md-6">								
								<input name="address" type="text" class="form-control validate[required] text-input" value="${usm.address}"/>
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
                                                    <input name="update_profile" id="submit"  type="submit" class="btn btn-success" value="UPDATE" />

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
        
        <!-- Calender -->
        <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
        
         <script>
            $('#date_of_birth').datepicker({
                            format: 'yyyy-mm-dd'
                    });
        </script>
       
        <script type="text/javascript">
        $(document).ready(function() {
	        $("#submit").click(function(e){
	        	$("#profile_form").validationEngine('attach', {
	    			onValidationComplete: function(form, status){
	    				if (status == true) {
                                            $('#submit').prop('disabled', true);
                                            console.log("ajax");
                                            console.log("details = "+$('#profile_form').serialize());
                                            
		    		            $.ajax({
		    		                 
		    		                 type: "post",
		    		                 url: "ProfileUpdateCtrler",
		    		                 data: $('#profile_form').serialize(),
		    		                 
		    		                 success: function(response) {
		    		                         
		    		                         var data=JSON.parse(response);
		    		                         console.log(data.status);
		    		                     
		    		                      if(data.status=="SUCCESS"){
		    		                          	$("#spanMessage").html('<div class="alert alert-success"><strong>Success! </strong>Redirecting...</div>').fadeIn();
		    			                		window.location.href ='UserViewCtrler?type=users&user_id='+${usm.userId};
		    		                                      
		    		                      }
		    		                      else{
		    		                    	  $('#submit').prop('disabled', false);
		    		                    	  $("#spanMessage").html('<div class="alert alert-error"><strong>Error! </strong>'+data.message+'</strong></div>').fadeOut(5000);	    			                    		                         
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
