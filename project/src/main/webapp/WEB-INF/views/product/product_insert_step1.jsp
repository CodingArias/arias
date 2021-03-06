<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/fileUpload.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&libraries=places&callback=initMap"
async defer></script>

<script type="text/javascript">

$("title").text("Hosting Step1 - 숙소 정보");
$(function(){
	imageChange($("#image"),$("#product_main_img"));
	$("#saveBtn").click(function(){
		var valid=true;
		valid=valid&&inputCheck($("#product_addr"),"주소",1);
		return valid;
	});
	
});
	var map;

	var marker;
	function createMarker(latlng) {
		if (marker != null)
			marker.setMap(null);
		marker = new google.maps.Marker({
			position : latlng,
		});
		marker.setMap(map);
	}
	
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.633114,
				lng : 127.05883500000004
			},
			scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
			mapTypeControl : false, //맵 타입 컨트롤 사용 여부
			zoom : 13
		});

		//지도 클릭 리스너

		google.maps.event.addListener(map, 'click', function(mouseEvent) {
			console.log(mouseEvent.latLng.lat());
			console.log(mouseEvent.latLng.lng());
			getAddress(mouseEvent.latLng);
			createMarker(mouseEvent.latLng);
		});

		//주소 데이터 추출 메소드
		function getAddress(latlng) {
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				latLng : latlng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0].geometry) {
						var address = results[0].formatted_address;
						console.log(address);
						createMarker(latlng);
						$("#product_addr").val(address);
						$("#product_lat").val(latlng.lat());
						$("#product_lng").val(latlng.lng());
						new google.maps.InfoWindow({
							content : address 
						}).open(map, marker);
					}
				}
			});
		}

		//검색창 요소
		var input = document.getElementById('pac-input');
		//searchBox
		var searchBox = new google.maps.places.SearchBox(input);
		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

		//화면전환이 일어나는 모든 행위에 대해서 호출된다.
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});

		//검색을 눌렀을 때, 호출되는 리스너
		searchBox.addListener('places_changed', function() {

			var places = searchBox.getPlaces();
			if (places.length == 0) {
				return;
			}

			// For each place, get the icon, name and location.
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				//검색한 지점에 마커가 생성된다.
				createMarker(place.geometry.location);
				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
				//검색한 지점의 주소
				console.log(place.formatted_address);
				$("#product_addr").val(place.formatted_address);
				$("#product_lat").val(place.geometry.location.lat());
				$("#product_lng").val(place.geometry.location.lng());
				console.log(place.geometry.location.lng());
				console.log(place.geometry.location.lat());
			});
			map.fitBounds(bounds);
		});

	}
	

</script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#map {
	height: 80%;
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

.main {
	height: 1800px;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 80%;
	height: 100%;
	background: white;
}

form {
	height: 100%;
}

.step_div {
	height: 5%;
}

.info1_div {
	height: 25%;
}
.map_div {

	height: 30%;
}

.info2_div {

	height: 20%;
}

.bottons_div {
	margin-top:10px;
	text-align:right;
	height: 5%;
}


#product_main_img {
	margin-bottom: 5px;
}
#product_info{
	height: 250px;
	width: 100%;
}


.info1_div .image_div {
	width: 35%;
	height: 100%;
	float: left;
}

.info1_div .product_input_div {
	float: left;
	width: 65%;
	height: 100%;
}

.info1_div .product_input_div p {
	padding-top: 10px;
}
#image{
	width:300px;
	heigth:300px;
}
em {
	color: red;
}
p {
	color: gray;
}
</style>

<div class="main">
	<div class="container">
	
		<form method="post" action="product_insert_step1" enctype="multipart/form-data">
			<input type="hidden" name="product_lat" id="product_lat">
			<input type="hidden" name="product_lng" id="product_lng">
			
			<div class="step_div">
				<h2>Hosting Step 1 - <span>숙소 정보</span></h2>
				<hr>
			</div>

			<div class="info1_div">
				<div class="image_div">
					<input type="file" name="product_main_img" id="product_main_img"  required="required"/>
					<img class="img-rounded" id="image" alt="product_image" src="/resources/img/noimage.jpg">
				</div>

				<div class="product_input_div">
					<h6>숙소의 제목을 붙여주세요. ( <em>*</em> )</h6>
					<input type="text" class="form-control" name="product_name" id="product_name" required="required"/>

					<h6>숙소 가격 (1일 기준) ( <em>*</em> )</h6>
					<input type="number" class="form-control input_type2" name="product_price" id="product_price" placeholder="화폐 단위 : $" required="required" />
<%-- 					<h6>숙소가 위치한 나라 ( <em>*</em> )</h6>
					<select id="country_id" name="country_id" class="form-control input_type2">
						<c:forEach var="country" items="${country_list}" varStatus="status">
							<c:if test="${status.first}">
								<option value="${country.country_id}" selected="selected">
									${country.country_name_kor }
								</option>
							</c:if>
							<option value="${country.country_id}" selected="selected">
								${country.country_name_kor }
							</option>
						</c:forEach>
					</select>  --%>

					<h6>주소 ( <em>*</em> )</h6>
					<input type="text" class="form-control" name="product_addr" id="product_addr" readonly="readonly" placeholder="지도에서 집의 위치를 찾아주세요." required="required"/>

					<h6>상세주소 ( <em>*</em> )</h6>
					<input type="text" class="form-control" name="product_addr_detail" id="product_addr_detail"  placeholder="상세주소를 입력해주세요." required="required"/>
					
					<h6>최대 인원 ( <em>*</em> )</h6>
					<input type="number" class="form-control" name="number_of_people" id="number_of_people" placeholder="숙박 가능한 최대 인원수를 입력해주세요." required="required"/>
				</div>
				<hr>
			</div>

			<div class="map_div">
				<h3>지도에서 숙소의 위치를 찾아아주세요.</h3>
				<hr>
				<input id="pac-input" class="controls" type="text"
					placeholder="Search Address">
				<div id="map"></div>
			</div>
			<div class="info2_div">
				<h3>숙소에 대한 간단한 소개를 적어주세요.</h3>
				<hr>
				<textarea style="padding: 20px;" class="controls"   rows="" cols="" name="product_info" id="product_info" required="required">

					ex :)
					저희 집은 공항, 공원, 문화예술, 도심, 대중교통 근처에 있습니다. 
					저희 집의 장점은 위치, 사람들, 분위기, 야외 공간, 지역입니다. 
					저희 집은 커플, 나홀로 여행족, 출장자, (아이 동반) 가족, 단체, 반려동물 동반에 적합합니다.</textarea>
			</div>
			<div class="bottons_div">
				<input id="saveBtn" class="btn btn-success" type="submit" value="1단계 저장"/>
			</div>
		</form>

	</div>

</div>

<jsp:include page="../footer.jsp"></jsp:include>
