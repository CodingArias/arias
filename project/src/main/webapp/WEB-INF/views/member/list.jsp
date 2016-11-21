<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


<!-- head -->
<div class="main">
<div class="container">
 <h2>ADMINISTER</h2>
 <h1><strong>회원목록</strong></h1>	
 
<select name="searchType">
						<option value="n"
							<c:out value="${page.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${page.searchType eq 't'?'selected':''}"/>>
							회원번호</option>
						<option value="c"
							<c:out value="${page.searchType eq 'c'?'selected':''}"/>>
							회원이름</option>
						<option value="w"
							<c:out value="${page.searchType eq 'w'?'selected':''}"/>>
							회원ID</option>
						<%-- <option value="tc"
							<c:out value="${page.searchType eq 'tc'?'selected':''}"/>>
							국적</option> --%>
</select> <input type="text" name='keyword' id="keywordInput"
						value='${page.keyword }'>
					<button id='searchBtn'>Search</button>
					
</div>	
					
<div class="member_list">
 	 <h1></h1>
  	 <h1></h1>			
  	
  <table class="table table-striped">
    <thead>
      <tr>
        <th width="10%" style= "text-align: center">회원번호</th>
        <th width="10%" style= "text-align: center">회원이름</th>
        <th width="10%" style= "text-align: center">회원id</th>
        <th width="10%" style= "text-align: center">국적</th>
 
    </thead>
    
<!-- body -->
    <tbody>
    
     <c:forEach items="${list}" var="mdto">

							<tr align="center">
								<td>${mdto.member_id}</td>
								<td><a href='/member/read?member_id=${mdto.member_id}&curPage=${page.curPage}&keyword=${page.keyword}&searchType=${page.searchType}'>${mdto.member_last_name}${mdto.member_first_name}</a>
								</td>
								<td>${mdto.member_email}</td>
								<td>${mdto.country_name_kor}</td>
							</tr>

     </c:forEach>
     
    </tbody>
  </table>
 </div>
 
 <nav aria-label="Page navigation" style=" text-align: center;">
  <ul class="pagination">
    <li>
    
      <c:if test="${page.prevPage!=0}">
	      <a href="/member/list?curPage=${page.prevPage}&keyword=${page.keyword}&searchType=${searchType}" aria-label="Previous">
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
	    		<li class="active"><a href="/member/list?curPage=${block}&keyword=${page.keyword}&searchType=${page.searchType}">${block}</a></li>
	    	</c:if>
	    	
	    	<c:if test="${page.curPage != block}">
	    		<li><a href="/member/list?curPage=${block}&keyword=${page.keyword}&searchType=${page.searchType}">${block}</a></li>
	    	</c:if>
	    	
	    </c:forEach>
     </c:if>
     	
    <li>
    	<c:if test="${page.nextPage!=0}">
      <a href="/member/list?curPage=${page.nextPage}&keyword=${page.keyword}&searchType=${page.searchType}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      </c:if>
    </li>
  </ul>
</nav>
</div>



<jsp:include page="../footer.jsp"></jsp:include>

