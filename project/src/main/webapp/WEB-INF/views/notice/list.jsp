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
							<c:out value="${page.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${page.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${page.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${page.searchType eq 'w'?'selected':''}"/>>
							회원ID</option>
</select> <input type="text" name='keyword' id="keywordInput"
						value='${page.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>
</div>


<div class="notice_list">
  <h1></h1>
  <h1></h1>			
  	
 <table class="table table-striped">
  
    <thead>
      <tr>
        <th  style= "text-align: center">BNO</th>
        <th  style= "text-align: center">TITLE</th>
        <th  style= "text-align: center">WIRTER</th>
        <th  style= "text-align: center">REGDATE</th>
        <th  style= "text-align: center">COUNT</th>
      </tr>
    </thead>
    

    <tbody>
    
     <c:forEach items="${list}" var="ndto">

							<tr align="center">
								<td>${ndto.notice_seq}</td>
								<td><a href='/notice/read?notice_seq=${ndto.notice_seq}&curPage=${page.curPage}&keyword=${page.keyword}&searchType=${page.searchType}'>${ndto.notice_title}</a></td>
								<td>${ndto.member_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" 
								value="${ndto.notice_regdate}"/></td>
								<td><span>${ndto.notice_count}</span></td>
							</tr>

     </c:forEach>
     
    </tbody>
  </table>
 </div>
 
 <nav aria-label="Page navigation" style=" text-align: center;">
  <ul class="pagination">
    <li>
    
      <c:if test="${page.prevPage!=0}">
	      <a href="/notice/list?curPage=${page.prevPage}&keyword=${page.keyword}&searchType=${searchType}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
      </c:if>
    </li>
    
    
    <c:if test="${page.lastBlock == 1}">
    	<li><a href="#">1</a></li>
    </c:if>	
    
    <c:if test="${page.lastBlock != 1}">
	    <c:forEach var="block" begin="${page.firstBlock}" end="${page.lastBlock}">
	    	<c:if test="${page.curPage == block}">
	    		<li class="active"><a href="/notice/list?curPage=${block}&keyword=${page.keyword}&searchType=${page.searchType}">${block}</a></li>
	    	</c:if>
	    	
	    	<c:if test="${page.curPage != block}">
	    		<li><a href="/notice/list?curPage=${block}&keyword=${page.keyword}&searchType=${page.searchType}">${block}</a></li>
	    	</c:if>
	    	
	    </c:forEach>
     </c:if>
     	
    <li>
    	<c:if test="${page.nextPage!=0}">
      <a href="/notice/list?curPage=${page.nextPage}&keyword=${page.keyword}&searchType=${page.searchType}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      </c:if>
    </li>
  </ul>
</nav>
</div>


<jsp:include page="../footer.jsp"></jsp:include>

