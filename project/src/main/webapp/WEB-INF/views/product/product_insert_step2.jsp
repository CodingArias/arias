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


<script type="text/javascript">
	var listArray = new Array();
	
	$(function() {
		var dates = new Array();
		function invalid() {

			dates = dates.concat(get_period("2016-11-03", "2016-11-12"));
			//dates = dates.concat(get_period("2016-12-13", "2016-12-20"));
			date_array_print(dates);
		}


		var startDate;
		var endDate;
 		$('#reportrange').daterangepicker({
			startDate : moment(),
			endDate : moment(),
			format : 'YYYY-MM-DD',
			"dateLimit" : {
				"days" : 100
			},
			"showDropdowns" : true,
			isInvalidDate : function(date) {
				var formatted = date.format('YYYY-MM-DD');
				return dates.indexOf(formatted) > -1;
			}

		}, function(start, end) {
			
			/* if(!date_invalid_check(start.format('YYYY-MM-DD'),end.format('YYYY-MM-DD'),dates)){
				console.log("해당 기간은 이미 예약 되어있습니다.");
			}else{

			} */
			startDate = start;
			endDate = end;
//			console.log("시작일 : "+start.format('YYYY-MM-DD'));
//		console.log("종료일 : "+end.format('YYYY-MM-DD'));		
			var date = new Object();
			date.start = start.format('YYYY-MM-DD');
			date.end = end.format('YYYY-MM-DD');
			listArray.push(date);
			
			for(var i=0; i < listArray.length;i++){
				console.log("start : "+listArray[i].start);
				console.log("end : "+listArray[i].end);
			}
			$("#list_tbody").append("<tr><td>"+date.start+" ~ "+date.end+"</td></tr>");
			
		});
 		
		
	});
</script>

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

.step_div {
	height: 5%;
}
.info_div {
	height: 30%;
}
.notsales_datelist_div{
	height: auto;
}
.btn_div{
	height: 10%;
}
.info_div input {
	margin-bottom: 10px;
}



</style>

<div class="main">
	<div class="container">
		<div class="step_div">
			<h2>Hosting Step 2</h2>
			<hr>
		</div>
		<div class="info_div">

				<p style="color: gray;">최소 숙박 가능일수</p>
				<input type="number" name="product_mindt" id="product_mindt" class="form-control input_type3" required="required"/>
				<p style="color: gray;">최대 숙박 가능일수</p>
				<input type="number" name="product_maxdt" id="product_maxdt" class="form-control input_type3" required="required"/>
				<p style="color: gray;">준비 기간</p>
				<input type="number" name="product_readydt" id="product_readydt" class="form-control input_type3" required="required"/>
				<p style="color: gray;">최소 몇 일 전 예약</p>
				<input type="number" name="product_prepdt" id="product_prepdt" class="form-control input_type3" required="required"/>
																
			</div>
			<div class="notsales_datelist_div">
			<p><span>예약 불가날짜 선택 </span><input class="form-control input_type3 info" type="text" name="daterange" id="reportrange"/>
				</p>
				<table id="date_list"  class="table table-hover table-striped input_type3">
					<tbody id="list_tbody" >
						
					</tbody>
				</table>
			</div>
			<div class="btn_div">
			</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>