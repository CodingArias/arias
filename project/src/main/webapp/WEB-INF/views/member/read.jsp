<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 <jsp:include page="../header.jsp"></jsp:include>
  
  <script> 
  
  $(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){
		formObj.attr("action", "/member/modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
 	$(".removeBtn").on("click", function(){
		formObj.attr("action", "/member/remove");
		formObj.submit();
	});
 	
 	$(".listallBtn").on("click", function(){
 		formObj.attr("action", "/member/list");
		formObj.attr("method", "get");		
		formObj.submit();
	});
 	
  });
	</script>


<!-- <body>-->

<div align="center" class="container">
  <h2>회원상세정보</h2>
  
  <form role="form" action="modify" method="post">
  
  <input type='hidden' name='member_id'  value="${memberDto.member_id}">
  <input type='hidden' name='searchType' value="${cri.searchType}">
  <input type='hidden' name='keyword'    value="${cri.keyword}">
  
  </form>
  
    <div class="form-group">
      <label for="member_id">회원번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${memberDto.member_id}" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="member_email">회원아이디</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_email" value="${memberDto.member_email}" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="member_first_name">회원이름</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_first_name" value="${memberDto.member_first_name}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="country_id">국적</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_country" value="${memberDto.country_name_kor}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="member_phone">전화번호</label> 
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_phone" value="${memberDto.member_phone}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="member_birthday">생년월일</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_birthday" 
      value="${memberDto.member_birthday}" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="member_reg_date">등록일</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_reg_date" 
      value="${memberDto.member_reg_date}" pattern="YYYY-MM-dd" readonly = "readonly">
    </div>
    
  <c:if test="${admin == true}">					
    <button type="submit" class="btn modifyBtn"> Modify </button>
    <button type="submit" class="btn removeBtn"> Remove </button>
    <button type="submit" class="btn listallBtn">List all</button>
  </c:if>
  
</div>

<jsp:include page="../footer.jsp"></jsp:include>
