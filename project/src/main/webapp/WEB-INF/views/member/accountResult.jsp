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

#insert-button{
	margin-top: 80px;
}
</style>

<div id="content-head">
	<h2>Searching Account Information</h2>
	<h1><strong>아이디/비밀번호 찾기</strong></h1>
</div>

<div id="content" align="center">
	
	<c:if test="${result == null }">
		<p>검색 조건에 일치하는 email 주소가 없습니다.</p>	
	</c:if>
	<c:if test="${result != null }">
		<p>검색 조건에 일치하는 회원님의 e-mail 주소는 아래와 같습니다.</p>
		<p>An e-mail address that your are looking for is</p>
		<br>
		<br>
			<c:forEach var="email" items="${result}">
				<li><strong>${email}</strong></li> 
			</c:forEach>
		<br>
		
		<div id="insert-button" align="center">
			<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/login'">Login</button>
			<button type="button" id="regist_btn" class='btn btn-primary'>Password Searching</button>		
		</div>
	</c:if>
</div>

<%@include file="../footer.jsp"%>