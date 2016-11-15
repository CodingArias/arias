<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript" src="/resources/datepicker/moment.js"></script>
  <link rel="stylesheet" type="text/css" href="/resources/datepicker/daterangepicker.css">
  <script type="text/javascript" src="/resources/datepicker/daterangepicker.js"></script>
  
  <script>
  $(function(){
	  $('#demo').daterangepicker({
		  "singleDatePicker": true,
		  "showDropdowns": true
	})
  });
/*   $(function(){
	  $('#demo').daterangepicker({
	    "singleDatePicker": true,
	    "startDate": "11/04/2016",
	    "endDate": "11/10/2016"
	}, function(start, end, label) {
	  console.log("New date range selected: ' + start.format('YY-MM-DD') + ' to ' + end.format('YY-MM-DD') + ' (predefined range: ' + label + ')");
	});
  }); */
  </script>


</head>

<body>

<div class="container">
 <h2>ADMINISTER</h2>
 <h1><strong>공지사항 등록</strong></h1>	
  
  <form id='registerForm' role="form" method="post">
    <div class="form-group">
      <label for="member_id">WRITER</label>
      <input style="text-align: center; width: auto" value="201611030003" type="text" class="form-control" name="member_id" placeholder="회원아이디" readonly="readonly">
      
    </div>
    
    <div class="form-group">
      <label for="notice_title">TITLE</label>
      <input style="text-align: center; width: auto" type="text" class="form-control" name="notice_title" placeholder="제목">
    </div>
    
     <div class="form-group">
      <label for="notice_content">CONTENT</label>
      <textarea rows="10" cols="30" class="form-control" name="notice_content" placeholder="내용">
      </textarea>
    </div>
    
    <div class="form-group">
       <input type="file" name="notice_img">
					<!-- <input type="file" name="member_img" id="member_img"  required="required"/> -->
					<!-- <img class="img-rounded" id="image" alt="product_image" src="/resources/img/noimage.jpg"> -->
	</div>
    
    
  <!--    <div class="form-group">
      <label for="member_reg_date">등록일</label>
      <input type="text" class="form-control" name="member_reg_date" placeholder="2000-01-01">
    </div>
    
 -->
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
  
</div>

</body>
</html>