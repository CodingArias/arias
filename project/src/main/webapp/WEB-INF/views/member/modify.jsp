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
		formObj.submit();
	});
	
 	
 	$(".listallBtn").on("click", function(){
		self.location = "/member/list";
	});
 	
  });
  </script>
  
<!-- body -->

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
    <select style="width:auto; text-align:center;" id="country_id" name="country_id" class="form-control">
						<c:forEach var="country" items="${country_list}" varStatus="status">
							<c:if test="${status.first}">
								<option value="${country.country_id}" selected="selected">
									${country.country_name_kor }
								</option>
							</c:if>
							<option value="${country.country_id}" selected="selected">
								${country.country_name_kor }
							</option>
						</c:forEach>
	</select> 
	</div>
    		
    <div class="form-group">
      <label for="member_phone">전화번호</label> 
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_phone" value="${memberDto.member_phone}">
    </div>
    
    <button type="submit" class="btn modifyBtn">SAVE</button>
    <button type="submit" class="btn listallBtn">CANCEL</button>
 
 </form>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
