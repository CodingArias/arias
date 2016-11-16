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
	height: auto;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 80%;
	height: 100%;
	background: white;
}
form{
	height: 100%;
}
.step_div {
	height: 5%;
}
.info_div {
	height: 30%;
	margin-bottom: 50px;
}

.bottons_div{
	height: 10%;
	margin-top:10px;
	text-align:right;
}
</style>


<script type="text/javascript">
	$("title").text("Reservation - 숙소 예약 ");


	$(function() {
	});
		
</script>


<div class="main">
	<div class="container">
		<form action="#" method="post">
		
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>