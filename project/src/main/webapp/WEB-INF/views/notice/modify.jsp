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

 <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
  
  <script>
  $(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
   		 })
	})
	</script>

</head>


<body>

<div class="container">
  <h2>공지사항 수정</h2>
  
  <form role="form" method="post" action="modify">
    
    <div style="float: left; width: 33%;" class="form-group">
      <label for="notice_seq">공지번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_seq" value="${noticeDto.notice_seq}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="member_id">글쓴이</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${noticeDto.member_id}" readonly="readonly">
    </div>
 
  
    <div style="float: left; width: 33%;" class="form-group">
      <label for="notice_title">공지제목</label>
      <input style="text-align: center; width: 80%" type="text" class="form-control" name="notice_title" value="${noticeDto.notice_title}">
    </div>
   
   
    <div class="form-group">
      <label for="notice_count">조회수</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_count" 
      value="${noticeDto.notice_count}" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="notice_content">공지내용</label>
      <textarea id="smarteditor" rows="10" cols="30" class="form-control" name="notice_content">
      ${noticeDto.notice_content}
      </textarea>     
     </div>
     
    
    <button type="submit" id="savebutton" class="btn modifyBtn">SAVE</button>
    <button type="submit" class="btn listallBtn">CANCEL</button>
 
 </form>
  
</div>
</body>
</html>