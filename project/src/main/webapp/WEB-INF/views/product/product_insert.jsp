<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&callback=initMap"
	async defer></script>

<script type="text/javascript">
	var map;
	function initMap() {
		// Create a map object and specify the DOM element for display.
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 36.4569,
				lng : 127.1569
			},
			scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
			mapTypeControl : false, //맵 타입 컨트롤 사용 여부
			zoom : 8
		});

	}
</script>
<style>

* {
	margin: 0px;
	padding: 0px;
}
  #map { 
  height: 100%; 
  	}

.main {
	height: 1200px;
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
	height: 10%;
}

.info1_div {
	height: 30%;
	margin-bottom: 40px;
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

.map_div {
	height: 30%;
}

.info2_div {
	height: 20%;
}

.bottons_div {
	height: 10%;
}

.input_type1 {
	width: 100px;
}

.input_type2 {
	width: 150px;
}

.input_type3 {
	width: 400px;
}

#product_main_img {
	margin-bottom: 10px;
}
</style>

<div class="main">
	<div class="container">
		<div class="step_div">
			<h2>Hosting Step 1</h2>
			<hr>
		</div>

		<form>
			<div class="info1_div">
				<div class="image_div">
					<input type="file" name = "product_main_img" id="product_main_img"/>
					<img alt="product_image" src="/resources/img/noimage.jpg"> 
					<hr>
				</div>

				<div class="product_input_div">
					<p style="color: gray;">Hosting Name</p>
					<input type="text" class="input_type3" />

					<p style="color: gray;">Hosting Price</p>
					<input type="text" />

					<p style="color: gray;">Country</p>
					<select>
						<option>Korea</option>
						<option>U.S.A</option>
						<option>Japan</option>

					</select>

					<p style="color: gray;">Address</p>
					<input type="text" class="input_type3" />

					<p style="color: gray;">Detail Address</p>
					<input type="text" class="input_type3" />
					<hr>
				</div>
			</div>
		
		<div class="map_div">
			<div id="map"></div>
		</div>
		<div class="info2_div"></div>
		<div class="bottons_div"></div>
		</form>

	</div>

</div>

<jsp:include page="../footer.jsp"></jsp:include>
