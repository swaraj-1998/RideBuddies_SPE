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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Ride Buddies</title>
    <link rel="icon" href="./img/core-img/favicon.png">
    <link rel="stylesheet" href="style.css">
</head>

<body>

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
    <div class="rehomes-search-form-area wow fadeInUp" data-wow-delay="200ms">
        <div class="container">
            <div class="rehomes-search-form">
                <form action="controllers/createcontroller.jsp" method="post">
                <input type="hidden" name="type" value="create">
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
                                <div class="col-12 col-md-6 col-lg-3">
                                    <select name="vehType" id="vehType" class="form-control">
                                    	<option value="">Select Vehicle</option>
                                        <option value="bike">Bike</option>
                                        <option value="car">Car</option>
                                        <option value="bus">Bus</option>
                                        <option value="truck">Truck</option>
                                    </select>
                                </div> 
                                
                                <div class="col-12 col-md-6 col-lg-3">
                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Enter phone number">
                                </div>
                                
                                <div class="col-12 col-md-6 col-lg-3">
                                    <input type="number" class="form-control" name="startTime" id="startTime" placeholder="start time">
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <input type="number" class="form-control" name="endTime" id="endTime" placeholder="end time">
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <select name="people" id="people" class="form-control">
                                        <option value="0">Person</option>
                                        <option value="1">01</option>
                                        <option value="2">02</option>
                                        <option value="3">03</option>
                                        <option value="4">04</option>
                                        <option value="5">05</option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <input type="number" class="form-control" name="price" id="price" placeholder="enter price">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-2">
                            <button type="submit" id="submit" class="btn rehomes-search-btn">Create</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: {
    				lat : 23.2599,
    				lng : 77.4126
    			}
            });
            directionsDisplay.setMap(map);

            var onChangeHandler = function () {
                calculateAndDisplayRoute(
                    directionsDisplay, directionsService);
            };

            var input = document.getElementById('end');
            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);
            autocomplete.setFields(['place_id', 'geometry', 'name']);
            autocomplete.addListener('place_changed', function () {
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    return;
                }
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
                document.getElementById("startLat").value = place.geometry.location.lat();
                document.getElementById("startLng").value = place.geometry.location.lng();
            });
            document.getElementById('end').addEventListener('change', onChangeHandler);
            document.getElementById('start').addEventListener('change', onChangeHandler);
        }

        function calculateAndDisplayRoute(directionsDisplay, directionsService) {
            directionsService.route({
                origin: document.getElementById('start').value,
                destination: document.getElementById('end').value,
                travelMode: 'DRIVING'
            }, function (response, status) {
            	if(document.getElementById('start').value == "" || document.getElementById('end').value == ""){
            		return;
            	}
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLh0O228pI5deP0yu6Ro-uBvWGLZOVUUk&libraries=places&callback=initMap">
    </script>
    
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