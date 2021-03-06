<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	height: 100%;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 870px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

.image {
	position: relative;
	float: left;
	
}
.image>a {
	position: relative;
	max-height: 240px;
	height: 100%;
	padding:0px;
}
.image>a>img {
	position: relative;
	max-height: 240px;
	min-height: 240px;
	width: 100%;
	height: 100%;
}


.image .text {
	position: absolute;
	bottom: 2px;
	color: white;
	margin-left: 10px;
}
</style>


	

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-7 text-left"
				style="overflow: auto; height: 870px;">
				<br>

				<!-- Search&달력 form -->
				<form class="form-horizontal">
					<input type="hidden" id='lng' value='${lng}'> <input
						type="hidden" id='lat' value='${lat}'> <input
						type="hidden" id="checkin" value="${checkin}"> <input
						type="hidden" id="checkout" value="${checkout}">
					<div class="form-group">
						<label for="exampleInputName2" class="col-sm-1 control-label"> 검
							색 </label>
						<div class="col-sm-1"></div>
						<div class="col-sm-6">
							<input type="text" name="pac-input" id="pac-input" class="form-control" value="${keyword}">
						</div>

						<div class="col-sm-4"></div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">날
							짜</label>
						<div class="col-sm-1"></div>
						<div class="col-sm-6">
							<div id="reportrange" class="form-control"
								style="background: #fff; cursor: pointer;">
								<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
								<b class="caret"></b>
							</div>
						</div>
					</div>
					<div class="form-group">
					<label for="inputEmail3" class="col-sm-1 control-label">숙박 인원</label>
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<input type="number" name="number_of_people" class="form-control" placeholder="숙박 인원" value="${number_of_people }">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">숙소유형</label>
						<div class="col-sm-1"></div>
						<div class="col-sm-9 btn-group">
							<div class="col-sm-4">
								<label class="btn btn-danger form-control"> <input
									type="checkbox" autocomplete="off"> 집 전체
								</label>
							</div>
							<div class="col-sm-4">
								<label class="btn btn-danger form-control"> <input
									type="checkbox" autocomplete="off"> 개인실
								</label>
							</div>
							<div class="col-sm-4">
								<label class="btn btn-danger form-control"> <input
									type="checkbox" autocomplete="off"> 다인실
								</label>
							</div>
						</div>
					</div>
				</form>
				<!--form 끝  -->
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
								<br>
				<!-- 상품 사진 불러오기 시작 foreach 사용해야함 -->
				<c:forEach items="${list}" var="list">
				<div class="col-sm-6" style="margin-top: 10px;">
					<div class="col-sm-12 image">
						<a href='/detail?product_seq=${list.product_seq}&checkin=${checkin}&checkout=${checkout}&number_of_people=${number_of_people}' class="embed-responsive embed-responsive-4by3">
						<img src="/resources/product/product_main_image/${list.p_main_img}"
							class="img-rounded img-responsive img" alt="Responsive image">
						</a>
						<div class="text">
							<h4>＄ ${list.product_price}</h4>
						</div>
					</div>
						
					<!-- 상품 설명 -->
					<div class="col-sm-12">
						<div class="media">
							<div class="media-body">
								<br>
								<c:choose>
          							 <c:when test="${fn:length(list.product_name) > 13}">
      								     <h4 class="media-heading"> ${fn:substring(list.product_name,0,12)}....</h4>
           							</c:when>
           							<c:otherwise>
										<h4 class="media-heading">${list.product_name }</h4>
           							</c:otherwise> 
          						</c:choose>
								${list.accom_name} * 숙박가능인원 ${list.number_of_people }명 * 평점 : ${list.avg_member_score} 
							</div>
							<div class="media-right">
								<a href="#"> <img class="media-object img-circle"
									src="http://192.168.0.6:8080/resources/member/member_img/${list.member_img}" alt="" style="width: 60px; height: 60px;">
								</a>
							</div>
						</div>
					</div>
					
				</div>
	
				</c:forEach>
				<!-- 상품 사진 불러오기 시작 foreach 사용해야함 끝-->
				<script>
				
				</script>
				
			</div>
			<div class="col-sm-5 sidenav">
				<div id="map"></div>
			</div>
		</div>
	</div>
	<!--지도 스크립트  -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&libraries=places&callback=initMap"
		async defer></script>
	<!-- 지도스크립트 끝 -->

	<script type="text/javascript">
	var list = new Array(); 

		var map;
		var lat1 = Number($("#lat").val());
		var lng1 = Number($("#lng").val());
		var marker=[];
		
		<c:forEach items="${list}" var="product">
			var product = new Object();
			product.product_lng = ${product.product_lng};
			product.product_lat = ${product.product_lat};
			product.product_name = '${product.product_name}';
			product.product_img = '${product.p_main_img}';
			list.push(product);
		</c:forEach>
		
		for(var i = 0; i < list.length;i++){
			console.log("lng : "+list[i].product_lng +"  ,  "+"lat : "+list[i].product_lat);
		}
		
		
		// 지도 생성 밑 마커
		function initMap() {
			
			// Create a map object and specify the DOM element for display.
			
			
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : lat1,
					lng : lng1
				},
				scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
				mapTypeControl : false, //맵 타입 컨트롤 사용 여부
				zoom : 13
			});
			

		  var infowindow = new google.maps.InfoWindow({
		  });
			
		  var marker, i;
		  var product_name = new Array();
		  var content;
		  
			for (var i = 0; i < list.length;i++) {
				var myLatLng = {lat: list[i].product_lat, lng: list[i].product_lng };	
				product_name = list[i].product_name;
				content  = '<div class="media-cover text-center" '
				+ 'style="height:200px; width:260px;"> <img src="/resources/product/product_main_image/'
				+ list[i].product_img 
				+ '" class="img-thumbnail img-responsive" alt="Responsive image" style="height:100%; width:100%;" > </div>';
								
				marker = new google.maps.Marker({
				    position: myLatLng,
				    map: map,
				    title: product_name,
				    content: content
				    
				  });
				
				
				google.maps.event.addListener(marker, 'click', (function(marker, i) {
			        return function() {
			          infowindow.setContent(this.content);
			          infowindow.open(map, marker);
			        }
			      })(marker, i));
				
			}
			
			
			
			
			
			 var input = document.getElementById('pac-input');
			  //searchBox
			  var searchBox = new google.maps.places.SearchBox(input);
			  
			  
			  document.getElementById('pac-input').onkeypress = function (e) {
				  if(e.keyCode == 13){ 
					  var places = searchBox.getPlaces();
					  	if(places!=null){
							if (places.length == 0) {
								return;
							}
							console.log(places);
						    // For each place, get the icon, name and location.
						    var bounds = new google.maps.LatLngBounds();
						    places.forEach(function(place) {
						      bounds.extend(place.geometry.location);
						      //검색한 지점의 주소
						      console.log(place.formatted_address);
						      //검색한 지점의 x,y 좌표
							  console.log(place.geometry.location.lng());
						      console.log(place.geometry.location.lat());
						      alert(place.geometry.location.lng());
						      $("#lat").val(place.geometry.location.lat());
						      $("#lng").val(place.geometry.location.lng());
						    });
					  	}
				  }
		//검색창 enter 강제 트리거		  
		/* 		google.maps.event.trigger(input, 'focus')
			    google.maps.event.trigger(input, 'keydown', {
			    	keyCode: 13
			    });  */
				  
			  	
			  };
			
			
		} 
	</script>
	
	




