<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%@page import="ridecreator.RideDto"%>
<%@page import="ridecreator.RideDao"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("phone") == null) {
	response.sendRedirect("index.jsp?msg=loginfirst");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Ride Buddies</title>
<link rel="icon" href="./img/core-img/favicon.png">
<link rel="stylesheet" href="style.css">

</head>

<body>
<%
String msg = request.getParameter("msg");
if(msg != null){
	if(msg.equals("norequestexist")){
%>
<script type="text/javascript">
alert("No Request Exist");
</script>
<%
	}
}
%>
	<!-- **** Header Area Start **** -->
	<jsp:include page="header.html"></jsp:include>
	<!-- **** Header Area End **** -->


	<!-- **** Welcome Maps Area Start **** -->
	<div class="welcome-area wow fadeInUp" data-wow-delay="200ms">
		<div class="google-maps" id="map">
			
		</div>
	</div>
	<!-- **** Welcome Maps Area End **** -->


	<!-- **** Location Search Form Area **** -->
	<div class="rehomes-search-form-area wow fadeInUp"
		data-wow-delay="200ms">
		<div class="container">
			<div class="rehomes-search-form">
				<form action="home.jsp" method="post">
				<input type="hidden" name="startLat" id="startLat">
                <input type="hidden" name="endLat" id="endLat">
                <input type="hidden" name="startLng" id="startLng">
                <input type="hidden" name="endLng" id="endLng">
					<div class="row">
						<div class="col-12 col-lg-10">
							<div class="row">
								<div class="col-12 col-md-6 col-lg-3">
                                    <input type="text" name="startLoc" id="start" class="form-control" placeholder="Start..">
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <input type="text" name="endLoc" id="end" class="form-control" placeholder="End..">
                                </div>
							</div>
						</div>
						<div class="col-12 col-lg-2">
							<button type="submit" class="btn rehomes-search-btn">Search</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- **** Location Search Form Area **** -->

<script>
 
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 13,
			center : {
				lat : 23.2599,
				lng : 77.4126
			}
		});

        var marker = new google.maps.Marker({ map: map });
        
        var input = document.getElementById('end');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        autocomplete.setFields(['place_id', 'geometry', 'name']);
        autocomplete.addListener('place_changed', function () {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(15);
            }
            marker.setPlace({
                placeId: place.place_id,
                location: place.geometry.location
            });
            marker.setVisible(true);
            document.getElementById("endLat").value = place.geometry.location.lat();
            document.getElementById("endLng").value = place.geometry.location.lng();
        });
        
        var input1 = document.getElementById('start');
        var autocomplete1 = new google.maps.places.Autocomplete(input1);
        autocomplete1.bindTo('bounds', map);
        autocomplete1.setFields(['place_id', 'geometry', 'name']);
        autocomplete1.addListener('place_changed', function () {
            var place = autocomplete1.getPlace();
            
            if (!place.geometry) {
                return;
            }
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(15);
            }
            
            marker.setPlace({
                placeId: place.place_id,
                location: place.geometry.location
            });
            marker.setVisible(true);
            document.getElementById("startLat").value = place.geometry.location.lat();
            document.getElementById("startLng").value = place.geometry.location.lng();
        });
	}

</script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGMh_-YjvhGFCQSuLe4O4TmW9TPgYVKCI&libraries=places&callback=initMap">
    </script>

	<!-- **** Sale area Start **** -->
	<section class="rehome-house-sale-area section-padding-100-60">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center wow fadeInUp"
						data-wow-delay="200ms">
						<h2>
							Top New In <span>Offer Rides</span>
						</h2>
						<p>These are the best rides matching your criteria.</p>
					</div>
				</div>
<%
String startLoc = request.getParameter("startLoc");
String endLoc = request.getParameter("endLoc");

if(startLoc == null && endLoc == null){
	ArrayList<RideDto> list = new RideDao().viewAllRide();
	if(list.isEmpty()){
	%>
					<div class="col-12">
						<div class="section-heading text-center wow fadeInUp"
							data-wow-delay="200ms">
							<h4>No Rides Found</h4>
							<p>Try different filters.</p>
						</div>
					</div>
	<%
	} else {
		for(RideDto dto : list) {
			UserDto user = new UserDao().viewUser(dto.getPhone());
	%>
					<!-- Single Property Area -->
					<div class="col-12 col-md-6 col-lg-4">
						<div class="single-property-area wow fadeInUp"
							data-wow-delay="200ms">
							<!-- Property Thumb -->
							<div class="property-thumb">
								<a href="ridedetails.jsp?phone=<%=user.getPhone()%>"><img src="img/bg-img/1.jpg"
									alt="image"></a>
							</div>

							<!-- Property Description -->
							<div class="property-desc-area">
								<!-- Property Title & Seller -->
								<div class="property-title-seller d-flex justify-content-between">
									<!-- Title -->
									<div class="property-title">
										<h4><%=user.getName()%></h4>
										<p>
											<i class="fa fa-map-marker" aria-hidden="true"></i>
											<%=dto.getStartLoc()%>---<%=dto.getEndLoc()%>
										</p>
									</div>
								</div>
								<!-- Property Info -->
								<div class="property-info-area d-flex flex-wrap">
									<p>
										Vehicle: <span><%=dto.getVehType() %></span>
									</p>
									<p>
										Persons: <span><%=dto.getPeople() %></span>
									</p>
									<p>
										Start Time: <span><%=dto.getStartTime() %></span>
									</p>
									<p>
										End Time: <span><%=dto.getEndTime() %></span>
									</p>
								</div>
							</div>
						</div>
					</div>
	<%
			}
		}
	} else {
		/* String startLats = request.getParameter("startLat");
		String endLats = request.getParameter("endLat");
		String startLngs = request.getParameter("startLng");
		String endLngs = request.getParameter("endLng");
		if(startLats != null && startLngs != null){
			double startLat = Double.parseDouble(startLats);
			double startLng = Double.parseDouble(startLngs);
		} else {
			double startLat = 0;
			double startLng = 0;
		}
		if(endLats != null && endLngs != null){
			double endLat = Double.parseDouble(endLats);
			double endLng = Double.parseDouble(endLngs);
		} else {
			double endLat = 0;
			double endLng = 0;
		} */
		if(startLoc == null){
			startLoc = "";
		} else if(endLoc == null) {
			endLoc = "";
		}
		ArrayList<RideDto> list = new RideDao().searchRide(startLoc,endLoc);
		//ArrayList<RideDto> list = new RideDao().searchRideLatLng(startLat,startLng,endLat,endLng);
		if(list.isEmpty()){
%>
		<div class="col-12">
			<div class="section-heading text-center wow fadeInUp"
				data-wow-delay="200ms">
				<h4>No Rides Found</h4>
				<p>Try different locations...</p>
			</div>
		</div>
<%
		}else {
	for(RideDto dto : list) {
		UserDto user = new UserDao().viewUser(dto.getPhone());
%>
				<!-- Single Property Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-property-area wow fadeInUp"
						data-wow-delay="200ms">
						<!-- Property Thumb -->
						<div class="property-thumb">
							<a href="ridedetails.jsp?phone=<%=user.getPhone()%>"><img src="img/bg-img/1.jpg"
								alt="image"></a>
						</div>

						<!-- Property Description -->
						<div class="property-desc-area">
							<!-- Property Title & Seller -->
							<div class="property-title-seller d-flex justify-content-between">
								<!-- Title -->
								<div class="property-title">
									<h4><%=user.getName()%></h4>
									<p>
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<%=dto.getStartLoc()%>---<%=dto.getEndLoc()%>
									</p>
								</div>
							</div>
							<!-- Property Info -->
							<div class="property-info-area d-flex flex-wrap">
								<p>
									Vehicle: <span><%=dto.getVehType() %></span>
								</p>
								<p>
									Persons: <span><%=dto.getPeople() %></span>
								</p>
								<p>
									Start Time: <span><%=dto.getStartTime() %></span>
								</p>
								<p>
									End Time: <span><%=dto.getEndTime() %></span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<%
	}
	}
}
%>


			</div>
		</div>
	</section>
	<!-- **** Sale Area End **** -->


	<!-- **** Choose Us Area Start **** -->
	<jsp:include page="chooseus.html"></jsp:include>
	<!-- **** Choose Us Area End **** -->

	<!-- **** Call to Action Area Start **** -->
	<jsp:include page="app.html"></jsp:include>
	<!-- **** Call to Action Area End **** -->

	<!-- **** Footer Area Start **** -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- **** Footer Area End **** -->

</body>

</html>