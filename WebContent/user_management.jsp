<%@page import="DAO.userDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.javafx.scene.layout.region.Margins.Converter"%>
<%@page import="Model.user"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Model.money_management"%>
<%@page import="DAO.moneyManagementDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<jsp:include page="/layout/header.jsp"></jsp:include>
  <%user u =(user) session.getAttribute("username");%>
              <%if(u==null ){ 
            	  session.setAttribute("message", "Please Login");
                  response.sendRedirect(response.encodeRedirectURL("/money_management/user_login.jsp"));
           
              } %>
</head>
<body>
<div class="container">

   <div id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
   
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

         

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            
<!-- 	     	  -->
	     	  
            	<div class="dropdown">				
				  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
				   Admin
				  
				  </button>
				  <div class="dropdown-menu">
			
			  
				    <a class="dropdown-item" href="/money_management/user_management.jsp">User Management</a>
				  
				    <a class="dropdown-item" href="user_logout">Logout</a>
				  </div>
				</div>
				  
				
          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">User management</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-12 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                   
                   
                   <table class="table table-bordered">
			<thead>
				<tr>
					<th width="5%">ID</th>
                    <th width="65%">Name</th>
                    <th width="10%">Account</th>
					<th width="15%">Role</th>
					
					<th width="5%">Delete</th>
				</tr>
			</thead>
			<tbody>
				<%int stt=1;
					List<user> ng = userDAO.DanhSach();
					for(user ng1 : ng) {
				%>
						<tr>
							<input type="hidden" id="id[]" name="id[]" value="<%=ng1.getID()%>"/>
							<td><%=stt++ %></td>
							<td><%=ng1.getName() %></td>
                            <td><%=ng1.getUsername() %></td>
							<td>
							<% if(ng1.getRole() == 1) {
							%>
								<span class='badge badge-primary'>Administrator</span>
							<% } else {%>
								<span class='badge badge-secondary'>Normal user</span>
							<% } %></td>
							
							<td class='text-center'><a onclick='return confirm("Delete <%=ng1.getUsername() %>?")' href='user_delete?id=<%=ng1.getID()%>'>Delete</a></td>
						</tr>
						<%} %>
			</tbody>
		</table>
                   
                   
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            

            <!-- Pending Requests Card Example -->
            
          </div>

          <!-- Content Row -->

          

          <!-- Content Row -->
        
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->



    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
   <!-- Custom scripts for all pages-->
  <script src="/static/js/sb-admin-2.min.js"></script>

</div>
   
   
</div>
</body>
</html>