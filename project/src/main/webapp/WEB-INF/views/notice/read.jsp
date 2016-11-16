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
		formObj.attr("action", "/notice/modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
 	$(".removeBtn").on("click", function(){
		formObj.attr("action", "/notice/remove");
		formObj.submit();
	});
 	
 	$(".listallBtn").on("click", function(){

 		formObj.attr("action", "/notice/list?notice_seq=12&${searchType}=&${keyword}=?${notice_seq}&${searchType}=&${keyword}");

 

 		location.href="/notice/list?curPage=${page.curPage}&keyword=${page.keyword}&searchType=${page.searchType}";
 /* 		formObj.attr("action", "/notice/list?curPage='${page.curPage}'&keyword='${page.keyword}'&searchType='${page.searchType}'");
>>>>>>> a899ca656ab5f46f4cb1ffb15e3ef91da4636fc7
		formObj.attr("method", "get");		
		formObj.submit();
 */	});
 	
  });
	</script>



</head>


<body>

<div class="container">
  <h2>공지사항 상세</h2>
  
  <form role="form" action="modify" method="post">
  
  <input type='hidden' name='notice_seq'  value="${noticeDto.notice_seq}">
  <input type='hidden' name='searchType' value="${cri.searchType}">
  <input type='hidden' name='keyword'    value="${cri.keyword}">
  
  </form>
  
    <div class="form-group">
      <label for="notice_seq">공지번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_seq" value="${noticeDto.notice_seq}" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="notice_title">공지제목</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_title" value="${noticeDto.notice_title}" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="notice_content">공지내용</label>
      <textarea  rows="10" cols="30" class="form-control" name="notice_content" readonly="readonly">
      ${noticeDto.notice_content}
      </textarea>     
     </div>
     
     
    <div class="form-group">
      <label for="member_id">글쓴이</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${noticeDto.member_id}" readonly="readonly">
    </div>
 
    <div class="form-group">
      <label for="notice_regdate">등록일</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="notice_regdate" 
      value= "<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.notice_regdate}"/>" readonly = "readonly">
    </div>
    
    <div class="form-group">
      <label for="notice_count">조회수</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="notice_count" 
      value="${noticeDto.notice_count}" readonly="readonly">
    </div>
    

    <button type="submit" class="btn modifyBtn"> Modify </button>
    <button type="submit" class="btn removeBtn"> Remove </button>
    <button type="submit" class="btn listallBtn">List all</button>
 
  
</div>

</body>
</html>