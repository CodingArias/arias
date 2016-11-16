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
</style>


<script type="text/javascript">
	$("title").text("Reservation - 숙소 예약 ");

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
			

			var date = new Object();
			date.ns_start_dt = moment().format('YYYY-MM-DD');
			date.ns_end_dt = moment().format('YYYY-MM-DD');
			listArray.push(date);
			var dates = new Array();
			for(var i=0; i< listArray.length;i++){
				dates = dates.concat(get_period(listArray[i].ns_start_dt, listArray[i].ns_end_dt));
			}
			//dates = dates.concat(get_period("2016-12-13", "2016-12-20"));
			return dates;
		}


			var startDate;
			var endDate;
			var invalid_dates = invalid();
			
			$('#reportrange').daterangepicker({
	 		   "autoApply": true,
				startDate : moment(),
				endDate : moment(),
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
					var days=getDateTerm(date.ns_start_dt ,date.ns_end_dt);
					var price =42014;
					$("#ckin_dt").text(date.ns_start_dt);
					$("#ckout_dt").text(date.ns_end_dt);
					$("#hosting_day").text(days +" 일");
					
					$("#total_price").text("총 합계 : $"+ (price*days));
				} 
				
			});
	});
	function getDateTerm(start,end){
		var today = new Date();  
		var dateString = "2012-04-25";  
		  
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
		<form action="#" method="post">
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
						<span>이제는 마법부 직원으로 격무에 시달리면서도 한 여자의 남편이자 학교에 다니는 세 자녀의 아빠로서
							책임을 다해야 하는 해리 포터. 이야기는 혼잡하고 붐비는 킹스 크로스 역에서 시작된다. 서른일곱이 된 해리는 지금
							호그와트로 가는 두 아들을 배웅하는 길이다. 겉보기엔 영락없이 자상한 아빠지만 그에게는 아빠 역할이 조금 버겁다.
							남들처럼 보고 배울 아버지가 없었기 때문이다. 그의 이런 고민은 둘째 아들, 알버스 세베루스 포터와의 사이에서 더욱
							깊어진다. </span>
					</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 숙소소개  끝-->
				<!-- 투숙인원 확인 -->				
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>투숙 인원 확인</strong>
					</div>
					<div class="col-sm-10 text-left">
						<input type="number" class="form-control input_type1 col-sm-7" name="" id="" 
							   placeholder="" required="required">
						<span class="span_type01 col-sm-4">최대숙박인원 : 00 명</span>
					</div>
				</div>	
				<div class="col-sm-12">
					<hr>
				</div>	
				<!-- 투숙인원 확인 끝-->		
				<!-- 자기소개 -->	
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>자기 소개</strong>
					</div>
					<div class="col-sm-10 text-left">
						<textarea cols="30" rows="10" class="form-control" name="" id=""> 간단한 자기소개와 여행가는 이유를 알려주세요.
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
						<div class="col-sm-6 text-left">흡연 금지</div>
						<div class="col-sm-6 text-left">반려 동물 동반 금지</div>
						<div class="col-sm-6 text-left">혼숙 금지</div>
						<div class="col-sm-6 text-left">파티나 이벤트 금지</div>
						<div class="col-sm-6 text-left">주류 반입 금지</div>
						
			<%-- 			<c:forEach var="regulation" items="${product_regulation}">
							<div class="col-sm-6 text-left">${regulation.regulation_name}</div>
						</c:forEach> --%>
					</div>
				</div>
				<div class="col-sm-12">
					<hr>
				</div>
				<!-- 숙소 이용규칙 끝-->
				<!-- 결제 방법 -->				
				<div class="col-sm-12 text-left" >
					<div class="col-sm-2 text-left">
						<strong>결제 방법</strong>
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
						<h1>$42014</h1>
					</div>
					<div class="col-sm-12 text-left">
						<span>숙박 일시</span>
						<input class="form-control" type="text" name="daterange" id="reportrange"/>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>
					<div class="col-sm-12 text-left">
						<span>숙박 인원</span>
						<select class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
						</select>
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>		
										
					<div class="col-sm-12 text-left">
						<span>Check-In Date</span>
						<p id="ckin_dt" class="form-control"></p>						
					</div>	
					<div class="col-sm-12 text-left">
						<hr>
					</div>					
					<div class="col-sm-12 text-left">
						<span>Check-Out Date</span>
						<p id="ckout_dt" class="form-control"></p>
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
				<input id="saveBtn" class="btn btn-success" type="button"
					value="예약 하기" />
			</div>
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>