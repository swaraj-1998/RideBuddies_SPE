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

</head>

<body>

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
								<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">About</li>
							</ol>
						</nav>
						<h2 class="page-title">About Us</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- **** Breadcrumb Area End **** -->

	<!-- **** About Us Area Start **** -->
	<section class="about-us-area section-padding-100-60">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="about-us-title mb-40 wow fadeInUp"
						data-wow-delay="200ms">
						<h2>
							Hello! Welcome to <span>Ride</span> Buddies
						</h2>
						<p>
							<b>Ride</b> Buddies is your companion for traveling. It is an
							environment friendly digital way to share ride. It not only save
							u trouble for finding a ride but also helps you earn money as
							well as save money.
						</p>
					</div>
				</div>

				<!-- Single About Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-about-content wow fadeInUp"
						data-wow-delay="200ms">
						<!-- Thumb -->
						<div class="single-about-thumb">
							<img src="img/bg-img/31.jpg" alt="">
						</div>
						<h4>Our Company</h4>
						<p>The Company believes in being honest to others and being committed to work. Work like a slave , Live like a King</p>
					</div>
				</div>

				<!-- Single About Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-about-content wow fadeInUp"
						data-wow-delay="200ms">
						<!-- Thumb -->
						<div class="single-about-thumb">
							<img src="img/bg-img/32.jpg" alt="">
						</div>
						<h4>Our Vision</h4>
						<p>Our vision is to get a good job. For that we have to
							complete our projects and assignments day night which leaves us
							with no time for self assessment and productive work.</p>
					</div>
				</div>

				<!-- Single About Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-about-content wow fadeInUp"
						data-wow-delay="200ms">
						<!-- Thumb -->
						<div class="single-about-thumb">
							<img src="img/bg-img/33.jpg" alt="">
						</div>
						<h4>Our Quality</h4>
						<p>We assure you of our quality. You will not be disappointed
							with our work in any field. Being an engineer of Indian origin we
							are well qualified and trained for any kind of work.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- **** About Us Area End **** -->

	<!-- **** Testimonials Area Start **** -->
	<section
		class="rehomes-testimonial-area bg-img bg-overlay-4 jarallax section-padding-80"
		style="background-image: url(img/bg-img/34.jpg);">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-10 col-lg-8">
					<!-- Testimonial-area Slider -->
					<div class="testimonial-area owl-carousel wow fadeInUp"
						data-wow-delay="200ms">
						<!-- Single Testimonial Slider -->
						<div class="single-testimonial-content text-center">
							<!-- Icon -->
							<div class="testimonial-icon">
								<img src="img/core-img/quote.png" alt="">
							</div>
							<h5>"I was so much frustrated while completing this project.
								But i am glad that we completed it and saved our Arses."</h5>
							<!-- Testimonial-Meta -->
							<div class="testimonial-meta">
								<h5>Sanjeet Anand</h5>
								<p>Web Developer</p>
							</div>
						</div>

						<!-- Single Testimonial Slider -->
						<div class="single-testimonial-content text-center">
							<!-- Icon -->
							<div class="testimonial-icon">
								<img src="img/core-img/quote.png" alt="">
							</div>
							<h5>"Will be posted later"</h5>
							<!-- Testimonial-Meta -->
							<div class="testimonial-meta">
								<h5>Sumit Mishra</h5>
								<p>Android Developer</p>
							</div>
						</div>

						<!-- Single Testimonial Slider -->
						<div class="single-testimonial-content text-center">
							<!-- Icon -->
							<div class="testimonial-icon">
								<img src="img/core-img/quote.png" alt="">
							</div>
							<h5>"Will be posted later"</h5>
							<!-- Testimonial-Meta -->
							<div class="testimonial-meta">
								<h5>Swaraj Bhatnagar</h5>
								<p>Researcher and Analyzer</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- **** Testimonials Area End **** -->


	<!-- **** Choose Us Area Start **** -->
	<jsp:include page="chooseus.html"></jsp:include>
	<!-- **** Choose Us Area End **** -->

	<!-- **** Footer Area Start **** -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- **** Footer Area End **** -->

</body>

</html>