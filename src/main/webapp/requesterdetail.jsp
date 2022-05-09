
<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="riderequestor.RequestDao"%>
<%@page import="riderequestor.RequestDto"%>
<%
	if (session.getAttribute("phone") == null) {
		response.sendRedirect("index.jsp?msg=loginfirst");
	}
%>
<%@page import="ridecreator.RideDao"%>
<%@page import="ridecreator.RideDto"%>
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
	<!-- **** Header Area Start **** -->
	<jsp:include page="header.html"></jsp:include>
	<!-- **** Header Area End **** -->
<%
		String phone = (String) session.getAttribute("phone");
		RideDto dto = new RideDao().viewRide(phone);
		if (dto == null) {
			response.sendRedirect("createride.jsp?msg=createride");
		} else {
%>
	<!-- **** Properties Hero Area Start **** -->
	<div
		class="properties-hero-area d-flex flex-wrap align-items-center mb-80">
		<div class="properties-slide">
			<!-- Properties Slider -->
			<div id="property-thumb-silde" class="carousel slide wow fadeInUp"
				data-wow-delay="200ms" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#property-thumb-silde" data-slide-to="0"
						class="active" style="background-image: url(img/bg-img/64.jpg);"></li>
					<li data-target="#property-thumb-silde" data-slide-to="1"
						style="background-image: url(img/bg-img/65.jpg);"></li>
					<li data-target="#property-thumb-silde" data-slide-to="2"
						style="background-image: url(img/bg-img/66.jpg);"></li>
					<li data-target="#property-thumb-silde" data-slide-to="3"
						style="background-image: url(img/bg-img/67.jpg);"></li>
				</ol>

				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="img/bg-img/64.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="img/bg-img/65.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="img/bg-img/66.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="img/bg-img/67.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
			</div>
		</div>

		<!-- Properties Content Area -->
		<div class="properties-content-area wow fadeInUp"
			data-wow-delay="200ms">
			<div class="properties-content-info">
				<h2><%=session.getAttribute("name")%></h2>
				<div class="properties-location">
					<p>
						<i class="fa fa-envelope" aria-hidden="true"></i>
						<%=session.getAttribute("email")%>
					</p>
					<p>
						<i class="fa fa-phone" aria-hidden="true"></i>
						<%=session.getAttribute("phone")%>
					</p>
				</div>

				<p>
					Contact Info : <%=dto.getMobile() %>
				</p>

				<div class="information-area mb-80 wow fadeInUp"
					data-wow-delay="200ms">
					<!--Information Content -->
					<div class="information-content">
						<ul class="d-flex flex-wrap">
							<li><span>Start At : </span> <span><%=dto.getStartLoc() %></span></li>
							<li><span>Ends At : </span> <span><%=dto.getEndLoc() %></span></li>
							<li><span>Start Time : </span> <span><%=dto.getStartTime() %></span></li>
							<li><span>End Time : </span> <span><%=dto.getEndTime() %></span></li>
							<li><span>Gender : </span> <span><%=session.getAttribute("gender") %></span></li>
							<li><span>Vehicle : </span> <span><%=dto.getVehType() %></span></li>
							<li><span>People : </span> <span><%=dto.getPeople() %></span></li>
							<li><span>Price : </span> <span><%=dto.getPrice() %></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- **** Properties Hero Area End **** -->

	<!-- **** Properties-area Start **** -->
	<div class="rehomes-properties-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-12">

					<!-- Search Location Area -->
					<div class="search-location-area mb-80 wow fadeInUp"
						data-wow-delay="200ms">
						<h4 class="mb-30">Route</h4>

						<!-- Location Maps -->
						<div class="loction-map" id="map">
						</div>
						
						<script>
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: { lat: 40.771, lng: -73.974 }
            });
            directionsDisplay.setMap(map);

            
            calculateAndDisplayRoute(directionsDisplay, directionsService);
        }

        function calculateAndDisplayRoute(directionsDisplay, directionsService) {
            directionsService.route({
                origin: "<%=dto.getStartLoc()%>",
                destination: "<%=dto.getEndLoc()%>",
                travelMode: 'DRIVING'
            }, function (response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLh0O228pI5deP0yu6Ro-uBvWGLZOVUUk&libraries=places&callback=initMap">
</script>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- **** Properties-area End **** -->

	<!-- Requesters List Start -->

	<div class="rehomes-agent-list-area section-padding-100-60">
		<div class="container">
			<h2 class="mb-30">Requests</h2>
			<div class="row">

<%
RequestDto req = new RequestDao().findAccReq(phone);
if(req == null){
	response.sendRedirect("requesterlist.jsp?msg=selAReqFirst");
} else {
	UserDto user = new UserDao().viewUser(req.getRequester());
%>
<!-- Single Agent Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-agent-area wow fadeInUp" data-wow-delay="200ms">
						<!-- Agent Thumb -->
						<div class="single-agent-thumb">
							<img src="img/bg-img/swaraj.jpg" alt="">
						</div>
						<!-- Agent Info -->
						<div class="agent-info">
							<a href="#"><%=user.getName()%></a>
							<p>
								<i class="fa fa-phone" aria-hidden="true"></i><%=user.getPhone() %>
							</p>
							<p>
								<i class="fa fa-envelope" aria-hidden="true"></i>
								<%=user.getEmail() %>
							</p>
						</div>
						<!-- Agent Social Info -->
						<div class="agent-social-info d-flex"
							style="padding-bottom: 10px;">
							<div class="col-12" id="complete">
								<form action="controllers/acceptcontroller.jsp" method="post">
									<input type="hidden" value="<%=user.getPhone() %>" name="requester">
									<input type="hidden" value="complete" name="type">
									<input type="number" name="rat" class="form-control mb-30" placeholder="rating out of 5">
									<button type="submit" class="rehomes-btn"
										style="background-color: green;">Ride Completed</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Leave A Reply -->
					<div class="rehomes-comment-form mb-80 wow fadeInUp"
						data-wow-delay="200ms">
						<h4 class="mb-30">Leave A Comment</h4>

						<!-- Form -->
						<form class="#" method="post">
							<div class="row">
								<div class="col-12 col-lg-4">
									<input type="text" name="message-name"
										class="form-control mb-30" placeholder="Name">
								</div>
								<div class="col-12 col-lg-4">
									<input type="text" name="phone" class="form-control mb-30"
										placeholder="Number">
								</div>
								<div class="col-12 col-lg-4">
									<input type="email" name="message-email"
										class="form-control mb-30" placeholder="Email">
								</div>
								<div class="col-12">
									<textarea name="message" class="form-control mb-30"
										placeholder="Messages"></textarea>
								</div>
								<div class="col-12">
									<button type="submit" class="btn rehomes-btn mt-15">Send
										Messages</button>
								</div>
							</div>
						</form>
					</div>
<%
}

%>
				
			</div>
		</div>
	</div>
	<!-- Requesters List End -->
<%} %>
	<!-- **** Footer Area Start **** -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- **** Footer Area End **** -->
	
</body>

</html>