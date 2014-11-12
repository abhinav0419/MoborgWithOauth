<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 


<!DOCTYPE html>
<html>

<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="cache-control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Mob Org Chart</title>

<link rel="shortcut icon" href="resource/mob.png">
<!-- Bootstrap Core CSS -->
<link href="resource/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="resource/css/plugins/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="resource/css/plugins/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resource/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="resource/css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resource/font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- jQuery Version 1.11.0 -->
<script src="resource/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resource/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="resource/js/plugins/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="resource/js/sb-admin-2.js"></script>
<link rel="stylesheet" href="resource/css/orgstyle.css">
<style type="text/css">
p {
	word-wrap: break-word;
}
#userName{
font-size: 25px;
}
.navbar-fixed-bottom {
	border: none;
	margin-top: 20px;
	margin-left: auto;
}
#tata{
	margin-bottom: 80px;
}
#sideMe{
	margin-left: 23%;
}
.smallFont{
	font-size: 11px;
	
}
.upPad{
	padding-top: 10px;
}
.header{
	font-size: 15px;
}

</style>
</head>

<style type="text/css">

p {
	word-wrap: break-word;
}
#userName{
font-size: 25px;
}
.navbar-fixed-bottom {
	border: none;
	margin-top: 20px;
	margin-left: auto;
	margin-bottom: 20px;
}
#tata{
	margin-bottom: 80px;
}
#sideMe{
	margin-left: 23%;
}
.smallFont{
	font-size: 11px;
	
}
.upPad{
	padding-top: 10px;
}
.header{
	font-size: 15px;
}

</style>
</head>
<body>
	<div class="container" id="tata">
		<div class="row broad">
			<div class="col-xs-12 col-md-4">
				<div class="row pad_top_row">
					<div class="col-xs-1 align">

				

					
					 <c:if test="${requestScope.singleNoBack eq true}">

						<a href="moborgchart?userId=${currentId}"><i class="glyphicon glyphicon-chevron-left"></i></a>	
						</c:if> 
						<c:if test="${requestScope.mapGoBack eq true}">

						

						<a href="fetchUserLatLong?userName=${user.fullName}&userId=${user.userId}"><i class="glyphicon glyphicon-chevron-left"></i></a>

						</c:if>
					
					
					</div>
					<div class="col-xs-11 col-md-3 align"></div>
				</div>
			</div>
		</div>
		<div class="row padtop">
			<div class="col-xs-5 col-md-2">
				<img src="${user.userPicture}" class="img-thumbnail propic">
			</div>
			<div class="col-xs-7 col-md-2">
				<ul style="padding-left: 0px;padding-top: 0px;" class="ul_sub">
					<li><span id="userName">${user.fullName}</span></li>
					<li><span style="color: rgb(85,85,85);"> ${user.titleId.titleName}</span></li>
					<li class="upPad"><span class="smallFont">office</span></li>
					<li>${user.officeContactNo}</li>
					<li class="upPad"><span class="smallFont">mobile</span></li>
					<li>${user.contactNo}</li>
				</ul>
			</div>
		</div>
		<div class="row padtop">
			<div class="col-xs-12 col-md-4">
				<ul class="ul_sub">
					<li>Job Description <!--  <i class="glyphicon glyphicon-pencil"></i> --></li>
					<li><span class="smallFont">${user.jobDescription}</span></li>
				</ul>
			</div>
		</div>
		<div class="row padtop">
			<div class="col-xs-12 col-md-4">
				<ul class="ul_sub">
					<li>Hobbies <!-- <i class="glyphicon glyphicon-pencil"></i> --></li>
					<li><span class="smallFont">${user.hobbies}</span></li>
				</ul>
			</div>
		</div>

	</div>
	<nav class="navbar navbar-default navbar-fixed-bottom"
		role="navigation">
		<div class="container" id="sideMe">
			<ul class="ul_sub">
				<li><a href="mailto:${user.emailId}" type="button" class="btn btn-default userProButton">Send Message</a></li>
				<li><input type="button" class="btn btn-default userProButton"
					value="Save Contact"></li>

			</ul>
		</div>
	</nav>



</body>
</html>
