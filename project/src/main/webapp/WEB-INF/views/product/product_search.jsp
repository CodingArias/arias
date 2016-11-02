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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
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
      .row.content {height:auto;}
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
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
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">
  <div class="row content">
    
    <div class="col-sm-7 text-left" style="overflow:auto; height:500px;">
    	
      <!-- Search&달력 form -->
	<form class="form-inline text-center form-group-lg">
		<div class="form-group">
		<label class="col-sm-2">날 짜</label>
		<div id="reportrange" class="form-group form-control col-sm-2"
			style="background: #fff; cursor: pointer;">
			<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
			<b class="caret"></b>
		</div>
		<div class="form-group col-sm-3">
			<!-- db로 코드를 넣어줘야함 -->
			<select class="form-control">
				<option>숙박인원 1명</option>
				<option>숙박인원 2명</option>
				<option>숙박인원 3명</option>
				<option>숙박인원 4명</option>
				<option>숙박인원 5명</option>
			</select>
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
			$('#reportrange')
					.daterangepicker(
							{
								ranges : {
									'오늘' : [ moment(), moment() ],
									'어제' : [ moment().subtract(1, 'days'),
											moment().subtract(1, 'days') ],
									'지난 7일' : [ moment().subtract(6, 'days'),
											moment() ],
									'지난 30일' : [ moment().subtract(29, 'days'),
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
    </div>
    <div class="col-sm-5 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>


</body>
</html>

