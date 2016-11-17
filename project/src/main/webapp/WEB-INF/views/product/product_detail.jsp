<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>

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
#map {
	height: 700px;
}

</style>
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<!-- 이미지크기 1200x400 -->
			<img src="/resources/img/main/seoul.png" alt="Image">
			<div class="carousel-caption">
				<h3>Sell $</h3>
				<p>Money Money.</p>
			</div>
		</div>

		<div class="item">
			<img src="/resources/img/main/travel.jpg" alt="Image">
			<div class="carousel-caption">
				<h3>More Sell $</h3>
				<p>Lorem ipsum...</p>
			</div>
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>

<br>


<div class="container text-center">
	<div class="row">
		<!-- product 설명 구간-->
		<div class="col-sm-9">
			<!-- 제목위치 -->
			<div class="col-sm-12">
				<div class="media">
					<div class="media-left">
						<!-- 임의 이미지  -->
						<a href="#"> <img class="media-object img-circle"
							src="/resources/img/search/original_12.jpg" alt="...">
						</a>
					</div>
					<div class="media-body text-left">
						<h3 class="media-heading">${product_detail.product_name }</h3>
						<!-- 위치  별점 예시-->
						<h4>${product_detail.product_addr}  별점</h4>
						<h4>${product_detail.accom_name }, 숙박인원 ${product_detail.number_of_people}명, 침대 한개</h4>
					</div>
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
				<span>${product_detail.product_info }</span>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

		
			
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6">
					숙박 가능 인원 : ${product_detail.number_of_people}
					</div>
					<div class="col-sm-6">
					건물유형 : ${product_detail.building_name}
					</div>
					<div class="col-sm-6">
					침대 종류 : ${product_detail.bed_name }
					</div>
					<div class="col-sm-6">
					추천 손님 : ${product_detail.sguest_name }
					</div>
					<div class="col-sm-6">
					숙소 유형 : ${product_detail.accom_name}
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>예약 정보</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6">
					최소 숙박 가능 일수 : ${product_detail.product_mindt }일
					</div>
					<div class="col-sm-6">
					체크인 : ${product_detail.checkin_time } 이후
					</div>
					<div class="col-sm-6">
					최대 숙박 가능 일수 : ${product_detail.product_maxdt }일
					</div>
					<div class="col-sm-6">
					체크아웃 : ${product_detail.checkout_time }
					</div>
					<div class="col-sm-6">
					준비 기간 : ${product_detail.product_readydt }일
					</div>
					<div class="col-sm-6">
					최소 몇일 전 예약 : ${product_detail.product_prepdt}일
					</div>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>사용 가능 공간</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach items="${product_space}" var="product_space">
					<div class="col-sm-6">
						${product_space.space_name}
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>제공 서비스</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach items="${product_convin}" var="product_convin">
					<div class="col-sm-6">
						${product_convin.convin_name}
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>안전 기능</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach items="${product_safety}" var="product_safety">
					<div class="col-sm-6">
						${product_safety.safety_name}
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소 이용 규칙</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach items="${product_regulation}" var="product_regulation">
					<div class="col-sm-6">
						${product_regulation.regulation_name}
					</div>
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
				<div class="col-sm-10 text-left">
				<div class="col-sm-6">
						일 단위 요금 :＄${product_detail.product_price}
					</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			
			

			<div class="col-sm-12">
				<br>
			</div>



			<!-- 후기 -->
			<div class="col-sm-12 text-left">
				<h4>
					<strong>후기</strong>
				</h4>
			</div>

			<!-- 후기 foreach -->
			
			<!-- 후기 작성칸 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div class="col-sm-12"><textarea rows="3" class="form-control" id="preply_content" name="preply_content"></textarea></div>
					<div class="col-sm-10"></div>
					<div class="col-sm-2"><button id="replyAddBtn" class="btn-primary btn">후기 입력</button></div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-12 text-left">
					<hr>
				</div>
			</div>
			
			<div class="col-sm-12 text-left">
				<div class="col-sm-1"></div>
				<div class="media col-sm-10">
					<div class="media-left text-center">
						<!-- 임의 이미지  -->
						<a href="#"> <img class="media-object img-circle"
							src="/resources/img/search/original_12.jpg" alt="...">

						</a> 아이디
					</div>
					<!-- 댓글 작성창 -->
					<div class="media-body text-left">
						<span>참 좋은 곳이군요 호호호</span> <br> 날짜 입력칸
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-12 text-left">
					<hr>
				</div>
			</div>
			
			<div id="replies" class="col-sm-12 text-left">
			</div>
			<div id="paging" class="col-sm-12 text-left">
				<ul class='pagination'>
				</ul>
			</div>
			<script>
				getPageList(1);
				
				var product_seq = ${product_detail.product_seq};
				var page = 1;
				
				
				
				function getPageList(page){
					var product_seq = ${product_detail.product_seq};
					
					$.getJSON("/replies/"+product_seq+"/"+page, function(data) {
						var str = "";
						console.log(data.list.length);
						$(data.list).each(
								function(){
									str += "<div data-product_seq='"+this.product_seq+"' class='col-sm-12 text-left'>"
									+ "<div class='col-sm-1'></div>"
									+ "<div class='media col-sm-10'>"
									+ "<div class='media-left text-center'>"
									+ "<a href='#'> <img class='media-object img-circle' src='/resources/img/search/original_12.jpg' alt='...'>"
									+ "</a>" +this.member_id
									+ "</div>"
									+ "<div class='media-body text-left'>"
									+ "<span>"+this.preply_content+"</span>"
									+ "<br>"
									+ "<span> 별점 : " +this.member_score+"</span>"
									+ "<br>"+this.preply_regdt
									+ "</div>"
									+ "</div>"
									+ "<div class='col-sm-1'></div>"
									+ "<div class='col-sm-12 text-left'>"
									+ "<hr>"
									+ "</div>"
									+ "</div>";	
								});
						$("#replies").html(str);
						
						printPaging(data.pageMaker);
						
					});	
				}
				/* function getAllList(){
					var product_seq = ${product_detail.product_seq};					
					$.getJSON("/replies/all/"+product_seq, function(data) {
						var str = "";
						console.log(data.length);
						
						
						$(data).each(
								function(){
									str += "<div data-product_seq='"+this.product_seq+"' class='col-sm-12 text-left'>"
									+ "<div class='col-sm-1'></div>"
									+ "<div class='media col-sm-10'>"
									+ "<div class='media-left text-center'>"
									+ "<a href='#'> <img class='media-object img-circle' src='/resources/img/search/original_12.jpg' alt='...'>"
									+ "</a>"+this.member_id
									+ "</div>"
									+ "<div class='media-body text-left'>"
									+ "<span>"+this.preply_content+"</span>"
									+ "<br>"
									+ "<span> 별점 : " +this.member_score+"</span>"
									+ "<br>"+ this.preply_regdt
									+ "</div>"
									+ "</div>"
									+ "<div class='col-sm-1'></div>"
									+ "<div class='col-sm-12 text-left'>"
									+ "<hr>"
									+ "</div>"
									+ "</div>";	
								});
						$("#replies").html(str);
					});
				} */
				
				$("#replyAddBtn").on("click", function() {
					var preply_content = $("#preply_content").val();
					var product_seq = ${product_detail.product_seq};
					var member_id = 201611030016;
					var member_score = 5;
					$.ajax({
						type : 'post',
						url : '/replies',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							product_seq : product_seq,
							member_id :  member_id,
							preply_content : preply_content,
							member_score : member_score=5
						}),
						success : function(){
							getAllList();
						}
					});
					
				});
				
			function printPaging(pageMaker) {
				var str="";
				var product_seq = ${product_detail.product_seq};
				if(pageMaker.prev) {
					str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
				}
				
				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.pcri.page == i?'class=active':'';
					str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
				}
				
				if(pageMaker.next){
					str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
				}
				
				$('.pagination').html(str);
			}
				
			var replyPage = 1;
			$(".pagination").on("click", "li a", function(event){
				event.preventDefault();
				
				replyPage = $(this).attr("href");
				
				getPageList(replyPage);
			})
				</script>
			<!-- 후기 foreach 끝 -->

			<!-- 호스트 정보 -->
			<div class="col-sm-12 text-left">
				<h4>
					<strong>호스트</strong>
				</h4>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 예약 가능 여부 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-1"></div>
				<div class="media col-sm-10">
					<div class="media-left text-center">
						<!-- 임의 이미지  -->
						<a href="#"> <img class="media-object img-circle"
							src="/resources/img/search/original_12.jpg" alt="...">
						</a>
					</div>
					<div class="media-body text-left">
						<h4 class="media-heading">${product_member.member_id}</h4>
						회원 가입일 : ${product_member.member_reg_date }<br>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-12 text-left">
					<hr>
				</div>
			</div>

			<div class="col-sm-12">
				<br>
			</div>
		</div>
</div>

		<!-- 가격 및 날짜표시 -->
		<div class="col-sm-3">
			<!-- 가격  -->
			<div>
				<form class="text-left" id="frm" method="get" action="product/reservation_step1">
					 <input
						type="hidden" name="checkin_dt" id="checkin" value="${checkin}"> <input
						type="hidden"  name="checkout_dt" id="checkout" value="${checkout}">
					<input type="hidden" name="product_seq" id="product_seq" value="${product_detail.product_seq}">
					
					<h2>＄ ${product_detail.product_price}</h2>
					<h5>숙박일시</h5>
					<div id="reportrange" class="form-group form-control"
						style="background: #fff; cursor: pointer;">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
						<b class="caret"></b>
					</div>
					<h5>숙박인원</h5>
					<div class="form-group" >
						<input type="number" name="reserv_count" class="form-control" value="${number_of_people}">
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary"   onclick="reseve_check();">예약 요청</button>
					</div>
				</form>
			</div>
		</div>

		<!-- detail 위치표시 -->
		<div class="col-sm-12">
			<div id="map" class="col-sm-12"></div>
		</div>
	</div>
</div>

<br>

<script>
function reseve_check(){
	  
	
	      $.ajax({
	         header : {
	            "Content-Type" :"application/json",
	            "X-HTTP-Method-Override" : "GET"
	         },
	         type : "GET",
	         url : "/product/reserv_dupl_check/"+'${product_detail.product_seq}',
	         dataType: "text",
	         success : function(result){
	        	 var reserv = JSON.parse(result);
	            if(reserv.duplicate==true)
	               $("#frm").submit();
	            else
	               alert("이미 예약하셨습니다.");
	         }
	      });
	   
	}
</script>

<!--지도 스크립트  -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&callback=initMap"
	async defer>
</script>

<!-- 지도스크립트 끝 -->
<script type="text/javascript">
	var map;
	
	
	
	
	function initMap() {
		// Create a map object and specify the DOM element for display.
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : Number('${product_detail.product_lat}'),
				lng : Number('${product_detail.product_lng}')
			},
			scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
			mapTypeControl : false, //맵 타입 컨트롤 사용 여부
			zoom : 15
		});
		var myLatLng = {lat: Number('${product_detail.product_lat}') , lng:Number('${product_detail.product_lng}') };
		var marker = new google.maps.Marker({
		    position: myLatLng,
		    map: map,
		  });
	}
</script>

<%@include file="../footer.jsp"%>
<!--달력 스크립트  -->
<script type="text/javascript">
$(function() {
	// 시작날짜와와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
	var start_date = moment($("#checkin").val());
	var end_date = moment($("#checkout").val());
	function cb(start, end) {
		$('#reportrange span').html(
				start.format('YYYY-MM-DD') + ' - '
						+ end.format('YYYY-MM-DD'));

		$('#checkin').val(start.format('YYYY-MM-DD'));
		$('#checkout').val(end.format('YYYY-MM-DD'));
	}
	cb(start_date, end_date);
	$('#reportrange').daterangepicker({
		"autoApply" : true,
		startDate : moment($("#checkin").val()),
		endDate : moment($("#checkout").val()),
		format : 'YYYY-MM-DD',
		"showDropdowns" : true,
	}, cb);
});

</script>
<!--달력 스크립트  끝-->

