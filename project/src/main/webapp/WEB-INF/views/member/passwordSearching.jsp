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

#reg-form{
	margin-top: 70px;
	margin-left: auto;
	margin-right: auto;	
	margin-bottom: 250px;	
}

.insert-button{
	margin-top: 50px;
}

.reg-form-tb{
	font-size: 13px;
}

.reg-form-tb tr {
	height: 60px;
}

.reg-form-tb td>label{
	width: 180px;
}

.reg-form-tb td>input {
	width: 400px;
}

</style>

<div id="content-head">
	<h2>Searching Account Information</h2>
	<h1><strong>비밀번호 찾기</strong></h1>
</div>

<div id="reg-form" align="center">
	<form action="checkpwd" method="post" name='frm'>
	<input type="hidden" id="country_id" name="country_id">
		<table class="reg-form-tb">
			<tr>
				<td><label class="col-sm-2 control-label">이름 / Name</label></td>
				<td>
					<input type="text" name="member_first_name" id="member_first_name" class="form-control" placeholder="이름 / first name" style="float:left; width:49%;" required="required">
					<input type="text" name="member_last_name"	id="member_last_name" class="form-control" placeholder="성 / last name" style="float:right; width:49%;" required="required">
				</td>
			</tr>
			<tr>
				<td><label class="col-sm-2 control-label">이메일 / email</label></td>
				<td>
					<input type="email" placeholder="이메일 / email" id="member_email" name="member_email" class="form-control" required="required">					
				</td>
			</tr>
		</table>
	
	<br>
	<br>

	<div class="insert-button" align="center">
		<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/login'">로그인 / login</button>
		<input type="submit" id="regist_btn" class='btn btn-primary' value="찾기 / Searching">
		<button type="reset" class='btn btn-default' onclick="location.href='/member/member_reg'">회원가입 /Register</button>	
	</div>
	
	</form>
</div>








<%@include file="../footer.jsp"%>