<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 

<!DOCTYPE html>
<html>

<head>

<!-- jQuery Version 1.11.0 -->
<script type="text/javascript" src="resource/js/jquery-1.11.0.js"></script>
<script type='text/javascript' src="resource/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="cache-control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Mobiquity | Mob Org Chart</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<link rel="shortcut icon" href="resource/mob.png">
<!-- Bootstrap Core CSS -->
<link href="resource/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/css/try.css" rel="stylesheet">
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
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<!-- Custom Theme JavaScript -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<link rel="stylesheet" href="resource/css/orgstyle.css">
<style type="text/css">

body {
	padding-top: 51px;
}

#map-canvas {
	height: 500px;
	margin: 0;
	padding: 0;
}

.text-center {
	padding-top: 20px;
}

.col-xs-12 {
/* 	background-color: #fff; */
}

#sidebar {
	height: 100%;
	padding-right: 0;
	padding-top: 20px;
}

#sidebar .nav {
	width: 95%;
}

#sidebar li {
	border: 0 #f2f2f2 solid;
	border-bottom-width: 1px;
}
/*  collapsed sidebar styles  */
@media screen and (max-width: 767px) {
	.row-offcanvas {
		position: relative;
		-webkit-transition: all 0.25s ease-out;
		-moz-transition: all 0.25s ease-out;
		-o-transition: all 0.25s ease-in-out;
		transition: all 0.25s ease-out;
	}
	.row-offcanvas-right
  	.sidebar-offcanvas {
		right: -41.6%;
	}
	.row-offcanvas-left
 	 .sidebar-offcanvas {
		left: -41.6%;
	}
	.row-offcanvas-right.active {
		right: 41.6%;
	}
	.row-offcanvas-left.active {
		left: 41.6%;
	}
	.sidebar-offcanvas {
		position: absolute;
		top: 0;
		width: 41.6%;
	}
	#sidebar {
		padding-top: 0;
		/* background: #000; */
	}
	.sidebar-nav li a:active {
		text-decoration: none;
	}
	#map-canvas {
		height: 400px;
		margin: 0;
		padding: 0;
	}
	.labels {
		color: red;
		background-color: white;
		font-family: "Lucida Grande", "Arial", sans-serif;
		font-size: 10px;
		font-weight: bold;
		text-align: center;
		width: 60px;
		border: 2px solid black;
		white-space: nowrap;
	}
}

li {
	border-bottom: 1px dotted gray;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 5px;
}
a:hover{
 	text-decoration: none;
 	
}
.orgRelationshipUser{
	color:black;
	font-size: 18px;
}
.orgRelationship, a{
	color:black;
}

</style>
</head>

 
    

<script type='text/javascript'>
		$(document).ready(function() {
			
			$('[data-toggle=offcanvas]').click(function() {
				$('.row-offcanvas').toggleClass('active');
			});
			
			 $('#orgsearch').attr('disabled', 'disabled');
			 $('#orgsearch').click(function(){
			 $('#autocomplete2').val("");
			 $('#orgsearch').attr('disabled', 'disabled');
			 });
			$('[data-toggle=offcanvas]').click(function() {
				$('.row-offcanvas').toggleClass('active');
			});
		}); 	
		
		function moborg(){
			var userId=$('#searchId').val();
			//alert(userId);
			window.location="moborgchart?userId="+userId;
		}
		
        $(function() {
         
            $("#autocomplete2").autocomplete({
            	max:10,
            	minLength:2,
                /* source: data, */
                source:function(request, response) {
                $.ajax({
                        url : "searchController",
                        type : "GET",
                        /* data : request, */
                               data : {
                                term : request.term
                        },
                        dataType : "json",
                        success : function(data) {
                        	
                                response(data.nameList);
                                
                              }
                });
        },
                focus: function(event, ui) {
                    // prevent autocomplete from updating the textbox
                    event.preventDefault();
                    // manually update the textbox
                    $('#autocomplete2').val(ui.item.label);
                },
                select: function(event, ui) {
                    // prevent autocomplete from updating the textbox
                    event.preventDefault();
                    // manually update the textbox and hidden field
                  $(this).val(ui.item.label); 
                   /*  $('#autocomplete2').val(ui.item.label); */
                   $('#searchId').val(ui.item.value);
                   console.log(ui.item.value);
                    if ($('#orgsearch').attr('disabled'))
                    	$('#orgsearch').removeAttr('disabled');
                    
                }
            });
        });
		    
		
	</script>
	<!-- jQuery Version 1.11.0 -->
   
<body>

<body>

	<div class="page-container">

		<!-- top navbar -->
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="offcanvas"
						data-target=".sidebar-nav">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><span><img
							src="resource/img/mob-logo-small.png" style="margin-bottom: 5%;"><img
							alt="Mobiquity" src="resource/img/temp.png"
							style="width: 75%; margin-top: -5%; margin-left: 1%"> </span></a>
				</div>

			<!-- 	<nav id="sidebar-wrapper">
					<ul class="sidebar-nav">


					</ul>
				</nav> -->
				<!-- <nav id="sidebar-wrapper" class="panel-body">
					<ul class="sidebar-nav">


					</ul>
				</nav> -->

			</div>
		</div>

		<div class="container">
			<div class="row row-offcanvas row-offcanvas-right">

				<!-- sidebar -->
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
					role="navigation">
					<ul class="nav clearfix">
					
						<li class="active"><a
							href="<%=request.getContextPath()%>/mobmap">MobMap</a></li>
						<li><a href="<%=request.getContextPath()%>/moborgchart">MobOrg
								Chart</a></li>
						<li><a href="<%=request.getContextPath()%>/getupdateprofile">Edit
								Profile</a></li>
						<li><a href="<%=request.getContextPath()%>/j_spring_security_logout">Logout</a></li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-9" style="margin-top: 2%">
					<!-- <div class="panel panel-default"
						style="background-color: rgb(220, 220, 220);">
						<div class="panel-body"> -->

							



							<div class="row">
			<div id="col" class="col-xs-12 ">
				<div class="row broad">
					<div class="col-xs-3">
						<label id="mobOrgPad" style="padding-top: 10px;">Mob Org</label>
					</div>
					<div class="col-xs-9">

						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" id="autocomplete2" >
							<input type="text" class="form-control" placeholder="Search" id="searchId" Style="display:none" >
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit" id="orgsearch" onclick="moborg();">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		 		<div class="row">
			<hr class="hr" />
		</div>
		<div class="row">
			<div id="col" class="col-xs-12 main ">
				<div class="wrapper">
					<h4>Organization relationship for <span class="orgRelationshipUser">${user.fullName}</span></h4>

					<ul class="ul">
						<c:if test="${requestScope.isCurrentUserCeo eq false }">
						<li><span class="circle circle-red floatLeft"></span>  <a href="moborgchart?userId=${resourceManager.userId}"><c:out
													value="${resourceManager.fullName}"></c:out></a> - <c:out
													value="${resourceManager.titleId.titleName}"></c:out> <a
									href="getuserprofile?userId=${resourceManager.userId}&currentId= ${user.userId}"><i
										class="glyphicon glyphicon-chevron-right pull-right"></i> </a></li>
						</c:if>
						<li class="noBottom">
							<ul class="ul">
								<li><div class="circle circle-green floatLeft"></div>
									<span class="orgRelationship"> <c:out value="${user.fullName}"></c:out></span> - <c:out
													value="${user.titleId.titleName}"></c:out> <a
									href="getuserprofile?userId=${user.userId}&currentId= ${user.userId}"><i
										class="glyphicon glyphicon-chevron-right pull-right"></i> </a></li>
								<c:if test="${ not empty users}">
								<li class="noBottom">
									
									
									<ul class="ul">
										<c:forEach var="subUserList" items="${users}">
											<li><div class="circle circle-gray floatLeft "></div> <a href="moborgchart?userId=${subUserList.userId}"><c:out
													value="${subUserList.fullName}"></c:out></a> - <c:out
													value="${subUserList.titleId.titleName}"></c:out> <a
												href="getuserprofile?userId=${subUserList.userId}&currentId= ${user.userId}"><i
													class="glyphicon glyphicon-chevron-right pull-right"></i></a></li>
										</c:forEach>
										</ul>
										
										<!-- <li><div class="circle circle-gray floatLeft"></div> Sub Mobster
											Sub <a href="#"><i
												class="glyphicon glyphicon-chevron-right pull-right"></i></a></li> -->
									
								</li>
								</c:if>
							</ul>

						</li>


					</ul>
				</div>
			</div>
		</div>
						</div>
					</div>
				</div>
				

			</div>
		

	<script type='text/javascript'>
		$(document).ready(function() {
	
		$('[data-toggle=offcanvas]').click(function() {
				$('.row-offcanvas').toggleClass('active');
			});
		});
	</script>
	
	
	<script>
		// Closes the sidebar menu
		// Scrolls to the selected menu item on the page
		$(function() {
			$('a[href*=#]:not([href=#])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										|| location.hostname == this.hostname) {

									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html,body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});
	</script>



</body>
</html>

