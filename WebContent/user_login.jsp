<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.user"%>
<!DOCTYPE html>
<html>

<head>
  <jsp:include page="/layout/header.jsp"></jsp:include>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user" action="user_login" method="post" role="form">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="exampleInputUsername"
                        aria-describedby="usernameHelp" placeholder="Enter Username... ^^!" name="UserName">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="exampleInputPassword"
                        placeholder="Password" name="PassWord">
                    </div>
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <button class="btn btn-primary btn-user btn-block" type="submit">
                      Login
                    </button>
                    
                   
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="register.html">Create an Account!</a>
                  </div>
                  
                  <%user u =(user) session.getAttribute("username");%>
<%--                   <%if(u!=null && u.getRole() ==1 ){%> --%>
<!--                   <h1>Xin chao admin</h1> -->
<%--                   <%} %> --%>
<%--                   <%if(u!=null){%> --%>
<%--                 	<jsp:include page="/dashboard.jsp"></jsp:include> --%>
<%--                   <%} %> --%>
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>


</body>

</html>