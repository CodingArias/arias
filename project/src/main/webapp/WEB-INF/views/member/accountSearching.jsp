<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page session="false" %>

<%@include file="../header.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
$('#modalCountry').on('shown.bs.modal', function () {
	  $('#search-country').focus();
});

function country_select(country_name_eng,country_name_kor,country_id){
	alert("country_id : " + country_id);
	$("#country_id").val(country_id);
	$("#member_country").val(country_name_eng+" ("+country_name_kor+")");
	$('#modal-country').modal('hide');
}

</script>
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
	width: 510px;
}

#search {
	width: 20%;
}

#modal-countryTb{
	border-collapse : collapse;
	border: #585858 solid 1px;
	border-right: none;
	border-left: none;
	margin-left: auto;
	margin-right: auto;
	font-size: 12px;
}

#modal-countryNumTb tbody tr td{
	height : 30px;
	font-size: 12px;
}

#modal-countryTb tbody tr td{
	height : 30px;
}

#modal-countryTb thead tr td{
	width: 200px;
	height: 30px;	
	text-align: center;
	background-color: #424242;
	color: white;
}

#modal-countryNumTb thead tr td{
	width: 300px;
	height: 30px;	
	text-align: center;
	background-color: #424242;
	color: white;
	font-size: 12px;
}

#modal-country_div, #modal-countryNum_div{
	overflow-y: initial !important
}

#modal-country_div .modal-body, #modal-countryNum_div .modal-body{
	height : 800px;
	overflow-y: auto;
}


#country_insert_row:hover{
	background-color: #eee;
	cursor:default;
}
</style>

<div id="content-head">
	<h2>Searching Account Information</h2>
	<h1><strong>아이디/비밀번호 찾기</strong></h1>
</div>

<div id="reg-form" align="center">
	<form action="accountSearching" method="post" name='frm'>
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
				<td><label class="col-sm-2 control-label">국적 / Country</label></td>
				<td>
					<button type="button" class="btn btn-primary" id="search" data-toggle="modal" data-target="#modalCountry">Search</button>
					<input type="text" id="member_country" class="form-control" readonly="readonly" style="float:right; width:78%;">					
				</td>
			</tr>
		</table>
	
	<br>
	<br>

	<div class="insert-button" align="center">
		<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/login'">로그인 / login</button>
		<button type="button" class='btn btn-info btn-goHome' onclick="location.href='/member/passwordSearching'">PW 찾기 / Searching PW</button>
		<input type="submit" id="regist_btn" class='btn btn-primary' value="찾기 / Searching">
		<button type="reset" class='btn btn-default' onclick="location.href='/member/member_reg'">회원가입 /Register</button>	
	</div>
	
	</form>
</div>



<%@include file="../footer.jsp"%>



	<!-- MODAL FORM FOR SEARCHING COUNTRY -->
	<div class="modal fade bs-example-modal-lg" role="dialog" id="modalCountry">
		<div class="modal-dialog" id="modal-country_div">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">국가 검색 / Search Country</h4>
				</div>
				
				<div class="modal-body">
					<div id="search-keyword">
						<select id="country_search" style="height: 25px;">
							<option value="" selected="selected">== 검색조건 ==</option>
							<option value="country_name_eng">English(영어)</option>
							<option value="country_name_kor">Korean(한국어)</option>
						</select>
						<input type="text" name="country_name" id="search-country" placeholder="Searching Country name" style="height: 25px;">
						<button type="submit" class="btn btn-info modal-search-country" id="searchCountryBtn" style="height:25px; padding-bottom: 0px; padding-top: 0px;">Search</button>
					</div>
					<br>
					<div class="countryList">
						<table id="modal-countryTb">
							<thead class="country_thead">
								<tr>
									<td>country_id</td>
									<td>country_name_eng</td>
									<td>country_name_kor</td>
								</tr>
							</thead>
							<c:forEach items="${listCountry }" var="country">
							<tbody class="country_tbody">
								<tr id="country_insert_row" onclick="country_select('${country.country_name_eng }','${country.country_name_kor }','${country.country_id }')" >
									<td>${country.country_id }</td>
									<td>${country.country_name_eng }</td>
									<td>${country.country_name_kor }</td>
								</tr>
							</tbody>
 							</c:forEach>
						</table>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	

	
	