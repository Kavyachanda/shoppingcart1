<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  footer {
    
    margin-top: 100px;
    
} 
body {
width:100%;
}
  </style>
</head>
<body  style="background-color:#ffffff;">


<!--  <div class="text-left" >
  <h1 style="font-family:Georgia; font-size:30px;"><i>SHOPIN </i>
    <img  src="https://www.sitewelder.com/art2012/logo-big-shopping.png" alt="logo" width="40px" height="40px" align="left" >
  <img  src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/768px-F_icon.svg.png" alt="fb" width="25px" height="25px" align="right" >
  <img  src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/1259px-Twitter_bird_logo_2012.svg.png" alt="twitter" width="25px" height="25px" align="right" >
  <img  src="http://icons.iconarchive.com/icons/danleech/simple/1024/linkedin-icon.png" alt="linkedin" width="25px" height="25px" align="right" >
  </h1>
  
  </div> -->
  
     <nav class="navbar navbar-inverse">
  <div class="container-fluid"> 
  <div class="navbar-header" class=" pull-left">
  <a class="navbar-brand" style="font-size:27px;margin-top: -4px;">
     <i class="fa fa-opencart" aria-hidden="true"></i> SHOPIN </a>
    <sec:authorize access="isAuthenticated()">
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME <sec:authentication property="principal.username"/> </a>
     
  	
</sec:authorize>
    </div>
     <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;">
      <%--  <li class="dropdown" >
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">CATEGORIES
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <c:forEach items="${allCategory}" var="category">
				<a href="navproduct/${category.id }"><c:out value="${category.name}" /></a>
							<br>
						
					</c:forEach>
        </ul>
      </li> --%>
      
    
      <li><a href="HOME">HOME</a></li>
       <sec:authorize access="!isAuthenticated()">
      <li><a href="REGISTER">REGISTER</a></li>
      <li><a href="LOGIN">LOGIN</a></li>
      </sec:authorize>
<!-- 	  <li><a href="ABOUTUS">ABOUT US</a></li> -->
	  <li><a href="CONTACTUS">CONTACT US</a></li>
   <sec:authorize access="isAuthenticated()">
   <li ><a href="Cart1" ><p>CART <span class="glyphicon glyphicon-shopping-cart"></span></p></a></li>
	<li><a href="<c:url value="/perform_logout" />"><p>LOGOUT<span class="glyphicon glyphicon-log-out"></span></p></a></li>
</sec:authorize>
					  
   </ul>
   </div>
  </nav> 
 <br>
 
  <div class="container">
 <c:choose>
    <c:when test="${!empty SuccessMessage}">
     <td colspan="2">
      <div class="alert alert-success fade in">
       <a href="login" class="close" data-dismiss="alert" aria-label="close">&times;</a>${SuccessMessage}
      </div>
     </td>
    </c:when>
   </c:choose>
   </div>
  <section id="content">
			<c:url var="addAction" value="adduser"></c:url>
			<form:form action="${addAction}" commandName="user"
				method="post">
<form class="form-horizontal">
 <div class="row centered-form">
        <div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title" style="text-align:center;">Register Here</h3>
			 			</div>
			 			<div class="panel-body">
			    		 <form role="form">

<br>
<div class="form-group">
  <label class="col-md-4 control-label" for="username">User name</label>  
  <div class="col-md-6">
  <form:input id="username" name="username" type="text" placeholder="user name" class="form-control input-md" 
  path="username" pattern=".{5,10}" required="true" title="minimum length for username is 5" />
    
  </div>
</div>
<br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>  
  <div class="col-md-6">
  <form:input id="password" name="password" type="password" placeholder="Password" class="form-control input-md" 
  path="password"  pattern=".{3,8}" required="true" title="minimum length for passsword is 3"/>
    
  </div>
</div>
<br>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="confirmpassword">Confirm Password</label>  
  <div class="col-md-6">
  <form:input id="confirmpassword" name="confirmpassword" type="password" placeholder="Confirm Password" class="form-control input-md"
   path="confirmpassword"  pattern=".{3,8}" required="true" title="minimum length for passsword is 3"/>
    
  </div>
</div>

<br>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">Email</label>  
  <div class="col-md-6">
  <form:input id="email" name="email" type="text" placeholder="email address" class="form-control input-md" path="email"/>
    
  </div>
</div>
<br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="phone">Phone Number</label>  
  <div class="col-md-6">
  <form:input id="phone" name="phone" type="text" placeholder="Phone Number" class="form-control input-md" 
  path="phone" pattern="^[789]\d{9}$" required="true" title="Enter valid mobile number"/>
    
  </div>
</div>
<br>
</div>

<div class="form-group">
<div class="col-xs-8 col-sm-6 col-md-4 col-sm-offset-2 col-md-offset-4">
<input type="submit" value="Register" class="btn btn-info btn-block">
</div>
</div>
<br>
<form>
</div>

</div>
</div>
</form>
</form:form>
</section>
<br><br><br><br>
	 <%@include file="Footer.jsp"%>		
</body>
</html>