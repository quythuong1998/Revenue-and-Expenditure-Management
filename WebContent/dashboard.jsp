<%@page import="com.sun.javafx.scene.layout.region.Margins.Converter"%>
<%@page import="Model.user"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Model.money_management"%>
<%@page import="DAO.moneyManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            <%
	    	user ng = (user) session.getAttribute("username");
	     	 %>
<!-- 	     	  -->
	     	  <%  if(ng!=null){ %>
            	<div class="dropdown">				
				  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
				   <%= ng.getName()%>
				  
				  </button>
				  <div class="dropdown-menu">
			<% System.out.println(ng.getRole()); %>
			  <%  if(ng!=null  && ng.getRole() == 1  ){%>
				    <a class="dropdown-item" href="/money_management/user_management.jsp">User Management</a>
				  <%}%>
				    <a class="dropdown-item" href="user_logout">Logout</a>
				  </div>
				</div>
				  <% } %>
				
          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">additional income / expense</div>
                      <form class="user" action="money_add" method="post" role="form">
                    <div class="form-group">
                      <input type="text" name="money" class="form-control form-control-user" placeholder="amount of money...">
                    </div>
                    
                    <%
                   
                    GregorianCalendar cal = new GregorianCalendar();
                    int date = cal.get(Calendar.DATE);
                    int month = cal.get(Calendar.MONTH)+1;
                    int year = cal.get(Calendar.YEAR);
                    String dateTime = (date+ "/" + month + "/" +year);
                    
                     %>
                    <div class="form-group">
                    
                     <%  if(ng!=null){%>
                     <input type="hidden" id="userId" name="userId" value="<%=ng.getID()%>" />
                     <%} %>
                     <input type="hidden" id="userId" name="date" value="<%=dateTime%>" />
                    <div class="d-flex justify-content-around">
                     	<label class="radio-inline"><input type="radio" id="1" name="type" value="1" >  revenue</label>
						<label class="radio-inline"><input type="radio" id="2" name="type" value="2">  expenditure</label>
                    </div>
                    </div>
                    
                     <div class="form-group">
					    <label for="exampleFormControlTextarea1">Explain</label>
					    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="explain"></textarea>
					 </div>
                    
                     <div class="d-flex justify-content-around">
                     <div class="col-lg-6">
	                   <button class="btn btn-primary btn-user btn-block" style="color: white" type="submit">
	                      Add
	                    </button>
	                   </div>
	                 </div>
	                   
                    
                  
                    
                  
                  </form>
                      
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body d-flex align-items-center">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1" >total revenue</div>
                      
                      <%
                       if(ng!=null ){
		               int uId =  ng.getID();
					   int sumRevenue=0;
		               int sumExpenditure=0;
		               int sum=0;
					   List<money_management> mn = moneyManagementDAO.listMoney(uId);
									for(money_management m1 : mn) {
										if(m1.getType()==1)
											sumRevenue+=Integer.parseInt(m1.getMoney());									
										if(m1.getType()==2)
											sumExpenditure +=Integer.parseInt(m1.getMoney());
									}
						sum=sumRevenue-sumExpenditure;%>
						
                       
                      
                      
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          
                          
                          
                         	 <div class="h1 mb-0 font-weight-bold text-gray-800" id="revenue"> 
                         	 <%=sumRevenue %> $
                         	 </div>
                       	  
                          
                        </div>
                        
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body d-flex align-items-center">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">total spending</div>
                    
                     <div class="h1 mb-0 font-weight-bold text-gray-800" id="spending">
                     <%=sumExpenditure %> $
                     </div>
                       	  
                          
                          
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">List of revenues and expenditures</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    	<table class="table">
						  <thead>
						    <tr>
						    <th scope="col"># </th>
						      <th scope="col">AMOUNT </th>
						      <th scope="col">TYPE</th>
						      <th scope="col">EXPLAIN</th>
						      <th scope="col">DATE</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody id="tbody">
						  
		                     <%  if(ng!=null ){%>
		                     
		                    	<%	int id=1;
		                    		for(money_management m : mn) {
											
								%>
							<tr>
								<td><%=id++ %></td>
								<td><%= m.getMoney() %></td>
								<td><%= m.getType() %></td>
								<td><%= m.getExplain() %></td>
								<td><%= m.getDate() %></td>	
							
							 <td class='text-center'><a class="btn btn-danger btn-circle btn-sm" onclick='return confirm("Delete <%=m.getExplain() %>?")' href='money_remove?id=<%=m.getID()%>'>x</a></td>
							 
							</tr>
							<%} %>
							
							<%} %>
						  </tbody>
						</table>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Current Balance</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2 d-flex align-items-center justify-content-between">
                     <div class="h1 mb-0 font-weight-bold text-gray-800" id="balance">
                     
                     	<div style="padding-left:90px"><%=sum %> $</div>
                  		<%}%>
                     </div>
                     
                    
                    

                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> Direct
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> Social
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> Referral
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

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
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Custom scripts for all pages-->
  <script src="/static/js/sb-admin-2.min.js"></script>

</div>
   
   
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>