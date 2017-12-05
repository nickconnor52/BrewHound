<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#mapPage {
	height: 100%;
}
/* /* Optional: Makes the sample page fill the window. 
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
*/
</style>

<div class="jumbotron"
	style="background-image: url('img/homepage/homepage.jpg')">
	<section class="homePage container-fluid">
		<h2 id="title-text-homepage" class="center">
			<style>
@import url('https://fonts.googleapis.com/css?family=Work+Sans');
</style>
			Local Brews
		</h2>
		<div class="row">
			<div class="brewery col-sm-12 col-md-12">
				<div class="iframe-container">
					<div id="mapPage" class="img-rounded"></div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
function initMap() {
	var map = new google.maps.Map(document.getElementById('mapPage'), {
		zoom : 13,
		center : {
			lat : 39.97,
			lng : -83.0
		}
	});

	var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var locations = [];
	
	<c:forEach var="brewery" items="${breweryList}">
		<c:if test="${brewery.breweryId < 14}">
			locations.push({lat: ${brewery.latitude}, lng: ${brewery.longitude}});
		</c:if>
	</c:forEach>
	
	
	var markers = locations.map(function(location, i) {
		return new google.maps.Marker({
			position : location,
			label : labels[i % labels.length]
		});
	});

	var markerCluster = new MarkerClusterer(
			map,
			markers,
			{
				<c:url var="imageLoc" value="/google-maps-resources/m"/>
				imagePath : '${imageLoc}'
			});
}
	  
</script>
<c:url var="clusterLoc" value="/google-maps-resources/markerclusterer.js"/>
<script src="${clusterLoc}"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQJt8sM0_cDCBf16mHs46XUmxHJg22JHY&callback=initMap"></script>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />