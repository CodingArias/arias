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
	$("title").text("예약 현황");
	$(function() {
	});
	
	function click_tr(product_seq,member_id,reservation_seq){
		console.log(product_seq+" "+member_id);
		$("#member_id").val(member_id);
		$("#product_seq").val(product_seq);
		$("#reservation_seq").val(reservation_seq);
		
		$("#frm").submit();
	}
</script>

<div class="main">
	<div class="container">
		<div class="title_div"></div>
		<div class="reservation_div">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<strong>예약 현황</strong>
				</div>
				<form action="reservation_detail" method="get" id="frm">
					<input type="hidden" id="member_id" name="member_id">
					<input type="hidden" id="product_seq" name="product_seq">
					<input type="hidden" id="reservation_seq" name="reservation_seq">
					
					
				<table class="table table-hover">
					<thead>
						<tr>
							<td>No.</td>
							<td>이름</td>
							<td>Check-in Date</td>
							<td>Check-out Date</td>
							<td>숙박 인원</td>
							<td>등록일</td>
							<td>예약 상태</td>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="reserv" items="${reserv_list}" varStatus="status">
							<tr onclick="click_tr(${reserv.product_seq},'${reserv.member_id}','${reserv.reservation_seq}')">
								<td style="line-height: 40px;">${status.count}</td>
								<td>
								<img class="img-circle image" src="/resources/member/member_img/${reserv.member_img }">
									<span>${reserv.member_name}</span></td>
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
		<div class="row">
			<!-- product 설명 구간-->
			<div class="col-sm-12 text-left">
			
			
				<div class="col-sm-12 text-center">
					<h2>${product.product_name }</h2>
					<h6>${product.product_addr }</h6>
					<h6>${product.product_addr_detail }</h6>
				</div>

			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 상세 설명 -->
			<div class="col-sm-12 text-left">
				<h5>
					<strong>상세 설명</strong>
				</h5>
				<span>${product.product_info}</span>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 숙소 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6 text-left">숙박 가능 인원 :
						${product.number_of_people }</div>
					<div class="col-sm-6 text-left">침대 종류 : ${product.bed_name }</div>
					<div class="col-sm-6 text-left">숙소 유형 : ${product.accom_name }</div>
					<div class="col-sm-6 text-left">건물 유형 :
						${product.building_name }</div>
					<div class="col-sm-6 text-left">추천 손님 : ${product.sguest_name }</div>
				</div>

			</div>

			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 예약 정보 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>예약 정보</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6 text-left">최소 숙박 가능 일수 :
						${product.product_mindt }</div>
					<div class="col-sm-6 text-left">준비 기간 :
						${product.product_readydt }</div>
					<div class="col-sm-6 text-left">최대 숙박 가능 일수 :
						${product.product_maxdt }</div>
					<div class="col-sm-6 text-left">Check-In Time :
						${product.checkin_time } 이후</div>
					<div class="col-sm-6 text-left">최소 몇 일 전 예약 :
						${product.product_prepdt }</div>
					<div class="col-sm-6 text-left">Check-Out Time :
						${product.checkout_time }</div>
				</div>

			</div>
			<div class="col-sm-12">
				<hr>
			</div>


			<!-- 사용 가능 공간 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>사용 가능 공간</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="space" items="${product_space }">
						<div class="col-sm-6 text-left">${space.space_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 제공 서비스 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>제공 서비스 </strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="convin" items="${product_convin}">
						<div class="col-sm-6 text-left">${convin.convin_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 안전 기능 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>안전 기능</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="safety" items="${product_safety}">
						<div class="col-sm-6 text-left">${safety.safety_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>


			<!-- 숙소 이용규칙 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소 이용규칙</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="regulation" items="${product_regulation}">
						<div class="col-sm-6 text-left">${regulation.regulation_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 숙소 이용규칙 끝-->

			<!-- 가격-->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>가격</strong>
				</div>
				<div class="col-sm-5 text-left">일 단위 요금 :
					$${product.product_price }</div>
			</div>
		</div>		
		<div class="button_div"></div>

	</div>
</div>

<%@include file="../footer.jsp"%>