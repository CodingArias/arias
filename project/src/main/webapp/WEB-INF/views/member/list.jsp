<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<jsp:include page="../header.jsp"></jsp:include>
<style>
.main {
	height: auto;
}

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
 <h1><strong>회원목록</strong></h1>	
<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							회원번호</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							회원이름</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							회원ID</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							국적</option>
</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New register</button>
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
    

    <tbody>
    
     <c:forEach items="${list}" var="mdto">

							<tr align="center">
								<td>${mdto.member_id}</td>
								<td><a href='/member/read?member_id=${mdto.member_id}'>${mdto.member_last_name}</a></td>
								<td>${mdto.member_email}</td>
								<td>${mdto.country_id}</td>
							</tr>

     </c:forEach>
     
    </tbody>
  </table>
 </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>

