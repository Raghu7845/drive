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
		<jsp:include page="employee_sidebar.jsp" />


		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					Title
					<small>Description</small>
				</h1>
				
				 <ol class="breadcrumb">
                                    <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                                    <li class="active">Home</li>
				</ol> 
			</section>
			<section class="content">
				<div id="myfirstchart" style="height: 250px;"></div>
                                <div id="donut-example"></div>
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
        <script>
            new Morris.Line({
                // ID of the element in which to draw the chart.
                element: 'myfirstchart',
                // Chart data records -- each entry in this array corresponds to a point on
                // the chart.
                data: [
                  { year: '2008-02', value: 20 },
                  { year: '2008-03', value: 50 },
                  { year: '2009-01', value: 260 }
                ],
                // The name of the data record attribute that contains x-values.
                xkey: 'year',
                // A list of names of data record attributes that contain y-values.
                ykeys: ['value'],
                // Labels for the ykeys -- will be displayed when you hover over the
                // chart.
                labels: ['Value']
              });
              
         Morris.Donut({
            element: 'donut-example',
            data: [
               {label: "Users", value:<%=session.getAttribute("user")%>},
              {label: "Employee", value:<%=session.getAttribute("emp")%> }
            ]
          });     
        </script>
         <%}else{%>
         <script type="text/javascript">
    window.onload = function() {
        setTimeout(function() {
            window.location = "index.jsp";
        },1);
    };
    
</script>
<%}%>
</body>
</html>
