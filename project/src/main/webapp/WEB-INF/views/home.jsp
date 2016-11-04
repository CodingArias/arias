<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>
<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>


<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/seoul.png" alt="Image">
			<div class="carousel-caption">
				<h3>Sell $</h3>
				<p>Money Money.</p>
			</div>
		</div>

		<div class="item">
			<img src="/resources/img/main/travel.jpg" alt="Image">
			<div class="carousel-caption">
				<h3>More Sell $</h3>
				<p>Lorem ipsum...</p>
			</div>
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
<form class="form-inline text-center form-group-lg">
	<div class="form-group">
		<input type="text" class="form-control" id="exampleInputName2"
			placeholder="나라 이름">
	</div>
	<div id="reportrange" class="form-group form-control"
		style="background: #fff; cursor: pointer;">
		<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
		<b class="caret"></b>
	</div>
	<div class="form-group">
		<!-- db로 코드를 넣어줘야함 -->
		<select class="form-control">
			<option>숙박인원 1명</option>
			<option>숙박인원 2명</option>
			<option>숙박인원 3명</option>
			<option>숙박인원 4명</option>
			<option>숙박인원 5명</option>
		</select>
	</div>
	<div class="form-group">
		<button type="button" class="btn btn-primary btn-lg">숙소 검색</button>
	</div>
</form>
<!-- 달력 끝  -->

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
						'지난 7일' : [ moment().subtract(6, 'days'), moment() ],
						'지난 30일' : [ moment().subtract(29, 'days'), moment() ],
						'이번 달' : [ moment().startOf('month'),
								moment().endOf('month') ],
						'지난 달' : [
								moment().subtract(1, 'month').startOf('month'),
								moment().subtract(1, 'month').endOf('month') ]
					},
					'startDate' : start_date,
					'endDate' : end_date
				}, cb);
	});
</script>
<!--달력 스크립트  끝-->
<div class="container text-center">
	<h3>최신 상품</h3>
	<br>

	<div class="row">
		<!-- 나중에 최신 순서로 뿌려주기 foreach 예정 -->
		<div class="col-sm-4 image">
			<img src="/resources/img/main/paris.jpg" class="img-responsive"
				style="width: 100%" alt="Image">
			<div class="text">
				<h4>파리</h4>
			</div>
		</div>
		<div class="col-sm-4 image">
			<img src="/resources/img/main/rome.jpg" class="img-responsive"
				style="width: 100%" alt="Image">
			<div class="text">
				<h4>로마</h4>
			</div>
		</div>
		<div class="col-sm-4 image">
			<img src="/resources/img/main/LA.jpg" class="img-responsive"
				style="width: 100%" alt="Image">
			<div class="text">
				<h4>로스앤젤레스</h4>
			</div>
		</div>
		<!-- 나중에 최신 순서로 뿌려주기 foreach 예정 끝-->
	</div>
</div>


<div class="container text-center">
	<h3>두근두근 세계여행</h3>
	<br>
	<div class="row">
		<div class="col-sm-6 image">
			<a href="#"> <img src="/resources/img/main/paris.jpg"
				class="img-responsive" style="width: 100%" alt="Image">
				<div class="text">
					<h4>파리</h4>
				</div>
			</a>
		</div>

		<div class="col-sm-3 image">
			<a href="#"> <img src="/resources/img/main/rome.jpg"
				class="img-responsive" style="width: 100%" alt="Image">
			</a>
			<div class="text">
				<h4>
					<a href="#">로마</a>
				</h4>
			</div>

		</div>
		<div class="col-sm-3 image">
			<a href="#"><img src="/resources/img/main/LA.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">로스앤젤레스</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a href="#"><img src="/resources/img/main/lisboa.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">리스본</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a href="#"><img src="/resources/img/main/tokyo.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
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
				<a href="#"><img src="/resources/img/main/newyork.jpg"
					class="img-responsive" style="width: 100%" alt="Image"> </a>
				<div class="text">
					<h4>
						<a href="#">뉴욕</a>
					</h4>
				</div>
			</div>
			<div class="image" style="top: 1em;">
				<a href="#"><img src="/resources/img/main/amsterdam.jpg"
					class="img-responsive" style="width: 100%" alt="Image"> </a>
				<div class="text">
					<h4>
						<a href="#">암스테르담</a>
					</h4>
				</div>
			</div>
		</div>

		<div class="col-sm-6 image">
			<a href="#"><img src="/resources/img/main/liverpool.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">리버풀</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image">
			<a href="#"><img src="/resources/img/main/barcelona.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">바르셀로나</a>
				</h4>
			</div>
		</div>
		<div class="col-sm-3 image" style="top: 1em;">
			<a href="#"><img src="/resources/img/main/berlin.jpg"
				class="img-responsive" style="width: 100%" alt="Image"> </a>
			<div class="text">
				<h4>
					<a href="#">베를린</a>
				</h4>
			</div>
		</div>

	</div>
</div>
<br>

<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>

</body>
</html>


