<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
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

<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css" href="/resources/datapicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datapicker/moment.js"></script>
<script type="text/javascript" src="/resources/datapicker/daterangepicker.js"></script> 

 
</head>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

.image {
	position: relative;
	float: left;
}

.image .text {
	position: absolute;
	bottom: 2px;
	color: white;
	margin-left: 10px;
}

a:hover{
	background-color:transparent;
	text-decoration: none;
	color: white;
}
a:visited {
    background-color:transparent;
	text-decoration: none;
	color: white;
}
a:link {
    background-color:transparent;
	text-decoration: none;
	color: white;
}

a:active {
    background-color:transparent;
	text-decoration: none;
	color: white;
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
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- 달력 -->
	<div class="container">
    <div id="reportrange" class="pull-right"
        style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>  <span></span>
        <b class="caret"></b>
    </div>
	</div>
	<!-- 달력 끝  -->
	
	<!--달력 스크립트  -->
<script type="text/javascript">
    $(function() {
        // 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
        var start_date = moment().subtract(29, 'days');
        var end_date = moment();
        function cb(start, end) {
            $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
        }
        cb(start_date, end_date); 
        $('#reportrange').daterangepicker({
            ranges : {
                '오늘' : [ moment(), moment() ],
                '어제' : [ moment().subtract(1, 'days'), moment().subtract(1, 'days') ],
                '지난 7일' : [ moment().subtract(6, 'days'), moment() ],
                '지난 30일' : [ moment().subtract(29, 'days'), moment() ],
                '이번 달' : [ moment().startOf('month'), moment().endOf('month') ],
                '지난 달' : [ moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month') ]
            },
            'startDate' :  start_date,
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
			<a href="#">
				<img src="/resources/img/main/paris.jpg" class="img-responsive"
					style="width: 100%" alt="Image" >
			</a>
				<div class="text">
					<h4><a href="#">파리</a></h4>
				</div>
			
			</div>
			
			<div class="col-sm-3 image">
				<img src="/resources/img/main/rome.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>로마</h4>
				</div>

			</div>
			<div class="col-sm-3 image">
				<img src="/resources/img/main/LA.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>로스앤젤레스</h4>
				</div>
			</div>
			<div class="col-sm-3 image" style="top: 1em;">
				<img src="/resources/img/main/lisboa.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>리스본</h4>
				</div>
			</div>
			<div class="col-sm-3 image" style="top: 1em;">
				<img src="/resources/img/main/tokyo.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>도쿄</h4>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<div class="image">
					<img src="/resources/img/main/newyork.jpg" class="img-responsive"
						style="width: 100%" alt="Image">
					<div class="text">
						<h4>뉴욕</h4>
					</div>
				</div>
				<div class="image" style="top: 1em;">
					<img src="/resources/img/main/amsterdam.jpg" class="img-responsive"
						style="width: 100%" alt="Image">
					<div class="text">
						<h4>암스테르담</h4>
					</div>
				</div>
			</div>

			<div class="col-sm-6 image">
				<img src="/resources/img/main/liverpool.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>리버풀</h4>
				</div>
			</div>
			<div class="col-sm-3 image">
				<img src="/resources/img/main/barcelona.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>바르셀로나</h4>
				</div>
			</div>
			<div class="col-sm-3 image" style="top: 1em;">
				<img src="/resources/img/main/berlin.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
				<div class="text">
					<h4>베를린</h4>
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


