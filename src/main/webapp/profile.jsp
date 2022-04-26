<%@page import="complete.CompleteDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="riderequestor.RequestDao"%>
<%@page import="ridecreator.RideDao"%>
<%@page import="ridecreator.RideDto"%>
<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%
	if (session.getAttribute("phone") == null) {
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

<script>
	function updateView() {
		var update = document.getElementById('update');
		update.style.display = "block";
	}
	function updateHide() {
		var update = document.getElementById('update');
		update.style.display = "none";
	}
</script>
</head>
<body onload="updateHide()">

	<!-- **** Header Area Start **** -->
	<jsp:include page="header.html"></jsp:include>
	<!-- **** Header Area End **** -->

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
				<br />
				<h2><%=session.getAttribute("name")%></h2>
				<br />
				<div class="agent-thumb">
					<a href=""><img src="img/bg-img/72.jpg" alt="" height="150px"
						width="150px"></a>
				</div>
				<div class="information-area mb-80 wow fadeInUp"
					data-wow-delay="200ms">
					<!--Information Content -->
					<br /> <br />
					<div>
						<ul style="font-weight: bold;">
							<li><span style="color: grey;">Email : </span> <span><%=session.getAttribute("email")%></span></li>
							<br />
							<li><span style="color: grey;">Phone : </span> <span>
									<%=session.getAttribute("phone")%></span></li>
							<br />
							<li><span style="color: grey;">Gender : </span> <span>
									<%=session.getAttribute("gender")%></span></li>
							<br />
							<li><span style="color: grey;">Ride Rat : </span> <span>
									<%=session.getAttribute("riderat")%></span></li>
							<br />
							<li><span style="color: grey;">Request Rat : </span> <span>
									<%=session.getAttribute("reqrat")%></span></li>
							<br />
							
						</ul>
					</div>
					<div class="col-12">
						<a href="#update"><button type="submit" onclick="updateView()"
								class="btn rehomes-btn mt-15 w-100">Update Profile</button></a>
					</div>
					<div class="col-12">
						<form action="controllers/profilecontroller.jsp" method="post">
							<input type="hidden" value="delete" name="type">
							<button type="submit" class="btn rehomes-btn mt-15 w-100">Delete
								Profile</button>
						</form>
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


					<!-- Update Profile -->
					<div class="rehomes-comment-form mb-80 wow fadeInUp"
						data-wow-delay="200ms" id="update">
						<h4 class="mb-30">Update your profile</h4>

						<!-- Form -->
						<form class="#" method="post"
							action="controllers/profilecontroller.jsp">
							<input type="hidden" name="type" value="update">
							<div class="row">
								<div class="col-12 col-lg-3">
									<input type="text" name="name" class="form-control mb-30"
										placeholder="Name" required="required"
										value="<%=session.getAttribute("name")%>">
								</div>
								<div class="col-12 col-lg-3">
									<input type="email" name="email" class="form-control mb-30"
										placeholder="Email" required="required"
										value="<%=session.getAttribute("email")%>">
								</div>
								<div class="col-12 col-lg-3">
									<input type="text" name="gender" class="form-control mb-30"
										placeholder="Gender" required="required"
										value="<%=session.getAttribute("gender")%>">
								</div>
								<div class="col-12 col-lg-3">
									<button type="submit" class="btn rehomes-btn">Update</button>
								</div>
							</div>
						</form>
					</div>
					<!-- Update Profile -->
					<br /> <br />

					<!-- Ride Given -->
					<div class="agent-information-area mb-80 wow fadeInUp"
						data-wow-delay="200ms">
						<h4 class="mb-30">Rides Given</h4>

						<!-- RideGiven Information Info -->
						<%
							String phone = (String) session.getAttribute("phone");
							ArrayList<String> list = new CompleteDao().viewRideGiven(phone);
							if (list.isEmpty()) {
						%>
						<h6>No rid e given yet...</h6>
						<%
							} else {
								for (String mobile : list) {
									UserDto dto = new UserDao().viewUser(mobile);
						%>
						<div class="agent-information-info d-flex align-items-center">
							<!-- Agent Thumb -->
							<div class="agent-thumb">
								<img src="img/bg-img/72.jpg" alt="" height="150px" width="150px">
							</div>
							<!-- Agent Info -->
							<div class="agent-info">
								<h4><%=dto.getName()%></h4>
								<br />
								<div class="agent-contact d-flex justify-content-between">
									<p>
										Phone: <span><%=dto.getPhone()%></span>
									</p>
									<br />
								</div>
								<div class="agent-contact d-flex justify-content-between">
									<p>
										Email: <span><%=dto.getEmail()%></span>
									</p>
								</div>
							</div>
						</div>
						<%
							}
							}
						%>
					</div>
					<!-- Ride Given -->

					<!-- Ride Taken -->
					<div class="agent-information-area mb-80 wow fadeInUp"
						data-wow-delay="200ms">
						<h4 class="mb-30">Rides Taken</h4>

						<!-- RIdeTaken Information Info -->
						<%
							ArrayList<String> list1 = new CompleteDao().viewRideTaken(phone);
							if (list1.isEmpty()) {
						%>
						<h6>No ride taken yet...</h6>
						<%
							} else {
								for (String mobile : list1) {
									UserDto dto1 = new UserDao().viewUser(mobile);
						%>
						<div class="agent-information-info d-flex align-items-center">
							<!-- Agent Thumb -->
							<div class="agent-thumb">
								<img src="img/bg-img/72.jpg" alt="" height="150px" width="150px">
							</div>
							<!-- Agent Info -->
							<div class="agent-info">
								<h4><%=dto1.getName()%></h4>
								<br />
								<div class="agent-contact d-flex justify-content-between">
									<p>
										Phone: <span><%=dto1.getPhone()%></span>
									</p>
									<br />
								</div>
								<div class="agent-contact d-flex justify-content-between">
									<p>
										Email: <span><%=dto1.getEmail()%></span>
									</p>
								</div>
							</div>
						</div>
						<%
							}
							}
						%>
					</div>
					<!-- Ride Taken -->

				</div>
			</div>
		</div>
	</div>
	<!-- **** Properties-area End **** -->

	<!-- **** Footer Area Start **** -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- **** Footer Area End **** -->

</body>
</html>