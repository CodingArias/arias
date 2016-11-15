<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>





<style>
.main {
	height: auto;
	width: 100%;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 70%;
	height: 100%;
	background: white;
}

.product_info_div{
	width: 50%;
	height:100%;
	float: left;
}

.product_step {
	height: 100px;
}
.row {
	height: 1000px;
}

</style>

<div class="main">
	<div class="container">
		<div class="product_step">
			<h3>Hosting 완료 페이지</h3>
			<hr>
		</div>
		<div class="row">
			<!-- product 설명 구간-->
			<div class="">
				<div class="col-sm-12 text-left">
					<div class="media-left text-center">
						<!-- 임의 이미지  -->
					<img style="width: 100px; height: 100px;" class="img-circle" src="/resources/img/main/liverpool.jpg" >
						 <h4>회원 이름</h4>
					</div>
					<div class="media-right text-center">
						<h3>즐거운 우리집 우리집으로 놀러오세요. 좋은 하루~</h3>
						<h6>대한민국 서울특별시 노원구 월계동 산60-1</h6>
						<h6>사슴아파트 1단지 102-505</h6>
						
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
					<span>Welcome to Katie & Jake’s home located in the heart of
						Seoul. - Cozy private room with a beautiful city view - Walking
						distance from attractions in central Seoul (Cityhall,
						Gwanghuamoon, Deoksoo Palace, Namdaemoon Market, Namsan,
						Myungdong) - Easy access to popular tourist attractions ( Hongdae,
						Dondaemoon, Itaewon) - 2 min walk from Seodaemoon subway
						station(#5) and 10 min walk fron seoul city hall station(#1,#2) -
						Supermarket, 24 hours convenient stores, bakery, starbucks, bank
						in a 3 minute.</span>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>

				<!-- 숙소 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>숙소</strong>
					</div>
					<div class="col-sm-5 text-left">
						숙박 가능 인원 : 2<br> 침대 종류 : 2층 침대<br> 숙소 유형 : 단체실<br>
					</div>
					<div class="col-sm-5 text-left">
						건물 유형 : 아파트<br>
						<c:if test="${1==2}">dddasdasdd</c:if>
						추천 손님 : 가족 여행
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
					<div class="col-sm-5 text-left">
						최소 숙박 가능 일수 : 3일<br> 
						최대 숙박 가능 일수 : 2일<br>
						준비 기간	: 5일<br>
						최소 몇일 전 예약  : 2일

					</div>
					<div class="col-sm-5 text-left">
						체크인 : 14:00 이후<br> 
						체크아웃 : 12:00
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
						<div class="col-sm-6 text-left">부엌</div>
						<div class="col-sm-6 text-left">주차장</div>
						<div class="col-sm-6 text-left">수영장</div>
						<div class="col-sm-6 text-left">서재</div>
						<div class="col-sm-6 text-left">헬스장</div>
						<div class="col-sm-6 text-left">발코니</div>
						<div class="col-sm-6 text-left">옥상</div>
					</div>

					
					<!-- <div class="col-sm-5 text-left">
					
						부엌<br> 
						주차장<br>
						수영장<br>
						서재<br>
					</div>
					<div class="col-sm-5 text-left">
						헬스장 <br> 
						발코니<br>
						옥상<br>
					</div> -->
				</div>
				<div class="col-sm-12">
					<hr>
				</div>
					
				<!-- 제공 서비스 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>제공 서비스 </strong>
					</div>
					<div class="col-sm-5 text-left">
						무선 인터넷<br> 
						샴푸<br>
						옷장/서랍장<br>
						TV<br>
						난방<br>
						에어컨<br>
						벽난로<br>
						
					</div>
					<div class="col-sm-5 text-left">
						다리미<br>
						헤어 드라이기<br>
						컴퓨터<br>
						휴대폰 충전기<br>
						세탁기<br>
						건조기<br>
						조식, 커피, 차<br>
						필수 품목(수건, 비누, 화장지)<br>
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
					<div class="col-sm-5 text-left">
						연기 감지기<br> 
						일산화탄소 감지기<br>
						구급 상자<br>
						안전 정보 카드<br>
						소화기<br>
						침실 잠금 장치<br>
						
					</div>
					<div class="col-sm-5 text-left">
						금고<br>
						스프링 쿨러<br>
						세콤<br>
						CCTV<br>
						전자 도어락<br>
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
						흡연 금지 <br> 
						애완동물 동반 금지<br> 
						주류 반입 금지<br>
						마약류 반입 금지<br> 
						파티 금지<br>
						남녀 혼숙 금지<br> 
					</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 가격-->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>가격</strong>
					</div>
					<div class="col-sm-5 text-left">일 단위 요금 : ￦42319</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>	


			</div>
		</div>
	</div>
</div>


<%@include file="../footer.jsp"%>

