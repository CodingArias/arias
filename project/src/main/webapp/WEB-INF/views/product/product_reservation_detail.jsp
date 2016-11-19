<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style type="text/css">

.main {
	height: 800px;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 80%;
	height: 100%;
	background: white;
}
.title_div {
	height: 10%;
	margin-top: 50px;
	margin-left: 30px;
}
.info_div {
	height: 80%;
}
.button_div {
	height: 10%;
	text-align: right;
}
.image {
	margin-top: 1px;
	margin-right: 10px;
	width: 40px;
	height: 40px;
}
</style>
<script type="text/javascript">
	$("title").text("회원 예약 정보");
	$(function() {
		
	});
	
	function reserv_confirm(){
		if(confirm('정말로 예약을 수락하시겠습니까?')){
			alert('${reservation.checkin_dt} ~ ${reservation.checkout_dt} 일정으로 예약되었습니다.'  );
			return true;
		}
		else
			return false;
	}
</script>

<div class="main">
	<div class="container">
		<div class="title_div" >
			<h3>회원 예약 정보</h3>
		</div>
		<div class="info_div">
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>이름</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reserv_member.member_first_name} ${reserv_member.member_last_name}</span>
				</div>
			</div>
			
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>국적</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reserv_member.country_name_kor} (${reserv_member.country_name_eng})</span>
				</div>
			</div>
			
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>휴대폰 번호</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reserv_member.member_phone}</span>
				</div>
			</div>
			
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>Check-in Date</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reservation.checkin_dt}</span>
				</div>
			</div>
			
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>Check-out Date</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reservation.checkout_dt}</span>
				</div>
			</div>			
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>숙박 인원</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reservation.reserv_count} 명</span>
				</div>
			</div>		

			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>자기 소개</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reservation.member_intro}</span>
				</div>
			</div>	
			

			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>예약 요청일</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>${reservation.reg_dt}</span>
				</div>				
				
			</div>				
			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>결제 방법</strong>
				</div>
				<div class="col-sm-9 text-left">
					<span>현금(Cash)</span>
				</div>	
			</div>	

			<div class="col-sm-12 text-left">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<strong>상태</strong>
				</div>
				<div class="col-sm-9 text-left">
					<c:if test="${reservation.reserv_status == 1 }">
						<span style=" font-weight: bold;">예약 대기중..</span>
					</c:if>
					<c:if test="${reservation.reserv_status == 2 }">
						<span style="color: red; font-weight: bold;">예약완료</span>
					</c:if>
					
					<c:if test="${reservation.reserv_status == 3 }">
						<span style="color: red; font-weight: bold;">숙박 이용 완료</span>
					</c:if>
				</div>
			</div>			
			<div class="col-sm-12 text-left">
				<hr>
			</div>			
			
			
			
		</div>
		<form action="/product/reservation_detail" method="post">
			<input type="hidden" name="member_id" value="${reserv_member.member_id}">
			<input type="hidden" name="product_seq" value="${reservation.product_seq}">
			<input type="hidden" name="reservation_seq" value="${reservation.reservation_seq}">
			
			<div class="button_div">
				<input type="button" id="listBtn" class="btn btn-success" value="목록" onclick="location.href='/product/reservation_list?product_seq=${reservation.product_seq}'"/>
				<c:if test="${reservation.reserv_status ==1 }">
						<input type="submit" id="saveBtn" class="btn btn-success" value="예약 수락" onclick="return reserv_confirm();"/>
				</c:if>
			</div>
		</form>
	</div>
</div>



<%@include file="../footer.jsp"%>