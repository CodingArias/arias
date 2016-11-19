<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/home.css">

<style>
.ima {
	position: relative;
	float: left;
}

.ima>a {
	position: relative;
	max-height: 250px;
	height: 100%;
	padding: 0px;
}

.ima>a>img {
	position: relative;
	max-height: 250px;
	width: 100%;
	height: 100%;
}

.ima .text {
	position: absolute;
	bottom: 2px;
	color: white;
	margin-left: 10px;
}
</style>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
		<li data-target="#myCarousel" data-slide-to="5"></li>
		<li data-target="#myCarousel" data-slide-to="6"></li>
		
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img1.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img2.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img3.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img4.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img5.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/img6.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<img src="/resources/img/main/travel.jpg" alt="Image">
			<div class="carousel-caption"></div>
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>

<br>
<!-- Search&달력 -->
<form class="form-inline text-center form-group-lg" method="get"
	action="search">
	<input type='hidden' name='checkin' id='checkin'> <input
		type='hidden' name='checkout' id='checkout'> <input
		type='hidden' name='lng' id='lng'> <input type='hidden'
		name='lat' id='lat'>
	<div class="form-group">
		<input type="text" class="form-control" id="pac-input"
			placeholder="도시 이름" name="keyword" required="required">
	</div>
	<div id="reportrange" class="form-group form-control"
		style="background: #fff; cursor: pointer;">
		<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
		<b class="caret"></b>
	</div>
	<div class="form-group">
		<input type="number" name="number_of_people" class="form-control"
			placeholder="숙박 인원 " required="required">
	</div>
	<div class="form-group">
		<input type="submit" id="btn" class="btn btn-primary btn-lg"
			value="숙소 검색">
	</div>
</form>
<!-- 달력 끝  -->

<!--달력 스크립트  -->
<script type="text/javascript">
	$("title").text("Travel Arias");
	var lat, lng;
	$(function() {
		// 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
		var start_date = moment();
		var end_date = moment();
		function cb(start, end) {
			$('#reportrange span').html(
					start.format('YYYY-MM-DD') + ' - '
							+ end.format('YYYY-MM-DD'));

			$('#checkin').val(start.format('YYYY-MM-DD'));
			$('#checkout').val(end.format('YYYY-MM-DD'));
		}
		cb(start_date, end_date);
		$('#reportrange').daterangepicker({
			"autoApply" : true,
			startDate : moment(),
			endDate : moment(),
			format : 'YYYY-MM-DD',
			"showDropdowns" : true,
		}, cb);
	});
</script>


<!--달력 스크립트  끝-->
<div class="container text-center">
	<h3>최신 숙소</h3>
	<br>

	<div class="row">
		<c:forEach var="product" items="${list}">
			<div class="col-sm-4 ima" style="margin-top: 10px;">
				<a
					href='/detail?product_seq=${product.product_seq}&checkin=${date}&checkout=${date}&number_of_people=1'
					class=""> <img
					src="/resources/product/product_main_image/${product.p_main_img}"
					class="img-responsive img-rounded" alt="Image">
				</a>
				<div class="col-sm-12 text-left">
						<div class="media">
							<div class="media-body">
								<h4>＄ ${product.product_price}</h4>
								<h4>${product.member_id}의 집~</h4>
							</div>
							<div class="media-right">
								<a href="#"> <img class="media-object img-circle"
									src="/resources/member/member_img/${product.member_img }" alt="" style="width: 60px; height: 60px;">
								</a>
							</div>
						</div>
					</div>	
				

			</div>

		</c:forEach>
		<!-- 나중에 최신 순서로 뿌려주기 foreach 예정 끝-->
	</div>
</div>


<div class="container text-center">
	<h3>두근두근 세계여행</h3>
	<br>
	<div class="row">
		<div class="col-sm-6 image">
			<a
				href="search?checkin=${date}&checkout=${date }&lng=2.3522219000000177&lat=48.85661400000001&keyword=프랑스일+드+프랑스파리&number_of_people=1">
				<img src="/resources/img/main/paris.jpg"
				class="img-responsive img-rounded" alt="Image">

			</a>
			<div class="text">
				<h4>파리</h4>
			</div>
			
		</div>

		<div class="col-sm-3 image">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=12.496365500000024&lat=41.90278349999999&keyword=이탈리아라치오로마&number_of_people=1">
				<img src="/resources/img/main/rome.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">로마</a>
				</h4>
			</div>

		</div>
		<div class="col-sm-3 image">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=-118.2436849&lat=34.0522342&keyword=미국캘리포니아로스앤젤레스&number_of_people=1"><img
				src="/resources/img/main/LA.jpg" class="img-responsive img-rounded"
				style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">로스앤젤레스</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=-9.139336599999979&lat=38.7222524&keyword=리스본&number_of_people=1"><img
				src="/resources/img/main/lisboa.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">리스본</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=139.73199249999993&lat=35.7090259&keyword=%EC%9D%BC%EB%B3%B8+%EB%8F%84%EC%BF%84&number_of_people=1"><img
				src="/resources/img/main/tokyo.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">도쿄</a>
				</h4>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-3">
			<div class="image">
				<a
					href="search?checkin=${date }&checkout=${date }&lng=-74.00594130000002&lat=40.7127837&keyword=미국뉴욕&number_of_people=1"><img
					src="/resources/img/main/newyork.jpg"
					class="img-responsive img-rounded" style="width: 100%" alt="Image">
				</a>
				<div class="text">
					<h4>
						<a href="#">뉴욕</a>
					</h4>
				</div>
			</div>
			<div class="image" style="top: 1em;">
				<a
					href="search?checkin=${date }&checkout=${date }&lng=4.895167899999933&lat=52.3702157&keyword=네덜란드노르트홀란트암스테르담&number_of_people=1"><img
					src="/resources/img/main/amsterdam.jpg"
					class="img-responsive img-rounded" style="width: 100%" alt="Image">
				</a>
				<div class="text">
					<h4>
						<a href="#">암스테르담</a>
					</h4>
				</div>
			</div>
		</div>

		<div class="col-sm-6 image">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=-2.9915726000000404&lat=53.4083714&keyword=영국잉글랜드리버풀&number_of_people=1"><img
				src="/resources/img/main/liverpool.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">리버풀</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=2.1734034999999494&lat=41.38506389999999&keyword=스페인카탈루나바르셀로나&number_of_people=1"><img
				src="/resources/img/main/barcelona.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">바르셀로나</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a
				href="search?checkin=${date }&checkout=${date }&lng=13.404953999999975&lat=52.52000659999999&keyword=독일베를린&number_of_people=1"><img
				src="/resources/img/main/berlin.jpg"
				class="img-responsive img-rounded" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">베를린</a>
				</h4>
			</div>
		</div>

	</div>
</div>
<br>

<%@include file="footer.jsp"%>

<script>
	function initAutocomplete() {
		//검색창 요소
		var input = document.getElementById('pac-input');
		//searchBox
		var searchBox = new google.maps.places.SearchBox(input);

		document.getElementById('btn').onclick = function() {

			//검색창 enter 강제 트리거		  
			/* 		google.maps.event.trigger(input, 'focus')
			 google.maps.event.trigger(input, 'keydown', {
			 keyCode: 13
			 });  */

			var places = searchBox.getPlaces();
			if (places != null) {
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
					$("#lat").val(place.geometry.location.lat());
					$("#lng").val(place.geometry.location.lng());
					var form = $(document).find("form");
					return true;
					//form[0].submit();
				});
			}
		};
	};
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&libraries=places&callback=initAutocomplete"
	async defer></script>
</body>
</html>


