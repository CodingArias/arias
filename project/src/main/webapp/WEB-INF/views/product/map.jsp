

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&callback=initMap" async defer></script>

<script type="text/javascript">
var map;
function initMap() {
    // Create a map object and specify the DOM element for display.
      map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 36.4569, lng: 127.1569},
      scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
      mapTypeControl : false, //맵 타입 컨트롤 사용 여부
      zoom: 8
    });
    
    
  }
</script>


</head>
<body>
    <div id="map"></div>
</body>
</html>