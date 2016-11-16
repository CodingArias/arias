<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>


<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>



<style>
.img {
	height: 210px;
}
</style>



<div class="container text-center">
	<div class="row">
		<br>
		<div class="col-sm-3 text-left">
			<div>
				<h4><a href="#">숙소 목록</a></h4>
				<h4><a href="#">예약 관리</a></h4>
				
			</div>
		</div>
		<div class="col-sm-9 text-left">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>등록 진행중</h4></div>
				<div class="panel-body">
					<div class="col-sm-5">
						<img src="/resources/img/main/seoul.png" alt="Image" class="img-responsive img">
					</div>
					<div class="col-sm-7">
						<h5>숙소 등록이 step1 까지 되었습니다.</h5>
						<h3>다인실(위치: Gwangjing-gu)</h3>
						<h5>최종 업데이트: 2016월 11월 12일 </h5>
						<br><br><br><br>
						<button class="btn-primary">다시 작성하기</button>
						
					</div>
				</div>
				
			</div>
		</div>


	</div>
</div>

<br>


<%@include file="../footer.jsp"%>

<!--달력 스크립트  끝-->

