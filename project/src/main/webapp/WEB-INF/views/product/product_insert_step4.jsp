<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/fileUpload.js"></script>

<style>
.main {
	height: auto;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 85%;
	height: 100%;
	background: white;
}

form {
	height: 100%;
}

.step_div {
	height: 5%;
	margin-bottom: 30px;
}
.image_btns_div {
	width:100%;
	padding:50px;
	text-align:right;
	position: fixed;
}
.image_edit_div {
	height: 75%;

}
.bottons_div {
	margin-top:10px;
	text-align:right;
	height: 10%;
}
.image {
	width: 20%;
	height : 20%;
	margin: 25px;
}
.sample_image {
	width: 27%;
	height : 20%;
	margin: 25px;
}

.file_div{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	//add more file components if Add is clicked
	$('#addImage').click(function() {
		var fileIndex = $('#file_table tr').children().length;
		$('#file_table').append(
				'<tr><td>'+
				'	<input type="file" name="files" id="files'+ fileIndex +'"/>'+
				'</td></tr>');
		
		
		$("#files"+ fileIndex).on("change", function(evt) {
			
			var files = evt.target.files; 
			f= files[0];
		    var selected_file_name = $(this).val();
		    if ( selected_file_name.length > 0 ) {
		    	$("#image_edit_div").append('<img class="img-rounded image" id="image'+fileIndex+'" alt="product_image">');
		    	$("#sample_images_div").css("display","none");
		    	 imageView($("#image"+fileIndex),this); 
		    }
		});

		//imageChange($("#image"+fileIndex),$("#files"+ fileIndex));
		
		
		$("#files"+ fileIndex).trigger('click');
		
		
		
	});
});
</script>
<div class="image_btns_div">
	<input type="button" id="addImage" class="btn btn-success" value="이미지 추가"/>	
</div>

<div class="main">
	<div class="container">
		<form>
			<div class="file_div">
				<table id="file_table">
				</table>
			</div>

			<div class="step_div">
				<h2>Hosting Step 4 - <span>숙소 이미지</span></h2>			
			</div>
			<hr>
			<div class="image_edit_div" id="image_edit_div">	
				<div id="sample_images_div" style="width: 100%;">
					<h3>숙소의 내부 공간을 찍어서 올려주세요.</h3>
					<img class="img-rounded sample_image" alt="" src="/resources/img/image.jpg"> 
					<img class="img-rounded sample_image" alt="" src="/resources/img/image2.jpg"> 
					<img class="img-rounded sample_image" alt="" src="/resources/img/image3.jpg"> 
					<img class="img-rounded sample_image" alt="" src="/resources/img/image4.jpg"> 
					<img class="img-rounded sample_image" alt="" src="/resources/img/image5.jpg"> 
					<img class="img-rounded sample_image" alt="" src="/resources/img/image7.jpg"> 

				</div>
			</div>
				
			<div class="bottons_div">
				<input id="" class="btn btn-success" type="button" value="뒤로가기"/>		
				<input id="saveBtn" class="btn btn-success" type="submit" value="최종 저장"/>		
			</div>
		</form>
	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>