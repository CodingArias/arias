<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page session="false" %>

<%@include file="../header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
function loginCheck() {
	if(document.frm.member_email.value.length == 0 || document.frm.member_email.value == ""){
		alert(" 등록된 이메일 주소를 입력해주세요.\n please insert your email address.");
		frm.member_email.focus();	
		return false;
	}
	
	if(document.frm.member_pwd.value.length == 0 || document.frm.member_pwd.value == "") {
		alert(" 비밀번호를 입력해주세요. \n please insert your password.");
		frm.member_pwd.focus();
		return false;
	}
	return true;
}
</script>

<style type="text/css">
#content-head {
	margin-top: 50px;
	width : 1060px;
	margin-left: auto;
	margin-right: auto;
	border-bottom: #eee solid 1px;	
}

</style>

<!-- body -->
	<div id="content-head">
	<h2>Log in</h2>
	<h1><strong>로그인</strong></h1>
	</div>	
	
	<div style="margin-bottom: 300px;">
	<form class="form-horizontal" action="/member/loginPost" method="post" name="frm">
		<div style="margin-top:200px; margin-left: 30%;">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail3" name="member_email" autofocus="autofocus" 
						   placeholder="abc.kim@example.com" style="width:400px;">
				</div>
			
			</div>
			
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3" name="member_pwd" placeholder="Password" style="width:400px;">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="useCookie"> Remember me
						</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-primary">ID/PW 분실했어요</button>
					<input type="submit" class="btn btn-info" id="loninbtn" onclick="return loginCheck()" value="Login">
					<button type="button" class="btn btn-default btn-reg" onclick="location.href='/member/member_reg'">회원가입</button>
				</div>
			</div>
		</div>
	</form>
	</div>
	
<%@include file="../footer.jsp"%>