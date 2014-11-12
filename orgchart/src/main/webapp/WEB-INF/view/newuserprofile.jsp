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
	#headerRow{
		height: 60px;
		background-color: rgb(237, 237, 237);
		color: gray;
		margin-left:-8px;
		margin-right: -8px;
		margin-bottom: 20px;
		}
	.col-centered{
    float: none;
    margin: 0 auto;
}
.img-thumbnail{
	width:150px;
	height:150px;
	
}
</style>
</head>

<body>

	<div class="container col-centered">
		<div class="row" id="headerRow"></div>
		<div class="row">
			<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
				<img alt="image" class="img-thumbnail" src="resource/mob.png">
			</div>
			<div class="col-xs-3 col-sm-2  col-md-2 col-lg-2">
				<ul class="ul_sub">
					<li><span id="userName">Ravi Nair</span></li>
					<li><span style="color: rgb(85,85,85);"> Java Developer</span></li>
					<li class="upPad"><span class="smallFont">Office</span></li>
					<li>(555) 1133-3232</li>
					<li class="upPad"><span class="smallFont">Mobile</span></li>
					<li>98987676524</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>

