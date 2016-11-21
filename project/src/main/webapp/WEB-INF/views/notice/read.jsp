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

  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
  
  <script>
  $(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html ", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : false,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
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






<!-- <body> -->

<div class="container">
  <h2>공지사항 상세</h2>
  
  <form role="form" action="modify" method="post">
  
  <input type='hidden' name='notice_seq'  value="${noticeDto.notice_seq}">
  <input type='hidden' name='searchType' value="${cri.searchType}">
  <input type='hidden' name='keyword'    value="${cri.keyword}">
  
  </form>

    <div style="float: left; width: 33%;" class="form-group">
      <label for="notice_seq">번호</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_seq" value="${noticeDto.notice_seq}" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="notice_regdate">등록일</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="notice_regdate" 
      value= "<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.notice_regdate}"/>" readonly = "readonly">
    </div>
    
    <div style="float: left; width: 33%;" class="form-group">
      <label for="member_id">작성자</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="member_id" value="${noticeDto.member_id}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="notice_count">조회수</label>
      <input  style="text-align: center; width: auto" type="text" class="form-control" name="notice_count" 
      value="${noticeDto.notice_count}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="notice_title">제목</label>
      <input style="text-align: center; width: 50%;" type="text" class="form-control" name="notice_title" value="${noticeDto.notice_title}" readonly="readonly">
    </div>
 
    <div class="form-group">
      <label for="notice_content">내용</label>
	      <pre style="width:auto">
	      ${noticeDto.notice_content}
	      </pre>     
     </div>
     
<c:if test="${admin == true}">
    <button type="submit" class="btn modifyBtn"> Modify </button>
    <button type="submit" class="btn removeBtn"> Remove </button>
</c:if> 

    <button type="submit" class="btn listallBtn">List all</button>
 
  
</div>

<jsp:include page="../footer.jsp"></jsp:include>
