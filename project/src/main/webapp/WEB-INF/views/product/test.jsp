<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<script type="text/javascript">
 $("title").text("테스트");
</script>


<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>


<script type="text/javascript">
	$(function() {
		var dates = new Array();
		function invalid() {

			dates = dates.concat(get_period("2016-11-03", "2016-11-12"));
			//dates = dates.concat(get_period("2016-12-13", "2016-12-20"));
			date_array_print(dates);
		}

		invalid();

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
			
			if(!date_invalid_check(start.format('YYYY-MM-DD'),end.format('YYYY-MM-DD'),dates)){
				console.log("해당 기간은 이미 예약 되어있습니다.");
			}else{
				startDate = start;
				endDate = end;
				console.log("시작일 : "+start.format('YYYY-MM-DD'));
				console.log("종료일 : "+end.format('YYYY-MM-DD'));		
			}
		});
		
	});
</script>

	<input type="text" name="daterange" id="reportrange"
		value="01/01/2015 - 01/31/2015" />



</body>
</html>