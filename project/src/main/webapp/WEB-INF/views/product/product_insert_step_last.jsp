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
					<div class="col-sm-3 text-left">
						<!-- 임의 이미지  -->
					<img style="width: 100px; height: 100px;" class="img-circle" src="/resources/img/main/liverpool.jpg" >
						 <h4>회원 이름</h4>
					</div>
					<div class="col-sm-7 text-center">
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
							<div class="col-sm-6 text-left">숙박 가능 인원 : ${product.number_of_people }</div>
							<div class="col-sm-6 text-left">침대 종류 : ${product.bed_name }</div>
							<div class="col-sm-6 text-left">숙소 유형 : ${product.accom_name }</div>
							<div class="col-sm-6 text-left">건물 유형 : ${product.building_name } </div>
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
							<div class="col-sm-6 text-left">최소 숙박 가능 일수 : ${product.product_mindt }</div>
							<div class="col-sm-6 text-left">준비 기간 : ${product.product_readydt }</div>
							<div class="col-sm-6 text-left">최대 숙박 가능 일수 : ${product.product_maxdt }</div>
							<div class="col-sm-6 text-left">Check-In Time : ${product.checkin_time } 이후</div>
							<div class="col-sm-6 text-left">최소 몇 일 전 예약 : ${product.product_prepdt }</div>
							<div class="col-sm-6 text-left">Check-Out Time : ${product.checkout_time }</div>
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
				<!-- 가격-->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>가격</strong>
					</div>
					<div class="col-sm-5 text-left">일 단위 요금 : $${product.product_price }</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>	
				<div class="col-sm-12 text-right">
					<input id="saveBtn" class="btn btn-success" type="submit" value="저장 확인"/>
				</div>

			</div>
		</div>
	</div>
</div>


<%@include file="../footer.jsp"%>

