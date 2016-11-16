<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  


  <script> 
  
  $(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){	
		formObj.submit();
	});
	
 	
 	$(".listallBtn").on("click", function(){
		self.location = "/member/list";
	});
 	
  });
  </script>




</head>


<body>

<div align="center" class="container">
  <h2>회원정보수정</h2>
  
  <form role="form" method="post" action="modify">
    
    <div class="form-group">
      <label for="member_id">회원번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${memberDto.member_id}" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="member_email">회원아이디</label>
      <input style="text-align: center; width: auto"  type="text" class="form-control" name="member_email" value="${memberDto.member_email}" readonly="readonly">
      
    </div>
    
    <div class="form-group">
      <label for="member_first_name">회원'성'</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_first_name" value="${memberDto.member_first_name}">
    </div>
    
     <div class="form-group">
      <label for="member_last_name">회원'이름'</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_last_name" value="${memberDto.member_last_name}">
    </div>
    
    <div class="form-group">
      <label for="country_id">국적</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="country_id" value="${memberDto.country_id}">
    </div>
    
    <div class="form-group">
      <label for="member_phone">전화번호</label> 
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_phone" value="${memberDto.member_phone}">
    </div>
    
    
    <%-- <div class="form-group">
      <label for="member_birthday">생년월일</label>
      <input id="demo" type="text" class="form-control" name="member_birthday" 
      value="${memberDto.member_birthday}">
    </div>
     --%>
    
   <%--  <div class="form-group">
      <label for="member_reg_date">등록일</label>
       <input type="text" class="form-control" name="member_reg_date" 
      value="${meberDto.member_reg_date}" pattern="yyyy-MM-dd" readonly="readonly">
      
    </div> --%>
     
   
 <%--     <div class="form-group">
      <label for="member_reg_date">등록일</label>
      <input type="text" class="form-control" name="member_reg_date" 
      value="<fmt:formatDate value="${memberDto.member_reg_date}" pattern="yyyy-MM-dd hh:mm"/>" 
      readonly="readonly">
    </div>  --%>
    

    <button type="submit" class="btn modifyBtn">SAVE</button>
    <button type="submit" class="btn listallBtn">CANCEL</button>
 
 </form>
  
</div>
</body>
</html>