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
		
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
        

        
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
		
		<jsp:include page="admin_sidebar.jsp" />
		

		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					Users List
					<small></small>
				</h1>
				
				 <ol class="breadcrumb">
                                    <li><a href="index.jsp"><i class="fa fa-home"></i>Login</a></li>
                                    <li class="active">Home</li>
				</ol> 
			</section>
			<section class="content">
				<table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <td>S.No.</td>
                                            <th>Name</th>
                                            <th>Email Id</th>
                                            <th>Mobile</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                </table>
                                
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
        
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
       
         <script type="text/javascript">
             
		
            $(document).ready(function() {
                var table = $('#example').DataTable( {
                    "ajax": "AdminCtrler",
                    "columnDefs": [
                        { "width": "5%", "targets": 0 }
                      ],
                    "columns": [
                        {"data":null},
                        { "data": "firstname" },
                        { "data": "email" },   
                        { "data": "mobile" },
                        { "data": "status", 
                            render : function ( data, type, row ) {
                            var status = data;
                            if(type === 'display'){
                                if(status == 'INACTIVE')
                                {
                                    return '<label class="label label-danger">'+status+'</label>';
                                }
                                else
                                {
                                    return '<label class="label label-success">'+status+'</label>';
                                }
                            }
                            else {
                                    return status;
                                }
                            }
                        }
                    ]
                } );
                
                table.on( 'order.dt search.dt', function () {
		    table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		    cell.innerHTML = i+1;
		    } );
		} ).draw();
                
                $('table tbody').on('click', 'td', function () {
                   
                   var rowIndex = table.cell(this).index().row;
                    var data = table.row( rowIndex ).data();
                    console.log(data);
                    var rowId = data['id'];
                    window.location.href = 'UserViewCtrler?type=admin&user_id='+rowId;
                 
                });
            } ); 
            
            

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
