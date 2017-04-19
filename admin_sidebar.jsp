<%-- 
    Document   : sidebar
    Created on : Sep 18, 2016, 6:17:50 PM
    Author     : Raghu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">

				
				<img src="img/avatar5.png" class="img-circle" alt="User Image"/>
				
			</div>
			<div class="pull-left info">
				<p>Admin</p>
				<!-- Status -->
				<a href="admin_master.jsp?type=ADMIN"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search..."/>
				<span class="input-group-btn">
					<button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
				</span>
			</div>
		</form>
		<!-- /.search form -->

		<ul class="sidebar-menu">
                    <li class="header">ADMIN</li>
                    
                    <li><a href="add_employee.jsp"><i class="fa  fa-file-text-o"></i> <span> Add Employee</span></a></li>
                    <li><a href="users_list.jsp"><i class="fa  fa-file-text-o"></i> <span>Users List</span></a></li>
                    <li><a href="employee_list.jsp"><i class="fa  fa-file-text-o"></i> <span>Employees List</span></a></li>
                     

				
		</ul><!-- /.sidebar-menu -->

		</section>
	<!-- /.sidebar -->
</aside>
