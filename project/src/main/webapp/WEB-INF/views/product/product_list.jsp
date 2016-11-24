<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>


<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>



<style>
.img {
	height: 210px;
}
.date {
	color: gray;
}
.mybyn{
	margin-top: 35px;
}
</style>


<script type="text/javascript">



</script>

<div class="container text-center">
	<div class="row">
		<br>
		<div class="col-sm-3 text-left">
			<div>

			</div>
		</div>
		<div class="col-sm-9 text-left">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>등록된 숙소 현황</h4></div>
				
				<c:if test="${p_flag == false }">
					<div style="height: 200px; text-align: center;">
						<h4>등록하신 숙소가 없습니다.</h4>
					</div>
				</c:if>
				<!--숙소 -->
				<c:forEach var="product" items="${product_list }">
					<div class="panel-body">
						<div class="col-sm-5">
							<img src="/resources/product/product_main_image/${product.p_main_img }" alt="Image" class="img-responsive img-rounded img">
						</div>
						<div class="col-sm-7">	

							<h4><strong>${product.product_name }  </strong></h4>
							<h6><span class="date">${product.product_addr }  ${product.product_addr_detail }</span></h6>
							<h6><span class="date">가격 : $${product.product_price }</span></h6>
							
							<h6><span class="date">최종 수정일 : ${product.product_regdt }</span></h6>
							
							<c:if test="${product.product_step != 9 }">
								<h5><strong>숙소 등록이 step ${product.product_step}까지 완료 되었습니다.</strong></h5>
							</c:if>
							<c:if test="${product.product_step == 9 }">
								<input id="saveBtn" class="btn btn-success mybyn" 
								onclick="location.href='product_simple_detail?product_seq=${product.product_seq}'" type="button" value="숙소 확인"/>
								<button id="saveBtn" class="btn btn-success mybyn"  onclick="location.href='reservation_list?product_seq=${product.product_seq}'">예약 현황 <span class="badge"> ${product.now_reserv_num}</span></button>
							</c:if>
							<c:if test="${product.product_step != 9 }">
								<input id="saveBtn" class="btn btn-waring mybyn" type="button" value="계속 작성 하기"/>
							</c:if>
						</div>
					</div>
					<div class="col-sm-12">
						<hr>
					</div>
					<!--숙소 -->
				</c:forEach>
														
				</div>
			</div>
		</div>

	</div>

<br>


<%@include file="../footer.jsp"%>

<!--달력 스크립트  끝-->

