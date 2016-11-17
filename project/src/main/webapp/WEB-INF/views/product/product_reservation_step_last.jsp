<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>

<style type="text/css">
.main {
	height: 800px;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 60%;
	height: 100%;
	background: white;
}
form{
	height: 100%;
}

.top {
	height: 10%;
}
.middle {
	height: 80%;
	text-align:center;
}
.bottom {
	height: 10%;
}
</style>


<script type="text/javascript">
	$("title").text("Hosting Reservation - 예약 완료");

	$(function() {
	});
</script>


<div class="main">
	<div class="container">
		<div class="top">
		</div>
		<div class="middle">
			<h1>숙소 예약이 완료되셨습니다.!!</h1>
			<input id="backBtn" class="btn btn-success" type="button" value="확인" onclick="location.href='/'"/>
		
		</div>		
		<div class="bottom">
		</div>		
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>