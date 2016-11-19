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
	margin-bottom: 100px;
}

#insert-button{
	margin-top: 70px;
}

#passwordMiddle{
	display: table-cell;
	vertical-align : middle;
	width : 700px;
	height : 300px;
	border: #eee solid 1px;
	background-color: #FAFAFA;
}

#result{
	margin-top: 70px;
	font-size: 12px;
	color: #DF0101;
}
</style>

<div id="content-head">
	<h2>Searching Account Information</h2>
	<h1><strong>비밀번호 찾기</strong></h1>
</div>

<div id="content" align="center">
	
	<c:if test="${password == null }">
		<div id="passwordMiddle">
			<p><strong>검색 조건에 일치하는 계정 정보가 없습니다.</strong></p>
			<p>An account information that matched with search condition is not exist.</p>	
		</div>
	</c:if>
	
	<c:if test="${password != null }">
		<form action="checkpwd" name="frm" method="post">
		<input type="hidden" name="member_email" value=${memberdto.member_email }>
		<input type="hidden" name="member_first_name" value=${memberdto.member_first_name }>
		<input type="hidden" name="member_last_name" value=${memberdto.member_last_name }>
		<input type="hidden" name="member_pwd"	value=${memberdto.member_pwd }>
			<div id="passwordMiddle">
				<div id="resultText">
					<p><strong>회원 정보가 일치합니다.</strong></p>
					<p>An account information is matched with the search condition.</p>
					
					<div id="result" class="button-info">
						<p><strong>※ [ Send email ] 버튼을 클릭하시면 회원님의 email 주소로 등록된 비밀번호를 전송해드립니다.</strong></p>
						<p>※ As you click on [ Send email ] button, we will send your password to your email address.</p>
					</div>
				</div>
			</div>
			
			<div id="insert-button" align="center">
				<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/login'">Login</button>
				<button type="submit" id="regist_btn" class='btn btn-primary'>Send email*</button>		
			</div>
		</form>
	</c:if>
</div>

<%@include file="../footer.jsp"%>