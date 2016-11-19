<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style type="text/css">
.main {
	height: auto;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 1200px;
	height: 100%;
	background: white;
}

.title_div {
	height:100px;
}

.reservation_div {
	height: 80%;
	margin-bottom: 100px;
}

.button_div {
	height: 10%;
}

.image {
	margin-top: 1px;
	margin-right: 10px;
	width: 40px;
	height: 40px;
}

table {
	text-align: center;
	line-height: 30px;
}

tbody tr {
	
}

thead tr {
	font-weight: bold;
}
.row{
	margin: 0px auto;
	width: 70%;
	height: 100%;
}
</style>
<script type="text/javascript">
	$("title").text("나의 예약 페이지");
	$(function() {
	});
	
	function click_tr(product_seq){


	}
</script>

<div class="main">
	<div class="container">
		<div class="title_div"></div>
		<div class="reservation_div">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<strong>나의 예약 페이지</strong>
				</div>
				<form action="#" method="get" id="frm">
					<input type="hidden" id="member_id" name="member_id">
					<input type="hidden" id="product_seq" name="product_seq">
					<input type="hidden" id="reservation_seq" name="reservation_seq">
					
					
				<table class="table table-hover">
					<thead>
						<tr>
							<td>No.</td>
							<td>숙소 제목 / 주소</td>
							<td>Check-in Date</td>
							<td>Check-out Date</td>
							<td>숙박 인원</td>
							<td>등록일</td>
							<td>예약 상태</td>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="reserv" items="${reserv_list}" varStatus="status">
							<tr onclick="click_tr(${reserv.product_seq})">
								<td style="line-height: 40px;">${status.count}</td>
								<td>
								
									<span style="font-weight: bold;">${reserv.product_name}</span><br> 
									<span style="color: gray;">${reserv.product_addr}</span><br>
									</td>
								<td style="line-height: 40px;">${reserv.checkin_dt}</td>
								<td style="line-height: 40px;">${reserv.checkout_dt }</td>
								<td style="line-height: 40px;"><span class="badge">${reserv.reserv_count }</span></td>
								<td style="line-height: 40px;">${reserv.reg_dt }</td>
								<td style="line-height: 40px;">
								    <c:if test="${reserv.reserv_status==1}">
										<span>예약 대기중</span>
									</c:if> 
									<c:if test="${reserv.reserv_status==2}">
										<span>예약 완료</span>
									</c:if>
									<c:if test="${reserv.reserv_status==3}">
										<span>숙박 이용 완료</span>
									</c:if>
									</td>
									

							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
			</div>
		</div>
		
					
			<div class="col-sm-12">
				<hr>
			</div>		
		<div class="button_div"></div>

	</div>
</div>

<%@include file="../footer.jsp"%>