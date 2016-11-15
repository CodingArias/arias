<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>

<style type="text/css">
.main {
	height: auto;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 60%;
	height: 100%;
	background: white;
}
form{
	height: 100%;
}
.step_div {
	height: 5%;
}
.info_div {
	height: 30%;
	margin-bottom: 50px;
}
.notsales_datelist_div{
	height: 300px;
	overflow:auto;
}
.bottons_div{
	height: 10%;
	margin-top:10px;
	text-align:right;
}
.info_div input {
	margin-bottom: 10px;
}
</style>


<script type="text/javascript">
	$("title").text("Hosting Step2");
	var listArray = new Array();


	$(function() {
		
		
		
		$("#saveBtn").click(function(){

	          var product = new Object();
	          product.notsales = listArray;
	          var jsonInfo = JSON.stringify(product);
	          $("#notsales").val(jsonInfo);
	          return true;
		});

	
		function invalid() {
			var dates = new Array();
			for(var i=0; i< listArray.length;i++){
				dates = dates.concat(get_period(listArray[i].ns_start_dt, listArray[i].ns_end_dt));
			}
			//dates = dates.concat(get_period("2016-12-13", "2016-12-20"));
			return dates;
		}


		function createDaterangepicker(){
			var startDate;
			var endDate;
			var invalid_dates = invalid();
			
	 		$('#reportrange').daterangepicker({
	 		   "autoApply": true,
				startDate : moment(),
				endDate : moment(),
				format : 'YYYY-MM-DD',
				"showDropdowns" : true,
				  "drops": "up",
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
					listArray.push(date);
					
				
					$("#list_tbody").append("<tr class='active' ><td>"+date.ns_start_dt+" ~ "+date.ns_end_dt+"</td>"
					+"<td id="+date.ns_start_dt+" style='text-align:right;'>x</td></tr>");
					$("#"+date.ns_start_dt).on("click",function(){
						console.log($(this).parent());
						console.log("행 : "+$(this).parent().index());
						listArray.splice($(this).parent().index(),1);
						for(var i=0; i< listArray.length;i++){
							console.log(listArray[i].ns_start_dt);
							console.log(listArray[i].ns_end_dt);
							
						}
						$(this).parent().remove();
						createDaterangepicker()
					});
					createDaterangepicker();
				} 
				
			});
		}
		createDaterangepicker();
	});
</script>


<div class="main">
	<div class="container">
		<form action="product_insert_step2" method="post">
			<input type="hidden" name="notsales" id="notsales"/>
			<div class="step_div">
				<h2>Hosting Step 2 - 예약 관리</h2>
				<hr>
			</div>
			<div class="info_div">
				<p style="color: gray;">Check-In Time</p>
				<input type="time" name="checkin_time" id="checkin_time" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
				<p style="color: gray;">Check-Out Time</p>
				<input type="time" name="checkout_time" id="checkout_time" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
					
				<p style="color: gray;">최소 숙박 가능일수</p>
				<input type="number" name="product_mindt" id="product_mindt" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
				<p style="color: gray;">최대 숙박 가능일수</p>
				<input type="number" name="product_maxdt" id="product_maxdt" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
					
				<p style="color: gray;">준비 기간</p>
				<input type="number" name="product_readydt" id="product_readydt" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
				<p style="color: gray;">최소 몇 일 전 예약</p>
				<input type="number" name="product_prepdt" id="product_prepdt" class="form-control input_type3" required="required" placeholder="(단위 : 일)"/>
			</div>
			<p><span>예약 불가날짜 선택 </span><input class="form-control" type="text" name="daterange" id="reportrange"/></p>
			<div class="notsales_datelist_div">
				<table id="date_list"  class="table table-hover">
					<tbody id="list_tbody" >
					</tbody>
				</table>
			</div>
			<div class="bottons_div">
				<input id="backBtn" class="btn btn-success" type="submit" value="뒤로 가기"/>
				<input id="saveBtn" class="btn btn-success" type="submit" value="2단계 저장"/>
			</div>
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>