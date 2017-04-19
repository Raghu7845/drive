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
        
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

        
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
					Dashboard
					<small>Charts</small>
				</h1>
				
				 <ol class="breadcrumb">
                    <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                    <li class="active">Home</li>
				</ol> 
			</section>
			<section class="content">
				<div class="col-md-12">
					<div class="box box-primary">
	                    <div class="box-header with-border">
	                        <h3 class="box-title"><strong>Salary Chart</strong></h3>
	
	                        <div class="box-tools pull-right">
	                            <select id="year_combo">
								  
								</select>
	                        </div>
	                    </div>
	                    <div class="box-body">
	                    	<div id="barchart" ></div>
	                    </div>
	            	</div>    
	            	<div class="box box-success">
	                    <div class="box-header with-border">
	                        <h3 class="box-title"><strong>Users Chart</strong></h3>
	
	                    </div>
	                    <div class="box-body">
	                    	<div id="donut-example"></div>
	                    </div>
	            	</div>      
				</div>
				
                
			</section><!-- /.content -->
		</div><!-- /.content-wrapper -->

		<!-- Footer -->
		<jsp:include page="footer.jsp" />
	</div><!-- ./wrapper -->
	
	<!-- Scripts -->
        <script src="plugins/jQuery/jquery.js"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	
        
        <!-- Bootstrap 3.3.6 -->
        <script src="admin_lte/bootstrap/js/bootstrap.min.js"></script>
        
        <!-- AdminLTE App -->
        <script src="admin_lte/dist/js/app.min.js"></script>
        
        <script type="text/javascript">
	        $(document).ready(function(){
	   			$.ajax({               
	            	type: "post",
	                url: "BarGraphYearController",              
	            	success: function(response) {	
	            		var data=JSON.parse(response);
	                    console.log(data);
	                    for (i = 0; i < data.length; i++) { 
	                    	var day = new Date(data[i]);
	                        var year = day.getFullYear();	            		   
	             		   console.log("year = "+year);
	             		   if(i == 0){
	             			  getBarChartData(year);
	             			  $("#year_combo").append('<option selected="selected" value="' + year + '">' + year + '</option>');
	             		   }
	             		   else{
	             			  $("#year_combo").append('<option value="' + year + '">' + year + '</option>');
	             		   }	             		   
	             		}                      
	            	},
	        	});
	   			var barChart = Morris.Bar({
	       			  element: 'barchart',
	       			  
	       			  xkey: 'month',
	       			  ykeys: ['net_salary','IT'],
	       			  labels: ['Net Salary','Net IT Paid']
	       			});

	       			$("#year_combo").change(function() {
	       				console.log("selected"+$('#year_combo').val());
	       				getBarChartData($('#year_combo').val());
	       			});
	       			function getBarChartData(year){
	       				$.ajax({
		                    
			            	type: "post",
			                url: "BarGraphController",  
			                data: { year:year},
			            	success: function(response) {	    	                    	
		                        var data=JSON.parse(response);
		                        console.log(data);
			                        
			                   if(data.status=="SUCCESS"){
			                	   <% session.setAttribute("login","login");%>
			                	   barChart.setData([
			                	            	{ "month": "Jan", "net_salary":data.netsalary1, "IT": data.it1 },
			                	            	{ "month": "Feb", "net_salary":data.netsalary2, "IT": data.it2 },
			                	            	{ "month": "Mar", "net_salary":data.netsalary3, "IT": data.it3 },
			                	            	{ "month": "Apr", "net_salary":data.netsalary4, "IT": data.it4 },
			                	            	{ "month": "May", "net_salary":data.netsalary5, "IT": data.it5 },
			                	            	{ "month": "June", "net_salary":data.netsalary6, "IT": data.it6 },
			                	            	{ "month": "July", "net_salary":data.netsalary7, "IT": data.it7 },
			                	            	{ "month": "Aug", "net_salary":data.netsalary8, "IT": data.it8 },
			                	            	{ "month": "Sep", "net_salary":data.netsalary9, "IT": data.it9 },
			                	            	{ "month": "Oct", "net_salary":data.netsalary10, "IT": data.it10 },
			                	            	{ "month": "Nov", "net_salary":data.netsalary11, "IT": data.it11 },
			                	            	{ "month": "Dec", "net_salary":data.netsalary12, "IT": data.it12 }
			                	            	
			                	            	]);	                            
			                    }
			            	},
			        	});
	       			}
	       			
	   		});	
        </script>
       
       <script type="text/javascript">
       		$(document).ready(function(){
       			
       		});	 
       </script>

        <script>
         Morris.Donut({
            element: 'donut-example',
            data: [
              {label: "Users", value:<%=session.getAttribute("user")%>},
              {label: "Employees", value:<%=session.getAttribute("emp")%> }
            ]
          });     
         console.log(<%=session.getAttribute("emp")%>);
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
