<%-- <%@page import="Model.nguoidung"%> --%>
<%@page import="Model.user"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="static/css/creative.min.css">
	<link rel="stylesheet" href="static/css/custom.css">
	

</head>
<body>
 <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">Manage personal income and expenditure</h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5">One application it's hejp you manage your money, and tatistics your spending in a better way</p>
          	<%user u =(user) session.getAttribute("username");%>
                 <%if(u!=null ){%> --%>
	          		<a class="btn btn-primary btn-xl js-scroll-trigger" href="/money_management/user_login.jsp">Try it now</a>
                  <%} %>
              	<%if(u==null ){%> --%>
	          		<a class="btn btn-primary btn-xl js-scroll-trigger" href="/money_management/dashboard.jsp">Try it now</a>
                 <%} %>
              

        </div>
      </div>
    </div>
  </header>


<script>

</script> 

</body>

</html>