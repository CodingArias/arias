<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page session="false" %>
<%@include file="../header.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
#content-head {
	margin-top: 30px;
	width : 1060px;
	margin-left: auto;
	margin-right: auto;
	border-bottom: #eee solid 1px;	
}

#content {
	margin-top: 150px;
	margin-bottom: 180px;
}

#content p {
	font-size: 12px;
}

#insert-button{
	margin-top: 80px;
}

#pwdResultMsg{
	display: table-cell;
	vertical-align: middle;
	width : 700px;
	height: 300px;
	border: #eee solid 1px;
	background-color: #FAFAFA;
}
</style>

<div id="content-head">
	<h2>Searching Account Information</h2>
	<h1><strong>비밀번호 찾기</strong></h1>
</div>

<div id="content" align="center">
	<div id="pwdResultMsg">
		<p><strong>회원님의 이메일 주소로 비밀번호 확인 메일이 발송 되었습니다.</strong></p>
		<p>The email to check your password was sent to your registered email address</p>
		<br>
		<br>
		<p style="color:red; font-size: 11px;">※ 회원님의 정보 보호를 위해 이메일 확인 후 회원 정보(비밀번호)를 변경하시길 권장합니다.</p>
	</div>
	
	<div id="insert-button" align="center">
		<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/login'">로그인 / Login</button>
		<button type="button" id="regist_btn" class='btn btn-primary' onclick="location.href='/member/member_reg'">회원가입 / Register</button>		
	</div>
</div>

<%@include file="../footer.jsp"%>