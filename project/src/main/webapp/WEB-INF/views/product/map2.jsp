<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>
    <title>Places Searchbox</title>
    <style>
      #target {
        width: 345px;
      }
    </style>
  </head>
  <body>
    <input id="pac-input" class="controls" type="text" placeholder="Search Address">
    <div id="map"></div>
    <script>
    
   // console.log(new Date(Date.parse("2016-04-24")).format("YYYY-MM-DD"));
   console.log(moment("2011-10-31", "YYYY-MM-DD")); 
function initAutocomplete() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.633114, lng: 127.05883500000004},
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  
  //지도 클릭 리스너
  google.maps.event.addListener(map, 'click', function (mouseEvent) {     
	  console.log(mouseEvent.latLng.lat());
	  console.log(mouseEvent.latLng.lng());
	  getAddress(mouseEvent.latLng); 
	 });

  var beforeMarkers;
  map.addListener('dragend', function() {

	  var pos=map.getCenter();
 
	  
	  if(beforeMarkers!=null)
		  beforeMarkers.setMap(null);
		  
	  console.log("drag end : "+pos.lat()+" , "+pos.lng());  
	   beforeMarkers = new google.maps.Marker({
		  position: pos,
		  map: map,
		  title: 'Hello World!'
	  });
	  
	  new google.maps.InfoWindow({
	   	   content: '<p>test</p>'
	    }).open(map, beforeMarkers); 
		  
	  
	  window.setTimeout(function() {
	  }, 3000);
	  console.log("drag_end");
  });

  
  //주소 데이터 추출 메소드
  function getAddress(latlng) {
	  var geocoder = new google.maps.Geocoder();
	 
	  geocoder.geocode({
	   	 latLng: latlng
	  }, function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK) {
			  if (results[0].geometry) {
	           var address = results[0].formatted_address;
	           console.log(address);
/* 	           var marker = new google.maps.Marker({
	               position: latlng,
	               map: map
	           }); */

/*  	           new google.maps.InfoWindow({
	        	   content: address + "<br>(Lat, Lng) = " + latlng
	         //content: address
	         }).open(map, marker);  */
			  }
		  } 
	  });
  }
	 

  //검색창 요소
  var input = document.getElementById('pac-input');
  //searchBox
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);


  
  map.addListener('bounds_changed', function() {
	  searchBox.setBounds(map.getBounds());
  });
  

  
  var markers = [];
  //검색을 눌렀을 때, 호출되는 리스너
  searchBox.addListener('places_changed', function() {
		
		var places = searchBox.getPlaces();
		if (places.length == 0) {
			return;
		}

		console.log(places);
	    // 검색 전에 존재했던 마커들을 모두 삭제한다.
	    markers.forEach(function(marker) {
	      marker.setMap(null);
	    });
	    markers = [];

	    // For each place, get the icon, name and location.
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
	    	//아이콘 이미지 생성
	    	var icon = {        
	    			url: place.icon,      
	    			size: new google.maps.Size(71, 71),     
	    			origin: new google.maps.Point(0, 0),     
	    			anchor: new google.maps.Point(17, 34),       
	    			scaledSize: new google.maps.Size(25, 25)   
	    	};
	
	      //검색한 지점에 마커가 생성된다.
	      markers.push(new google.maps.Marker({
	        map: map,
	        icon: icon,
	        title: place.name,
	        position: place.geometry.location
	      }));
	
	      if (place.geometry.viewport) {
	        // Only geocodes have viewport.
	        bounds.union(place.geometry.viewport);
	      } else {
	        bounds.extend(place.geometry.location);
	      }
	      
	      //검색한 지점의 주소
	      console.log(place.formatted_address);
	      //검색한 지점의 x,y 좌표
		  console.log(place.geometry.location.lng());
	      console.log(place.geometry.location.lat());
	    });
	    
	    
	    map.fitBounds(bounds);
	  });
	  // [END region_getplaces]
}


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&libraries=places&callback=initAutocomplete"
         async defer></script>
  </body>
</html>