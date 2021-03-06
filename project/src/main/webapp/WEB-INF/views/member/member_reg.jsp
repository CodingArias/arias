<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page session="false" %>

<%@include file="../header.jsp"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="/resources/js/fileUpload.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/validation_memberReg.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formobj = $("form[role='form']");
	
	$(".btn-goHome").on("click", function(){
		self.location = "/";
	});
});

$(function() {
    imageChange($("#img"),$("#searchFile"));
        
    $('input[name="member_birthday"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
    	showDropdowns: true,
    	locale: {
            cancelLabel: 'Clear'
        }
    });
    
    $('input[name="member_birthday"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY-MM-DD'));
    });
    $('input[name="member_birthday"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
    
    
    $("#regist_btn").click(function(){
    	$("#member_phone").val($("#country_num").val() 
    						+ "-" + $("#member_phone1").val() 
    						+ "-" + $("#member_phone2").val()
    						+ "-" + $("#member_phone3").val());
    });
});


$('#modal-country').on('modal', function () {
	  $('#search-country').focus();
});

$('#modal-countryNum').on('shown.bs.modal', function() {
	$('#search-country-num').focus();
});


function country_select(country_name_eng,country_name_kor,country_id){
	$("#country_id").val(country_id);
	$("#member_country").val(country_name_eng+" ("+country_name_kor+")");
	$('#modal-country').modal('hide');
}

function countryNum_select(country_num) {
	$("#country_num").val("+"+country_num);
	$('#modal-countryNum').modal('hide');
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
	margin-bottom: 70px;	
}

.reg-form-tb{
	font-size: 13px;
}

.reg-form-tb tr {
	height: 60px;
}

.reg-form-tb td>label{
	width: 150px;
}

.reg-form-tb td>input {
	width: 510px;
}

#form-img{
	width : 400px;
}

#search {
	width: 108px;
}

.member-img {
	border: 1px solid #848484;
	background-color: #FAFAFA;
}

#form-img input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
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

#countryNum_insert_row:hover{
	background-color: #eee;
	cursor:default;
}
</style>

<!-- body -->
	<div id="content-head">
	<h2>Membership</h2>
	<h1><strong>회원가입</strong></h1>
	</div>
	<div id="reg-form" align="center">
		<form action="member_reg" method="post" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="country_id" id="country_id">
			<input type="hidden" name="member_id" id="member_id">
			<input type="hidden" name="member_phone" id="member_phone">
			
			<table class="reg-form-tb">
				<tr>
 					<td rowspan="7" id="form-img" align="center" class="fileDrop">
 						<div class="uploadImg">
 							<img src="/resources/img/noimage.jpg" class="img-rounded member-img" id="img" width="208" height="250">
 						</div>
 					</td>
					<td><label class="col-sm-2 control-label">Email</label></td>
					<td><input type="email" name="member_email" class="form-control" placeholder="aaa.kim@example.com" required="required"></td>
				</tr>
				
				<tr>
					<td><label class="col-sm-2 control-label">Password</label></td>
					<td><input type="password" name="member_pwd" id="member_pwd" class="form-control" placeholder="password" required="required"></td>
				</tr>
				<tr>
					<td><label class="col-sm-2 control-label">Password Check</label></td>
					<td><input type="password" id="member_pwd_check" class="form-control" placeholder="password check"></td>
				</tr>
				<tr>
					<td><label class="col-sm-2 control-label" id="pwd-check-msglabel"></label></td>
					<td>
						<button type="button" id="search" class='btn btn-info' onclick="passwordCheck()">Check</button>
						<span id="pwd-check-message"></span>
					</td>
				</tr>
				<tr>
					<td><label class="col-sm-2 control-label">Name</label></td>
					<td>
						<input type="text" name="member_first_name" class="form-control" placeholder="이름 / first name" style="float:left; width:242px;" required="required">
						<input type="text" name="member_last_name" class="form-control" placeholder="성 / last_name" style="float:right; width:242px;" required="required">
					</td>
				</tr>
				
				<tr>
					<td><label class="col-sm-2 control-label">Country</label></td>
					<td>
							
						 <button type="button" class="btn btn-primary" id="search" data-toggle="modal" data-target="#modal-country" style="float:left;">Search</button> 
						<!-- Large modal -->
						<input type="text" id="member_country" class="form-control" readonly="readonly" style="float:right; width:400px;">					
					</td>
				</tr>
				
				<tr>
					<td><label class="col-sm-2 control-label">Phone#</label></td>
					<td>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-countryNum"
							    id="search" style="float:left;">Search</button>
						<div style="float:right;">
							<input type="text" name="country_num" id="country_num" class="form-control" readonly="readonly" style="width:94px; float:left;" placeholder="country#" required="required">
							<span style="float:left;">_</span> 
							<input type="text" name="member_phone1" id="member_phone1" class="form-control" required="required" style="width:94px; float:left;" required="required"> 
							<span style="float:left;">_</span>
							<input type="text" name="member_phone2" id="member_phone2" class="form-control" required="required" style="width:94px; float:left;">
							<span style="float:left;">_</span>
							<input type="text" name="member_phone3" id="member_phone3" class="form-control" required="required" style="width:94px; float:right;">
						</div>							
					</td>
				</tr>
				
				<tr>
					<td id="form-img" align="center" >
						<label for="searchFile" class="btn btn-primary search-img" id="search">Search img</label>
						<input type="file" id="searchFile" name="member_img" required="required">
					</td>
					<td><label class="col-sm-2 control-label">Birthday</label></td>
					<td>
						<input type="text" name="member_birthday" class="form-control" required="required">
					</td>
				</tr>				
			</table>
			<br>
			<br>
			<div class="insert-button" align="center">
				<button type="button" class='btn btn-primary btn-goHome'>Go Home</button>
				<input type="submit" id="regist_btn" class='btn btn-info' onclick="regInputCheck()" value="Register">
				<button type="reset" class='btn btn-default'>Reset</button>			
			</div>
		</form>
	</div>
	
	<!-- MODAL FORM FOR SEARCHING COUNTRY -->
	<div class="modal fade bs-example-modal-lg" role="dialog" id="modal-country">
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
	
	
	<!-- MODAL FORM FOR SEARCHING COUNTRY_NUMBER -->
	<div class="modal fade bs-example-modal-lg" role="dialog" id="modal-countryNum">
		<div class="modal-dialog" id="modal-countryNum_div">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">국가 번호 검색 / Search Country Number</h4>
				</div>
			
				<div class="modal-body">
					<div>
						<select id="countryNum_search" style="height: 25px;">
							<option value="" selected="selected">== 검색조건 ==</option>
							<option value="country_name_eng">English(영어)</option>
							<option value="country_name_kor">Korean(한국어)</option>
							<option value="country_num">Country#(국가번호)</option>
						</select>
						<input type="text" name="country_num" id="search-countryNum" placeholder="Search Country" style="height: 25px;">
						<button type="submit" class="btn btn-info modal-search-countryNum" style="height:25px; padding-bottom: 0px; padding-top: 0px;">Search</button>
					</div>
					<br>
					<table id="modal-countryNumTb">
						<thead>
							<tr>
								<td>Country_code</td>
								<td>Country_name(Eng)</td>
								<td>Country_name(한국어)</td>
								<td>Country_Number</td>
							</tr>	
						</thead>
						<c:forEach items="${listCountry }" var="country">
						<tbody class="country_tbody">
							<tr id="countryNum_insert_row" onclick="countryNum_select('${country.country_num }')" >
								<td>${country.country_id }</td>
								<td>${country.country_name_eng }</td>
								<td>${country.country_name_kor }</td>
								<td>${country.country_num }</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
				</div>
			
				<div class="modal-footer">
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	
<%@include file="../footer.jsp"%>