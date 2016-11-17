<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link rel="stylesheet" href="/resources/css/header.css">
</head>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span>
				<!--화면 축소시 생기는 버튼 리스트들-->
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Logo</a>
		</div>


		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="/product/product_insert_step1">Hosting</a></li>
				<li><a href="/notice/list">Notice</a></li>
				<li><a href="#">statistics</a></li>
				<li id="mypage"><a href="#" class="dropdown"
					data-toggle="dropdown">My page</a>
					<ul class="dropdown-menu">
						<li class="h4"><a href="#">My Information</a></li>
						<li class="h4"><a href="#">Reservation Status</a></li>
						<li class="h4"><a href="#">Hosting List</a></li>
						<li class="h4"><a href="/member/list">Administer</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li id="login_status">
				<c:if test="${member == null}">
					<a href="/member/login">
					<span class="glyphicon glyphicon-log-in"></span> Login</a>
				</c:if>
				<c:if test="${member != null}">
					<a href="#">
					<span class="glyphicon glyphicon-log-in"></span> Logout</a>
				</c:if>
				</li>
					
			</ul>
		</div>

	</div>
</nav>
<body>