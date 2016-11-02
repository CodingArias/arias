<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
 	 <title>Bootstrap Example</title>
 	 <meta charset="utf-8">
 	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 
  	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	 
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
 	<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
	<script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script> 
	<script type="text/javascript">
		$(function() {
			
			
 			function date_priod(start,end){
 				console.log(start.format('YYYY-MM-DD'));
 				console.log(end.format('YYYY-MM-DD'));
 				
				
			/* 	var date_array = new Array();
				var a =1;
				for(var start_date = start ;a<10 ; start_date = moment(start_date)+1){
					console.log(start_date.format("YYYY-MM-DD"));
					
					a++;
				} */
			} 
			
			date_priod( moment("2016-11-01", "YYYY-MM-DD"), moment("2016-11-10", "YYYY-MM-DD"));
		 
			
			var some_date_range = [
			                        '2016-11-01',
			                        '2016-11-03',
			                        '2016-11-04',
			                        '2016-11-05'
			                      ];
			var startDate;
			var endDate;
			 $('#reportrange').daterangepicker(
				       {
				          startDate: moment(),
				          endDate: moment(),
				          format: 'YYYY-MM-DD',
				          "autoApply": true,
				          "dateLimit": {
				              "days": 100
				          },
				          "showDropdowns": true,
				          isInvalidDate: function(date){
				        	  for(var ii = 0; ii < some_date_range.length; ii++){
				        	    if (date.format('YYYY-MM-DD') == some_date_range[ii]){
				        	        return true;
				        	      }
				        	    }
				        }
				          
				       },
				       function(start, end) {
				        startDate = start;
				        endDate = end;    
				        console.log(start.format('YYYY-MM-DD'));
				        console.log(end.format('YYYY-MM-DD'));
				       }
				    );
		});
	</script>
	
</head>
<body>
	
	<input type="text" name="daterange" id="reportrange" value="01/01/2015 - 01/31/2015" />


</body>
</html>

