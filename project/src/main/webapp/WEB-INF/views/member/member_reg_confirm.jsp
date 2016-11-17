<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page session="false" %>

<%@include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.btn-goHome').on('click', function() {
		self.location = "/";
	});
	
	$('.btn-info').on('click', function() {
		self.location = "/member/login"
	});
});	
</script>

<style type="text/css">
.reg_success_body {
	text-align: center;
	padding-top: 200px;
}

.reg_success_footer {
	padding-top: 100px;
}
</style>

<div class="reg_success">
	<div class="reg_success_body" align="center">
		<h3 style="font-weight: bold;">회원 가입 성공 </h3>
		<h4>Registration Success</h4>
		<br>
		<br>
		<h5>AIRAS의 새로운 가족이 되신 것을 환영합니다 :-)</h5>
		<h5>Now, You are our new Family. Welcome to join us :-)</h5>
	</div>
	
	<div class="reg_success_footer" align="center">
		<button type="button" class='btn btn-primary btn-goHome'>Go Home</button>
		<button type="button" id="regist_btn" class='btn btn-info'>Log-in</button>
	</div>
</div>
</body>
</html>