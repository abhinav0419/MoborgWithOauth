<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.pac4j.core.exception.RequiresHttpAction"%>
<%@page import="org.pac4j.springframework.security.authentication.*"%>
<%@page import="org.springframework.security.core.*"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.pac4j.core.context.*"%>
<%@page import="org.pac4j.core.profile.*"%>
<%@page import="org.pac4j.oauth.client.*"%>
<%
	WebContext context = new J2EContext(request, response); 
%>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="img/favicon.ico"
	type="image/vnd.microsoft.icon" />
<title>Mobiquity | Login</title>
<link rel="icon" href="resource/img/mob-logo-small.png"
	type="image/x-icon">
<!-- Bootstrap Core CSS -->
<link href="resource/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="resource/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resource/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resource/font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%Authentication auth = (Authentication) SecurityContextHolder.getContext().getAuthentication();
UserProfile profile = null;
if (auth != null && auth instanceof ClientAuthenticationToken) {
    ClientAuthenticationToken token = (ClientAuthenticationToken) auth; 
    /* profile = token.getUserProfile(); */
    if(token.isAuthenticated())
    {
    	out.print("<script>alert('"+request.getRequestURI()+"')</script>");
    	response.sendRedirect(request.getContextPath()+"/mobmap");
    }
    
}
 /* else{
	if(request.getRequestURI().equals("/orgchart/WEB-INF/view/index.jsp")){
	}
	else
	{
		response.sendRedirect(request.getContextPath()+"/j_spring_security_logout");
	}
 } */
%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading" style="height: 50px">
						<span><img src="resource/img/mob-logo-small.png"
							style="float: left; margin-right: 5px;"></span>
						<h3 class="panel-title" style="float: left;">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<div class="oauthDemo col-xs-offset-3" id="connect">
						<!-- <a class='btn btn-danger' href="google/index.jsp" >Connect with Google+</a> -->
						<a class='btn btn-danger' href="<%=request.getContextPath()%>/google/oauthRedirect" >Connect with Google+</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<span class="navbar-text"> Copyright © Mobiquity, Inc. 2014.
				All Rights Reserved. </span>
		</div>
	</div>

	<!-- jQuery Version 1.11.0 -->
	<script src="resource/js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resource/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resource/js/plugins/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resource/js/sb-admin-2.js"></script>

</body>

</html>
