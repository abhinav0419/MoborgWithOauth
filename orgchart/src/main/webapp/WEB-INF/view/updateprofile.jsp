<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Menu</title>
    
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resource/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resource/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.text-center {
	padding-top: 20px;
}

.col-xs-12 {
	background-color: #fff;
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


    .bs-example{
        margin: 20px;
    }
    /* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
    .form-horizontal .control-label{
        padding-top: 7px;
    }

    #register{
    background-color: #cccccc;
    color:#ffffff;
}

#register:hover{
    background-color: #686868;
    color:#ffffff;
}

#cancel{

    background-color:#cccccc ;
    color:#ffffff;
}
#cancel:hover{

    background-color:#7A7A7A ;
    color:#ffffff;
}
.col-centered{
    float: none;
    margin: 0 auto;
}
#header{
   margin-top: 40px;
   background: #F1F1F1;
   padding-bottom: 20px;
   padding-top: 20px;
}
.p{
    float: none;
    margin: 0 auto;
}
#register{
    outline: none;
}
.error {

    color:black;
    border:1px solid red;
}
.valid {
    color:black;
    outline:none;
}
h3{
color:#ffffff;
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	$( "#myform" ).validate({

	  rules: {
		  contactNo: {
	      required: true,
	      minlength: 8,
	      maxlength:25
	    },
	    officeContactNo: {
		      required: true,
		      minlength: 8,
		      maxlength:25
		    },
	    fullName:{
	          required:true,
	          minlength:1,
	          maxlength:40
	    },
	    title:{
	        required:true
	    },
	    reportTo:{
	        required:true
	    },
	    officeLocation:{
	        required:true
	    }
	      },
	      errorPlacement: function () {
	    	 
	    	  $('#error-bubble').show();
	        },
	        submitHandler: function(form) {  
	            if ($(form).valid()) {
	            	 $('#error-bubble').hide();
	             form.submit();}
	            return false; // prevent normal form posting
	     }
	});
	});


</script>
</head>

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

				<nav id="sidebar-wrapper">
					<ul class="sidebar-nav">


					</ul>
				</nav>
				<nav id="sidebar-wrapper" class="panel-body">
					<ul class="sidebar-nav">


					</ul>
				</nav>

			</div>
		</div>

		<div class="container">
			<div class="row row-offcanvas row-offcanvas-right"	style="margin-top: 4%">

				<!-- sidebar -->
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
					role="navigation">
					<ul class="nav">
					
						<li class="active"><a
							href="<%=request.getContextPath()%>/mobmap">MobMap</a></li>
						<li><a href="<%=request.getContextPath()%>/moborgchart">MobOrg
								Chart</a></li>
						<li><a href="<%=request.getContextPath()%>/getupdateprofile">Edit
								Profile</a></li>
						<li><a href="<%=request.getContextPath()%>/j_spring_security_logout">Logout</a></li>
					</ul>
				</div>

				<!-- <div class="col-xs-12 col-sm-9" style="margin-top: 2%">
					<div class="panel panel-default"
						style="background-color: rgb(220, 220, 220);">
						<div class="panel-body">


   
  
 </div>
 



							<form role="form">

					</div>
				</div> -->
				<div class="col-xs-12 col-sm-9 col-xs-height" style="margin-top: 4%">
					<div class="panel panel-default">
						<div class="panel-body">

						    <div class="col-xs-10 col-centered" id="header"><div align="center">Update Profile</div>
						    </div>
						    <br>
						    <form:form class="form-horizontal" id="myform" action="updateprofile" method="post" commandName="userEntity">
						        <div class="form-group">
						            <div id="error-bubble" class=" col-xs-10 col-centered" style="display:none;color:red;">Fields Marked Red Are Required</div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">
						                <form:input type="text" class="form-control" id="inputEmail" placeholder="Your Mob Email"  path="emailId" value="${user.emailId}" ></form:input>
						            </div>
						        </div>
						        <div class="form-group">
						            
						            <div class="col-xs-10 col-centered">
						                <form:input type="text" class="form-control " id="inputFullName" placeholder="Full Name" path="fullName" name="fullName" value="${user.fullName}"></form:input>
						            </div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">
						                <select id="title" class="form-control" name="title">
						                    <option value="">Title</option>
						                    <option value="${currentTitle.titleName}" selected>${currentTitle.titleName}</option>
						                    <c:forEach items="${titleNameList}" var="name">
						                                   
						                                   <option value="${name.titleName}">${name.titleName}</option>
						                               
						                                   </c:forEach>
						                </select>
						            </div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">
						                <select id="reportTo" class="form-control" name="reportTo" >
						                    <option value="">Report To</option>
						                     <option value="${resourceManager.fullName}" selected>${resourceManager.fullName}</option>
						                  <c:forEach items="${managerList}" var="manager">
						                                   <option value="${manager.fullName}">${manager.fullName}</option>
						                                   </c:forEach>
						                </select>
						            </div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">
						                <select id="officeLocation" class="form-control" name="officeLocation" >
						                    <option value="">Office Location</option>
						                    <option value="${officeName.addressLine1}" selected>${officeName.addressLine1}  </option>
						                      <c:forEach items="${officeList}" var="office">
						                                   <option value="${office.addressLine1}">${office.addressLine1}</option>
						                                   </c:forEach>
						                </select>
						            </div>
						        </div>
						
						        <div class="form-group">
						            
						            <div class="col-xs-10 col-centered">
						                <form:input type="text" class="form-control" id="inputPhone" path="contactNo" name="contactNo" placeholder="Contact Phone" value="${user.contactNo }"></form:input>
						            </div>
						        </div>
						        <div class="form-group">
						            
						            <div class="col-xs-10 col-centered">
						                <form:input type="text" class="form-control" id="inputOfficePhone" path="officeContactNo" name="officeContactNo" placeholder="Office Phone" value="${user.officeContactNo }"></form:input>
						            </div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">Job Description</div>
						              <div class="col-xs-10 col-centered"> <textarea type="text"  style="width:100%" name="jobDescription" >${user.jobDescription }</textarea></div>
						        </div>
						        <div class="form-group">
						            <div class="col-xs-10 col-centered">Interests/Hobbies</div>
						              <div class="col-xs-10 col-centered"> <textarea type="text"  style="width:100%" name="hobbies" >${user.hobbies }</textarea></div>
						        </div>
						       
						        <div class="form-group">
						            <div class=" col-xs-10 col-centered">
						               <input type="submit" value="Update" class="btn btn-primary"/>
						                <input class="btn btn-danger" type="reset" value="Cancel" />
						            </div>
						        </div>
						    </form:form>
						</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	<script type='text/javascript'>
		$(document).ready(function() {
	<%if (request.getAttribute("register") != null) {%>
		toastr.success('Are Registered', '${name} You', {
				timeOut : 2000
			});
	<%}%>
		
	<%if (request.getAttribute("updated") != null) {%>
		toastr.success('Details Updated', '${name} Your', {
				timeOut : 2000
			});
	<%}%>
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
   

    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>

</body>

</html>
