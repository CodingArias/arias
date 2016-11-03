<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--지도 스크립트  -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&callback=initMap" async defer></script>
<!-- 지도스크립트 끝 -->


<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
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

<style>
      #map { height: 100%; }

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 870px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Projects</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-7 text-left"
				style="overflow: auto; height: 870px;">
				<br>

				<!-- Search&달력 form -->
				<form class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">날
							짜</label>
						<div class="col-sm-1"></div>
						<div class="col-sm-6">
							<div id="reportrange" class="form-control col-sm-3"
								style="background: #fff; cursor: pointer;">
								<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
								<b class="caret"></b>
							</div>
						</div>
						<div class="col-sm-3">
							<select class="form-control">
								<option>숙박인원 1명</option>
								<option>숙박인원 2명</option>
								<option>숙박인원 3명</option>
								<option>숙박인원 4명</option>
								<option>숙박인원 5명</option>
							</select>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">숙소유형</label>
						<div class="col-sm-1"></div>
						<div class="col-sm-9 btn-group">
							<div class="col-sm-4">
							<label class="btn btn-danger form-control"> <input
								type="checkbox" autocomplete="off"> 집 전체
							</label> 
							</div>
							<div class="col-sm-4">
							<label class="btn btn-danger form-control"> <input type="checkbox"
								autocomplete="off"> 개인실
							</label> 
							</div>
							<div class="col-sm-4">
							<label class="btn btn-danger form-control"> <input type="checkbox"
								autocomplete="off"> 다인실
							</label>
							</div>
						</div>
					</div>
				</form>
				<!--form 끝  -->
				<!--달력 스크립트  -->
				<script type="text/javascript">
					$(function() {
						// 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
						var start_date = moment().subtract(29, 'days');
						var end_date = moment();
						function cb(start, end) {
							$('#reportrange span').html(
									start.format('YYYY-MM-DD') + ' - '
											+ end.format('YYYY-MM-DD'));
						}
						cb(start_date, end_date);
						$('#reportrange').daterangepicker(
								{
									ranges : {
										'오늘' : [ moment(), moment() ],
										'어제' : [ moment().subtract(1, 'days'),
												moment().subtract(1, 'days') ],
										'지난 7일' : [
												moment().subtract(6, 'days'),
												moment() ],
										'지난 30일' : [
												moment().subtract(29, 'days'),
												moment() ],
										'이번 달' : [ moment().startOf('month'),
												moment().endOf('month') ],
										'지난 달' : [
												moment().subtract(1, 'month')
														.startOf('month'),
												moment().subtract(1, 'month')
														.endOf('month') ]
									},
									'startDate' : start_date,
									'endDate' : end_date
								}, cb);
					});
				</script>
				<!--달력 스크립트  끝-->
				
				<br>
				<!-- 상품 목록 불러오기 시작 foreach 사용해야함 -->
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				
				
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				<div class="col-sm-6">
					<img src="/resources/img/main/seoul.jpg"  class="img-rounded img-responsive" alt="Responsive image">
				</div>
				<!-- 상품 목록 불러오기 끝 -->
			</div>
			<div class="col-sm-5 sidenav">
				
    		<div id="map"></div>
			</div>
		</div>
	</div>


</body>
</html>

