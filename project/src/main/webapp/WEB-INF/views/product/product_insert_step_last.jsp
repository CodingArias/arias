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
						숙박 가능 인원 : 2<br> 욕실 : 1 <br> 침대 종류 : 침대<br> 침실 : 1<br>
						침대 : 1
					</div>
					<div class="col-sm-5 text-left">
						체크인 : 14:00 이후<br> 체크아웃 : 12:00<br> 집 유형 : 아파트<br>
						숙소 유형 : 개인실
					</div>
				</div>

				<div class="col-sm-12">
					<hr>
				</div>
				<!-- 시설 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>시설</strong>
					</div>
					<div class="col-sm-5 text-left">
						건물 내 엘리베이터<br> 인터넷
					</div>
					<div class="col-sm-5 text-left">
						아침 식사 <br> 옷걸이<br>
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
					<div class="col-sm-5 text-left"></div>
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
						흡연 금지 <br> 반려동물 동반에 적합하지 않음<br> 파티나 이벤트 금지<br>
						어린이(0-12세) 숙박에 안전하거나 적합하지 않을 수 있음 <br> 체크인은 14:00 이후입니다. <br>
						No smoking No drinking <br> Only for women and couple(No
						Kids) <br>
					</div>
				</div>

				<div class="col-sm-12">
					<hr>
				</div>
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>안전 기능</strong>
					</div>
					<div class="col-sm-5 text-left">화재 감지기</div>
					<div class="col-sm-5 text-left">소화기</div>
				</div>

				<div class="col-sm-12">
					<hr>
				</div>
				<!-- 예약 가능 여부 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>예약 가능 여부</strong>
					</div>
					<div class="col-sm-5 text-left">최소 숙박 1일</div>
					<div class="col-sm-5 text-left"></div>
				</div>
				<!-- 예약 가능 여부 -->
			</div>
		</div>
	</div>
</div>


<%@include file="../footer.jsp"%>

