<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- 
/product/product_insert_step1 -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li id="hosting"><a href="#" class="dropdown"
					data-toggle="dropdown">Hosting</a>
					<ul class="dropdown-menu">
						<li class="h5"><a href="/product/product_list">내 숙소 리스트</a></li>
						<li class="h5"><a href="/product/product_insert_step1">숙소 작성</a></li>
					</ul></li>
					
					
				<li><a href="/notice/list">Notice</a></li>
				<li><a href="#">statistics</a></li>
				<li id="mypage"><a href="#" class="dropdown"
					data-toggle="dropdown">My page</a>
					<ul class="dropdown-menu">
						<li class="h5"><a href="/member/read?member_id=${member.member_id}">내 정보</a></li>
						<li class="h5"><a href="/product/my_reservation_list">나의 예약 정보</a></li>
						<c:if test="${admin == true}">
							<li class="h5"><a href="/member/list">Administer </a></li>
						</c:if>
						
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${member != null}">
					<li> <img class="img-circle" style=" margin-top:5px; margin-right:10px; width: 40px; height: 40px;" src="/resources/member/member_img/${member.member_img }"></li>
					<li> <span style="color: white; display:inline-block; padding-top: 15px;">${member.member_first_name} ${member.member_last_name} </span></li>
				</c:if>
				<li id="login_status">
				<c:if test="${member == null}">
					<a href="/member/login">
					<span class="glyphicon glyphicon-log-in"></span> Login</a>
				</c:if>
				<c:if test="${member != null}">
					<a href="/member/logout">
					<span class="glyphicon glyphicon-log-in"></span> Logout</a>
				</c:if>
				</li>
			</ul>
		</div>

	</div>
</nav>
<body>