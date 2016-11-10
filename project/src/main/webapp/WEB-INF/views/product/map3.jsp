<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
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
  
    <input type="button" name="btn"id="btn" style="height: 200px; width: 200px;" />
    <input id="pac-input" class="controls" type="text" placeholder="Search Address">
    <script>

function initAutocomplete() {
  
  //검색창 요소
  var input = document.getElementById('pac-input');
  //searchBox
  var searchBox = new google.maps.places.SearchBox(input);

  


  //검색을 눌렀을 때, 호출되는 리스너
/*   searchBox.addListener('places_changed', function() {
		
		var places = searchBox.getPlaces();
		if (places.length == 0) {
			return;
		}
		console.log(places);
		
	    // For each place, get the icon, name and location.
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
	
	      
	      bounds.extend(place.geometry.location);
	   
	      
	      //검색한 지점의 주소
	      console.log(place.formatted_address);
	      //검색한 지점의 x,y 좌표
		  console.log(place.geometry.location.lng());
	      console.log(place.geometry.location.lat());
	      
	    });
	    
	    
	  }); */
  
  document.getElementById('btn').onclick = function () {
  	var places = searchBox.getPlaces();
  	if(places!=null){
		if (places.length == 0) {
			return;
		}
		console.log(places);
		
	    // For each place, get the icon, name and location.
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
	
	      
	      bounds.extend(place.geometry.location);
	   
	      
	      //검색한 지점의 주소
	      console.log(place.formatted_address);
	      //검색한 지점의 x,y 좌표
		  console.log(place.geometry.location.lng());
	      console.log(place.geometry.location.lat());
	      
	    });
  	}
  };
  
}


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&libraries=places&callback=initAutocomplete"
         async defer></script>
  </body>
</html>