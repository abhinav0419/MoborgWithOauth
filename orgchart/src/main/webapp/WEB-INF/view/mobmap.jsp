<%@page import="com.mob.model.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Mobiquity | Mob Maps</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="resource/img/mob-logo-small.png"
	type="image/x-icon">
	
<!-- jQuery Version 1.11.0 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="resource/img/mob-logo-small.png"type="image/x-icon">

<!-- jQuery Version 1.11.0 -->
<script type="text/javascript" src="resource/js/jquery-1.11.0.js"></script>
<script type='text/javascript' src="resource/js/bootstrap.min.js"></script>
<script src="resource/js/geo.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDh_No9sU6WFYOzzjXtUH-5tSRO67qgQ1w"></script>
<script type="text/javascript" src="resource/js/geo.js"  charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Custom CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
<link href="resource/css/stylish-portfolio.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resource/font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/ui-darkness/jquery-ui.min.css"
	rel="stylesheet">
<link href="resource/font-awesome-4.1.0/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"rel="stylesheet" type="text/css">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/ui-darkness/jquery-ui.min.css" rel="stylesheet">
<link href="resource/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

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
}
</style>


<script type="text/javascript">
//comment
$(function() {
    $("#user_location").autocomplete({
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
        focus: function(event,ui) {
            // prevent autocomplete from updating the textbox
            event.preventDefault();
            // manually update the textbox
            $('#user_location').val(ui.item.label);
        },
        select: function(event, ui) {
            // prevent autocomplete from updating the textbox
            event.preventDefault();
            // manually update the textbox and hidden field
          $('#user_location').val(ui.item.label); 
           /*  $('#autocomplete2').val(ui.item.label); */
           $('#searchId').val(ui.item.value);
           console.log(ui.item.value);
            if ($('#usersearchbutton').attr('disabled'))
            	$('#usersearchbutton').removeAttr('disabled');
            
        }
    });
});
var geocoder;
var infowindow;
var map;
var markers = [];
<%if (session.getAttribute("flag") != null) {%>
	if (geo_position_js.init()) {
		geo_position_js.getCurrentPosition(success_callback, error_callback, {
			enableHighAccuracy : true
		});
	} else {
		alert("Functionality not available");
	}

	<%-- function success_callback(p) {
		
		geocoder = new google.maps.Geocoder()
		getAddress(p.coords.latitude, p.coords.longitude);
		
		var mapOptions = {
			center : {
				lat : p.coords.latitude,
				lng : p.coords.longitude
			},
			zoom : 18
		};
		
		
		
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		var myLatlng = new google.maps.LatLng(p.coords.latitude,p.coords.longitude);
		
		var marker = new google.maps.Marker({
		      position: myLatlng,
		      map: map,
		  
		  });
		
		 var iw1 = new google.maps.InfoWindow({
		    content: '<%=session.getAttribute("loggedUserName")%>',
			maxWidth : 200,
			maxHeight : 400

		});
		google.maps.event.addListener(marker, "mouseover", function(e) {
			iw1.open(map, this);
		});
		google.maps.event.addListener(map, 'idle', function() {
			loadUsers(map);
		})
		
		fetchPlaces();
	} --%>
function success_callback(p) {
		
		geocoder = new google.maps.Geocoder()
		getAddress(p.coords.latitude, p.coords.longitude);
		
		var mapOptions = {
			center : {
				lat : p.coords.latitude,
				lng : p.coords.longitude
			},
			zoom : 18
		};
		
		
		
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		var myLatlng = new google.maps.LatLng(p.coords.latitude,p.coords.longitude);
		
		var marker = new google.maps.Marker({
		      position: myLatlng,
		      map: map,
		  
		  });
		
		var content = '<%=session.getAttribute("loggedUserName")%>'
		var contentId = '<%=session.getAttribute("loggedUserId")%>'
		

		var infowindow = new google.maps.InfoWindow();
		infowindow.setContent('<html><body><a href="getuserpro?userId='+contentId+'">'+content+'</a></body></html>');
		infowindow.open(map, marker);
		
	
		google.maps.event.addListener(map, 'idle', function() {
			loadUsers(map);
		})
		
		fetchPlaces();
	}

	function error_callback(p) {
		alert('error=' + p.message);
	}
	
	<%session.removeAttribute("flag");}%>
<%if (request.getAttribute("userEntity1") == null) {
				User user = (User) request.getAttribute("userEntity");%>
	function initialize() {
		var mapOptions = {
			center : {
				lat : <%=user.getOfficeLocationId().getLatitude()%>,
				lng : <%=user.getOfficeLocationId().getLongitude()%>
			},
			zoom : 18
		};
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
	}
	google.maps.event.addDomListener(window, 'load', initialize);
	<%} else {
				User user = (User) request.getAttribute("userEntity1");%>
	function initialize() {
		var mapOptions = {
			center : {
				lat : <%=user.getLatitude()%>,
				lng : <%=user.getLongitude()%>
			},
			zoom : 14
		};
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
		 
		
		var myLatlng = new google.maps.LatLng(<%=user.getLatitude()%>,<%=user.getLongitude()%>);
		
		var marker = new google.maps.Marker({
		      position: myLatlng,
		      map: map,
		  
		  });
		
		 var iw1 = new google.maps.InfoWindow({
		       content: "<%=user.getFullName()%>",
			maxWidth : 200,
			maxHeight : 400

		});
		google.maps.event.addListener(marker, "mouseover", function(e) {
			iw1.open(map, this);
		});
		google.maps.event.addListener(map, 'idle', function() {
			loadUsers(map);
		})
	}
	google.maps.event.addDomListener(window, 'load', initialize);
<%}%>
	function getAddress(lat, lng) {
		var latlng = new google.maps.LatLng(lat, lng);
		geocoder
				.geocode(
						{
							'latLng' : latlng
						},
						function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								if (results[1]) {
									var indice = 0;
									for (var j = 0; j < results.length; j++) {
										if (results[j].types[0] == 'locality') {
											indice = j;
											break;
										}
									}
									for (var i = 0; i < results[j].address_components.length; i++) {
										if (results[j].address_components[i].types[0] == "locality") {
											city = results[j].address_components[i];
										}
										if (results[j].address_components[i].types[0] == "administrative_area_level_1") {
											region = results[j].address_components[i];
										}
										if (results[j].address_components[i].types[0] == "country") {
											country = results[j].address_components[i];
										}
									}
									//Save Data AJAX
									saveLocation(lat, lng, city.long_name,
											region.long_name, country.long_name);

								} else {
									alert("No results found");
								}
							} else {
								alert("Geocoder failed due to: " + status);
							}
						});
	}
	//SOME AJAX TO PERSIST USER LOCATIONS
	function saveLocation(lat, lng, city, region, country) {
		$.post("persistuserlocation", {
			latitude : lat,
			longitude : lng,
			usercity : city,
			userregion : region,
			usercountry : country
		}, function() {
		});
	}

	//Search location on MAP
	$(document)
			.ready(
					function() {

						$("#searchbutton")
								.click(
										function() {

											var geocoder = new google.maps.Geocoder();
											var address = document
													.getElementById("location").value;
											geocoder
													.geocode(
															{
																'address' : address
															},
															function(results,
																	status) {
																if (status == google.maps.GeocoderStatus.OK) {
																	latitude = results[0].geometry.location
																			.lat();
																	longitude = results[0].geometry.location
																			.lng();

																	var myLatlng = new google.maps.LatLng(
																			latitude,
																			longitude);

																	var mapOptions = {
																		center : {
																			lat : latitude,
																			lng : longitude
																		},
																		zoom : 8
																	};
																	var map = new google.maps.Map(
																			document
																					.getElementById('map-canvas'),
																			mapOptions);
																	//loadUsers(map);
																	google.maps.event
																			.addListener(
																					map,
																					'idle',
																					function() {
																						loadUsers(map);
																					})
																} else {
																	alert("Request failed.")
																}
															});
										});
					});
	$(document).ready(function() {
			$("#searchbutton").click(function() {
				var geocoder = new google.maps.Geocoder();
				var address = document.getElementById("location").value;
				geocoder.geocode(
						{
							'address' : address
						},
						function(results,
								status) {
							if (status == google.maps.GeocoderStatus.OK) {
								latitude = results[0].geometry.location
										.lat();
								longitude = results[0].geometry.location
										.lng();

								var myLatlng = new google.maps.LatLng(
										latitude,
										longitude);

								var mapOptions = {
									center : {
										lat : latitude,
										lng : longitude
									},
									zoom : 8
								};
								var map = new google.maps.Map(
										document
												.getElementById('map-canvas'),
										mapOptions);
								//loadUsers(map);
								google.maps.event
										.addListener(
												map,
												'idle',
												function() {
													loadUsers(map);
												})
							} else {
								alert("Request failed.")
							}
						});
			});
		});

	///Search user on MAP
	$(document)
			.ready(
					function() {

						$('#usersearchbutton').attr('disabled', 'disabled');
						$("#usersearchbutton")
								.click(
										function() {

											var geocoder = new google.maps.Geocoder();
											var user = document
													.getElementById("user_location").value;
											var userId = document
													.getElementById("searchId").value;

											window.location = "fetchUserLatLong?userName="
													+ user
													+ "&userId="
													+ userId;

											/* $('#user_location').val(""); */
											$('#usersearchbutton').attr(
													'disabled', 'disabled');
										});
					});

	//SOME AJAX TO PERSIST USER LOCATIONS
	function saveLocation(lat, lng, city, region, country) {
		$.post("persistuserlocation", {
			latitude : lat,
			longitude : lng,
			usercity : city,
			userregion : region,
			usercountry : country
		}, function() {
		});
	}
	var fetchPlaces = function() {
		var infowindow = new google.maps.InfoWindow({
			content : ''
		});
	};
	// binds a map marker and infoWindow together on click
	var bindInfoWindow = function(marker, map, infowindow, html) {
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(html);
			infowindow.open(map, marker);
		});
	}
	// LOAD THE USERS BOUNDED BY THE BOUNDS
	function loadUsers(map) {

		var bounds = map.getBounds();
		console.log(bounds);
		var ne = bounds.getNorthEast();
		console.log(ne);
		var sw = bounds.getSouthWest();
		var nelat = ne.lat();
		var swlng = sw.lng();
		var swlat = sw.lat();
		var nelng = ne.lng();
		var lat = map.getCenter().lat();
		var lng = map.getCenter().lng();

		jQuery.ajax({
			url : 'loadUsersInBound?lat=' + lat + '&lng=' + lng + '&nelat='
					+ nelat + '&swlng=' + swlng + '&swlat=' + swlat + '&nelng='
					+ nelng,
			dataType : 'json',
			success : function(response) {
				users = response.UserList;
				var userLocations = [];
				for (us in users) {
					var myLatlng = new google.maps.LatLng(users[us].latitude,
							users[us].longitude);

					userLocations.push({
						id : users[us].user_id,
						name : users[us].user_name,
						latlng : myLatlng
					});
				}

				for (var i = 0; i < userLocations.length; i++) {
					var marker = new google.maps.Marker({
						position : userLocations[i].latlng,
						map : map,
						title : userLocations[i].name
					});
					addMarkerToMap(marker, userLocations[i].id,
							userLocations[i].name, lat, lng, nelat, swlng,
							swlat, nelng);
				}
			}
		})
		//INNER FUNCTION TO ADD MARKER TO THE MAP AND INFO WINDOW
		function addMarkerToMap(marker, id, name, lat, lng, nelat, swlng,
				swlat, nelng) {
			infowindow = new google.maps.InfoWindow({});
			google.maps.event
					.addListener(
							marker,
							'mouseover',
							function() {

								infowindow
										.setContent('<html><body><a href="getuserprofilemap?userId='
												+ id
												+ '&map=true&lat='
												+ lat
												+ '&lng='
												+ lng
												+ '&nelat='
												+ nelat
												+ '&swlng='
												+ swlng
												+ '&swlat='
												+ swlat
												+ '&nelng='
												+ nelng
												+ '">'
												+ name
												+ '</a></body></html>');
								infowindow.open(map, marker);
							});
		}
	}
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
			<div class="row row-offcanvas row-offcanvas-right">

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

				<div class="col-xs-12 col-sm-9" style="margin-top: 2%">
					<div class="panel panel-default"
						style="background-color: rgb(220, 220, 220);">
						<div class="panel-body">

							<!-- <form role="form"> -->

							<div
								style="float: left; padding-top: 1%; margin-right: 0.8%; color: rgb(150, 150, 150);">MOB
								MAPS</div>
							<div class="input-group" style="">
								<input type="text" class="form-control"
									placeholder="Search by location" id="location" name="search"
									style="background-color: rgb(250, 250, 250);">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit" id="searchbutton"
										style="background-color: rgb(250, 250, 250);">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>


							<div
								style="float: left; padding-top: 1%; margin-right: 0.8%; color: rgb(150, 150, 150);">MOB
								MAPS</div>
							<div class="input-group" style="">
								<input type="text" class="form-control"
									placeholder="Search by user" id="user_location"
									style="background-color: rgb(250, 250, 250);"> <input
									type="text" class="form-control" placeholder="Search"
									id="searchId" Style="display: none">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit"
										id="usersearchbutton"
										style="background-color: rgb(250, 250, 250);">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-9 col-xs-height">
					<div class="panel panel-default">
						<div class="panel-body">
							<div id="map-canvas"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type='text/javascript'>
		$(document).ready(function() {
	<%if (request.getAttribute("register") != null) {%>
		toastr.success(' Registered Successfully', '${name} ', {
				timeOut : 2000
			});
	<%}%>
		
	<%if (request.getAttribute("updated") != null) {%>
		toastr.success('Details Updated', '${name} ', {
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

</body>
</html>
