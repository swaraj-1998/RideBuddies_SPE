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

	<!-- Title -->
	<title>Ride Buddies</title>
	<link rel="icon" href="./img/core-img/favicon.png">
	<link rel="stylesheet" href="style.css">

	<script>
		function mapview() {
			var lnct = document.getElementById('lnctmap');
			var sanjeet = document.getElementById('sanjeetmap');
			var sumit = document.getElementById('sumitmap');
			document.getElementById('sumit').style.backgroundColor = "white";
			document.getElementById('sanjeet').style.backgroundColor = "white";
			document.getElementById('lnct').style.backgroundColor = "#eeeeee";
			lnct.style.display = "block";
			sanjeet.style.display = "none";
			sumit.style.display = "none";
		}
	</script>
</head>

<body onload="mapview()">

<!-- **** Header Area Start **** -->
<jsp:include page="header.html"></jsp:include>
<!-- **** Header Area End **** -->


<!-- **** Breadcrumb Area Start **** -->
<div class="breadcrumb-area bg-img bg-overlay-3 wow fadeInUp"
	 data-wow-delay="200ms"
	 style="background-image: url(img/bg-img/30.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Contact</li>
						</ol>
					</nav>
					<h2 class="page-title">Contact Us</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- **** Breadcrumb Area End **** -->

<!-- **** Contact Area Start **** -->
<section class="rehomes-support-and-contact-area section-padding-80-0">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-6">
				<div class="contact-information-area mb-80">
					<!-- Title -->
					<div class="support-title wow fadeInUp" data-wow-delay="200ms">
						<h2>Need Help ?</h2>
					</div>
					<div
							class="support-area-content d-flex align-items-center wow fadeInUp"
							data-wow-delay="200ms">
						<!-- Support Person Thumb -->
						<div class="support-perosn-thumb">
							<img src="img/bg-img/swaraj.jpg" alt="">
						</div>
						<div class="supprto-meta">
							<h4>Swaraj Bhatnagar</h4>
							<p>Research and Analysis</p>
							<p>70002 73946</p>
							<p>swarajbhatnagar@gmail.com</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6">
				<!-- Leave A Reply -->
				<div class="rehomes-contact-form mb-80 wow fadeInUp"
					 data-wow-delay="200ms">
					<!-- Title -->
					<div class="support-title">
						<h2>Get In Touch</h2>
					</div>

					<!-- Form -->
					<form class="support-form" action="#" method="post">
						<div class="row">
							<div class="col-12">
								<input type="text" name="message-name"
									   class="form-control mb-20" placeholder="Your Name">
							</div>
							<div class="col-12">
								<input type="email" name="senderemail"
									   class="form-control mb-20" placeholder="Your Email">
							</div>
							<div class="col-12">
									<textarea name="message" class="form-control mb-30"
											  placeholder="Messages"></textarea>
							</div>
							<div class="col-12">
								<button type="submit" class="btn rehomes-btn">Send
									Messages</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- **** Contact Area End **** -->


<!-- **** Google Maps **** -->
<div class="contact-maps mb-80 wow fadeInUp" data-wow-delay="200ms">

	<!-- Maps Iframe -->
	<iframe id="lnctmap"
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3667.5942686963867!2d77.45703971536044!3d23.185003866054753!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c43e7ea7b0695%3A0x89867e292e8e0efd!2sDanish%20Nagar%2C%20Bagmugaliya%2C%20Bhopal%2C%20Madhya%20Pradesh%20462026!5e0!3m2!1sen!2sin!4v1649942028063!5m2!1sen!2sin"
			width="600" height="450" frameborder="0" style="border: 0"
			allowfullscreen></iframe>
</div>
<!-- **** Google Maps End**** -->


<!-- **** Contact Information Start **** -->
<div class="contact--information-">
	<div class="container">
		<div class="row mb-40">

			<!-- Contact Info Area -->
			<div class="col-12 col-md-4" id="lnct">
				<div class="contact--info-area text-center wow fadeInUp"
					 data-wow-delay="200ms" onclick="mapview()"
					 style="cursor: pointer;">
					<br/>
					<h4>Swaraj Bhatnagar</h4>
					<p>
						Add: <span>Danish Nagar, Bhopal</span>
					</p>
					<p>
						Email: <span>swarajwednesday@gmail.com</span>
					</p>
					<p>
						Phone: <span>7000273946</span>
					</p>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- **** Contact Information End **** -->


<!-- **** Footer Area Start **** -->
<jsp:include page="footer.html"></jsp:include>
<!-- **** Footer Area End **** -->

</body>

</html>