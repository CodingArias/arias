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

<div class="container">
  <h2>공지사항 수정</h2>
  
  <form role="form" method="post" action="modify">
    
    <div class="form-group">
      <label for="notice_seq">공지번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_seq" value="${noticeDto.notice_seq}" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="notice_title">공지제목</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_title" value="${noticeDto.notice_title}">
    </div>
    
     <div class="form-group">
      <label for="notice_content">공지내용</label>
      <textarea rows="10" cols="30" class="form-control" name="notice_content">
      ${noticeDto.notice_content}
      </textarea>     
     </div>
     
     
    <div class="form-group">
      <label for="member_id">글쓴이</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${noticeDto.member_id}" readonly="readonly">
    </div>
 
  <%--   <div class="form-group">
      <label for="notice_regdate">등록일</label>
      <input type="text" class="form-control" name="notice_regdate" 
      value= "<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.notice_regdate}"/>" readonly = "readonly">
    </div> --%>
    
    <div class="form-group">
      <label for="notice_count">조회수</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_count" 
      value="${noticeDto.notice_count}" readonly="readonly">
    </div>
    <button type="submit" class="btn modifyBtn">SAVE</button>
    <button type="submit" class="btn listallBtn">CANCEL</button>
 
 </form>
  
</div>
</body>
</html>