<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<jsp:include page="../header.jsp"></jsp:include>
<style>
/* .main {
	height: auto;
}
 */
</style>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
	
	var result = '${msg1}';

	if (result == 'CANCEL') {
		alert("리스트로 돌아갑니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ "?searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>




<div class="main">
<div class="container">
 <h2>ADMINISTER</h2>
 <h1><strong>공지사항</strong></h1>	
<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							회원ID</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							국적</option>
</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>
</div>


<div class="notice_list">
  <h1></h1>
  <h1></h1>			
  	
 <table class="table table-striped">
  
    <thead>
      <tr>
        <th>공지번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>
    

    <tbody>
    
     <c:forEach items="${list}" var="ndto">

							<tr>
								<td>${ndto.notice_seq}</td>
								<td><a href='/notice/read?notice_seq=${ndto.notice_seq}'>${ndto.notice_title}</a></td>
								<td>${ndto.member_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" 
								value="${ndto.notice_regdate}"/></td>
								<td><span>${ndto.notice_count}</span></td>
							</tr>

     </c:forEach>
     
    </tbody>
  </table>
 </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>

