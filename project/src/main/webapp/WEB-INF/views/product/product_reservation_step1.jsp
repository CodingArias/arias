<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>



<style type="text/css">
.main {
	height: auto;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 90%;
	height: 100%;
	background: white;
}

form {
	height: 100%;
}

.info_div {
	width: 70%;
	height: 90%;
	margin-bottom: 50px;
	float: left;
}

.product_info_div {
	width: 30%;
	height: 90%;
	float: left;
}

.bottons_div {
	clear: left; height : 10%;
	margin-top: 10px;
	text-align: right;
	height: 10%;
}
.span_type01 {
	color: gray;
	padding-top: 7px;
}
textarea {
	padding: 20px;
}
img {

	width: 100%;
	height : 20%;
}
.important {
	color: red;
}
</style>


<script type="text/javascript">
	$("title").text("Reservation - 숙소 예약 ");

	var product_price = '${product.product_price}'
	$(function() {
		$('#payment').change(function(){
			var payment_type = $(this).val();
			if(payment_type=="p_001"){
				$("#card_componey").css("visibility","visible");
			}
			else if(payment_type=="p_002"){
				$("#card_componey").css("visibility","hidden");
			}
		});
		
		
		var listArray = new Array();
		
		function invalid() {
			<c:forEach var="date" items="${notsales}">
				var date = new Object();
				date.ns_start_dt = "${date.ns_start_dt}";
				date.ns_end_dt = "${date.ns_end_dt}";
				listArray.push(date);
			</c:forEach>
						
			var dates = new Array();
			for(var i=0; i< listArray.length;i++){
				console.log(listArray[i].ns_start_dt +" ~ " + listArray[i].ns_end_dt);
				dates = dates.concat(get_period(listArray[i].ns_start_dt, listArray[i].ns_end_dt));
			}
			for(var i=0; i<dates.length;i++){
				console.log(dates[i]);
			}
			return dates;
		}


			var startDate;
			var endDate;
			var invalid_dates = invalid();
			
			$('#reportrange').daterangepicker({
	 		   "autoApply": true,
				startDate : '${reservation.checkin_dt}',
				endDate : '${reservation.checkout_dt}',
				format : 'YYYY-MM-DD',
				"showDropdowns" : true,
				isInvalidDate : function(date) {
					var formatted = date.format('YYYY-MM-DD');
					return invalid_dates.indexOf(formatted) > -1;
				}

			}, function(start, end) {
				
				 if(!date_invalid_check(start.format('YYYY-MM-DD'),end.format('YYYY-MM-DD'),invalid_dates)){
					alert("해당 기간은 이미 예약 되어있습니다.");
				}else{
					startDate = start;
					endDate = end;	
					var date = new Object();
					date.ns_start_dt = start.format('YYYY-MM-DD');
					date.ns_end_dt = end.format('YYYY-MM-DD');
					console.log("start : "+date.ns_start_dt +"  end : " + date.ns_end_dt);
					showTotalPrice(date.ns_start_dt,date.ns_end_dt);
				} 
				
			});
			function showTotalPrice(start,end){
				var days=getDateTerm(start ,end);
				
				$("#ckin_dt").text(start);
				$("#ckout_dt").text(end);
				$("#checkin_dt").val(start);
				$("#checkout_dt").val(end);
				
				$("#hosting_day").text(days +" 일");
				
				$("#total_price").text("총 합계 : $"+ (product_price*days));
			}

			showTotalPrice('${reservation.checkin_dt}','${reservation.checkout_dt}');
	});

	function getDateTerm(start,end){
		var today = new Date();  
		  
		var startArray = start.split("-");  
		var startDate = new Date(startArray[0], Number(startArray[1])-1, startArray[2]);  
		  
		var endArray = end.split("-");  
		var endDate = new Date(endArray[0], Number(endArray[1])-1, endArray[2]);  

		
		var betweenDay = (endDate.getTime()-startDate.getTime())/1000/60/60/24;  
		
		return betweenDay+1;
	}

</script>


<div class="main">
	<div class="container">
		<form action="reservation_step1" method="post">
			<input type="hidden" name="product_seq" value="${reservation.product_seq }">
			<input type="hidden" name="checkin_dt" id="checkin_dt">
			<input type="hidden" name="checkout_dt" id="checkout_dt">
			
			<div class="col-sm-12 text-left">
				<h2>Reservation</h2>
			</div>	
			<div class="col-sm-12">
				<hr>
			</div>		
			<div class="info_div">
	
				<!-- 숙소소개 -->		
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>숙소 소개</strong>
					</div>
					<div class="col-sm-10 text-left">
						<span>${product.product_info}</span>
					</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 숙소소개  끝-->
				<!-- 투숙인원 확인 -->				
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>숙박 인원 <span class="important">*</span></strong>
					</div>
					<div class="col-sm-10 text-left">
						<input type="number" class="form-control input_type1 col-sm-7" name="reserv_count" id="reserv_count" 
							   placeholder="" required="required" value=${reservation.reserv_count }>
						<span class="span_type01 col-sm-4">최대숙박인원 : ${product.number_of_people} 명</span>
					</div>
				</div>	
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 투숙인원 확인 끝-->		
				<!-- 자기소개 -->	
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>자기 소개 <span class="important">*</span> </strong>
					</div>
					<div class="col-sm-10 text-left">
						<textarea cols="30" rows="10" class="form-control" name="member_intro" id="member_intro"> 간단한 자기소개와 여행가는 이유를 알려주세요.
						</textarea>
					</div>
				<div class="col-sm-12">
					<hr>
				</div>	
				</div>	
				<!-- 자기소개 끝  -->
				<!-- 숙소 이용규칙 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-2 text-left">
						<strong>숙소 이용규칙</strong>
					</div>
					<div class="col-sm-10 text-left">
						<c:forEach var="regul" items="${regulation}">
							<div class="col-sm-6 text-left">${regul.regulation_name}</div>
						</c:forEach>
					</div>
				</div>
				<!-- 체크인 체크아웃 시간 -->		
				<div class="col-sm-12">
					<hr>
				</div>			
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>체크 인/아웃</strong>
					</div>
					<div class="col-sm-10 text-left">
						<div class="col-sm-12 text-left">
							<span>체크인 시간 - ${product.checkin_time }</span>
						</div>
						
						<div class="col-sm-12 text-left">
							<span>체크아웃 시간 - ${product.checkout_time} 이후</span>
						</div>
					</div>
					
				</div>	
				<!-- 체크인 체크아웃 시간 끝-->						
				<div class="col-sm-12">
					<hr>
				</div>
				<!-- 숙소 이용규칙 끝-->
				<!-- 결제 방법 -->				
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>결제 방법  <span class="important">*</span></strong>
					</div>
					<div class="col-sm-10 text-left">
						<select id="payment" name="" class="form-control col-sm-5 input_type2">
							<option selected="selected" value="p_001">Credit or Debit</option>
							<option value="p_002">Cash</option>
						</select>
						<select id="card_componey" name="" class="form-control col-sm-5 input_type1" style="margin-left: 20px;">
							<option selected="selected">VISA</option>
							<option>AMEX</option>
							<option>Master</option>
							<option>Union Pay</option>
						</select>
						
					</div>
				</div>	
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 결제방법 끝-->	
							
			</div>
			<div class="product_info_div">
				<!-- 숙소 메인 이미지 -->
				<div class="col-sm-12 text-center">
					<div class="col-sm-12 text-left">
						<h1>$${product.product_price}</h1>
					</div>
					<div class="col-sm-12 text-left">
						<span>숙박 일시  <span class="important">*</span></span>
						<input class="form-control" type="text" name="daterange" id="reportrange"/>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>
										
					<div class="col-sm-12 text-left">
						<span>Check-In Date  </span>
						<p id="ckin_dt"  class="form-control">${reservation.checkin_dt }</p>						
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>					
					<div class="col-sm-12 text-left">
						<span>Check-Out Date  </span>
						<p id="ckout_dt" class="form-control">${reservation.checkout_dt }</p>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>													
					<div class="col-sm-12 text-left">
						<p>총 투숙 기간 : <span id="hosting_day"></span></p>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>		
					
					<div class="col-sm-12 text-left">
						<p>객실료 x 투숙기간 = 총 요금</p>
						<hr>
						<h3 id="total_price"></h3>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>					
				</div>			
			</div>
			<div class="bottons_div">
				<input id="saveBtn" class="btn btn-success" type="submit"
					value="예약 하기" />
			</div>
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>