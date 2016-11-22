<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
  
  <script type="text/javascript" src="/resources/datepicker/moment.js"></script>
  <link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
  <script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script>
  
 
  <script>
  $(function(){
	  $('#demo').daterangepicker({
		  "singleDatePicker": true,
		  "showDropdowns": true
	})
  });
/*   $(function(){
	  $('#demo').daterangepicker({
	    "singleDatePicker": true,
	    "startDate": "11/04/2016",
	    "endDate": "11/10/2016"
	}, function(start, end, label) {
	  console.log("New date range selected: ' + start.format('YY-MM-DD') + ' to ' + end.format('YY-MM-DD') + ' (predefined range: ' + label + ')");
	});
  }); */
  </script>
  
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="/resource/smarteditor/sample/photo_uploader/photo_uploader.html"></script>
  <script type="text/javascript" src="/resource/smarteditor/sample/photo_uploader/attach_photo.js"></script>
 
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
	
	<!--제목 null체크 -->
	<script>
	
	function titlecheck(){
	
		if($("#notice_title").val().length < 1){
			alert("제목을 입력해주세요");
			notice_title.focus();	
			return false;
		}
	}
	</script>

<!-- <body> -->

<div class="container">
 <h2>ADMINISTER</h2>
 <h1><strong>공지사항 등록</strong></h1>	
  
  <form id='register' role="form" method="post">
  
    <div class="form-group">
      <label for="member_id">작성자</label>
      <input style="text-align: center; width: auto" value="ADMIN" type="text" class="form-control" name="member_id" placeholder="회원아이디" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="notice_title">제목</label>
      <input style="text-align: center; width: 30%" type="text" class="form-control" id="notice_title" name="notice_title" placeholder="제목을 입력해주세요." required="required">
    </div>
    
     <div class="form-group">
      <label for="notice_content">내용</label>
      <textarea  style="width:600px" id="smarteditor" class="form-control" name="notice_content" >
      </textarea>
    </div>
    
    <!-- <div class="form-group">
       <input type="file" name="notice_img">
					<input type="file" name="member_img" id="member_img"  required="required"/>
					<img class="img-rounded" id="image" alt="product_image" src="/resources/img/noimage.jpg">
	</div>
     -->
    
  <!--    <div class="form-group">
      <label for="member_reg_date">등록일</label>
      <input type="text" class="form-control" name="member_reg_date" placeholder="2000-01-01">
    </div>
    
 -->
    <!-- <input type="button" id="savebutton" value="submit"> -->
     <button type="submit" id="savebutton" class="btn btn-default" onclick="titlecheck()">Submit</button>
     <button type="button" id="listallBtn" class="btn btn-default" onclick="location.href='/notice/list'">List all</button>
   </form>
  
</div>

<jsp:include page="../footer.jsp"></jsp:include>
