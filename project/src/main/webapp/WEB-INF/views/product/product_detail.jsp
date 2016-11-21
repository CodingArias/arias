<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>


<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/star.css">

<style>
#map {
	height: 700px;
}

.image {
	margin-top: 1px;
	margin-right: 10px;
	width: 100px;
	height: 100px;
}

.carousel-inner>.item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	max-height: 600px;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">

<div id="myCarousel" class="carousel slide" data-ride="carousel">

	<!-- Indicators -->
	<ol class="carousel-indicators">
		<c:forEach items="${product_pic}" var="product_pic" varStatus="status">
			<c:if test="${status.index eq 0 }">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			</c:if>
			<c:if test="${status.index ne 0}">
				<li data-target="#myCarousel" data-slide-to="${status.index }"></li>
			</c:if>
		</c:forEach>

		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<c:forEach items="${product_pic}" var="product_pic" varStatus="status">
			<c:if test="${status.index eq 0}">
				<div class="item active">
					<img
						src="resources/product/product_images/${product_pic.pimg_name }"
						alt="Image">
					<div class="carousel-caption"></div>
				</div>
			</c:if>
			<c:if test="${status.index ne 0}">
				<div class="item">
					<img
						src="resources/product/product_images/${product_pic.pimg_name }"
						alt="Image">
					<div class="carousel-caption"></div>
				</div>
			</c:if>
		</c:forEach>


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
						<a href="#"> <img class="media-object img-circle image"
							src="/resources/product/product_main_image/${product_detail.p_main_img }"
							alt="...">
						</a>
					</div>
					<div class="media-body text-left">
						<h3 class="media-heading">${product_detail.product_name }</h3>
						<!-- 위치  별점 예시-->
						<h4>${product_detail.product_addr}별점</h4>
						<h4>${product_detail.accom_name },숙박인원
							${product_detail.number_of_people}명, 침대 한개</h4>
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
					<div class="col-sm-6">숙박 가능 인원 :
						${product_detail.number_of_people}</div>
					<div class="col-sm-6">건물유형 : ${product_detail.building_name}
					</div>
					<div class="col-sm-6">침대 종류 : ${product_detail.bed_name }</div>
					<div class="col-sm-6">추천 손님 : ${product_detail.sguest_name }
					</div>
					<div class="col-sm-6">숙소 유형 : ${product_detail.accom_name}</div>
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
					<div class="col-sm-6">최소 숙박 가능 일수 :
						${product_detail.product_mindt }일</div>
					<div class="col-sm-6">체크인 : ${product_detail.checkin_time }
						이후</div>
					<div class="col-sm-6">최대 숙박 가능 일수 :
						${product_detail.product_maxdt }일</div>
					<div class="col-sm-6">체크아웃 : ${product_detail.checkout_time }
					</div>
					<div class="col-sm-6">준비 기간 :
						${product_detail.product_readydt }일</div>
					<div class="col-sm-6">최소 몇일 전 예약 :
						${product_detail.product_prepdt}일</div>
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
						<div class="col-sm-6">${product_space.space_name}</div>
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
						<div class="col-sm-6">${product_convin.convin_name}</div>
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
						<div class="col-sm-6">${product_safety.safety_name}</div>
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
						<div class="col-sm-6">${product_regulation.regulation_name}
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
					<div class="col-sm-6">일 단위 요금
						:＄${product_detail.product_price}</div>
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
				<!-- 후기 작성칸 -->
				<div class="col-sm-12 text-left">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<div class="col-sm-12">
							<textarea rows="3" class="form-control" id="preply_content"
								name="preply_content"></textarea>
						</div>
						<div class="col-sm-10">
							<span class="star-input"> <span class="input focus"> <input
									type="radio" name="star-input" id="p1" value="0.5"><label
									for="p1">0.5</label> <input type="radio" name="star-input"
									id="p2" value="1.0"><label for="p2">1.0</label> <input
									type="radio" name="star-input" id="p3" value="1.5"><label
									for="p3">1.5</label> <input type="radio" name="star-input"
									id="p4" value="2.0"><label for="p4">2.0</label> <input
									type="radio" name="star-input" id="p5" value="2.5"><label
									for="p5">2.5</label> <input type="radio" name="star-input"
									id="p6" value="3.0"><label for="p6">3.0</label> <input
									type="radio" name="star-input" id="p7" value="3.5"><label
									for="p7">3.5</label> <input type="radio" name="star-input"
									id="p8" value="4.0"><label for="p8">4.0</label> <input
									type="radio" name="star-input" id="p9" value="4.5"><label
									for="p9">4.5</label> <input type="radio" name="star-input"
									id="p10" value="5.0"><label for="p10">5.0</label>
							</span> <output for="star-input" class="star-output">
									<b>0</b>점
								</output>
								
							</span>
						</div>
						<div class="col-sm-2">
							<button id="replyAddBtn" class="btn-primary btn">후기 입력</button>
						</div>
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
				<div id="replies" class="col-sm-12 text-left"></div>
				<div id="paging" class="col-sm-12 text-left">
					<ul class='pagination'>
					</ul>
				</div>
				<script>
					getPageList(1);
					var product_seq = ${product_detail.product_seq};
					var page = 1;

					function getPageList(page) {
						var product_seq = ${product_detail.product_seq};

						$
								.getJSON(
										"/replies/" + product_seq + "/" + page,
										function(data) {
											var str = "";
											console.log(data.list.length);
											$(data.list)
													.each(
															function() {
																str += "<div data-product_seq='"+this.product_seq+"' class='col-sm-12 text-left'>"
																		+ "<div class='col-sm-1'></div>"
																		+ "<div class='media col-sm-10'>"
																		+ "<div class='media-left text-center'>"
																		+ "<a href='#'> <img class='media-object img-circle' src='/resources/img/search/original_12.jpg' alt='...'>"
																		+ "</a>"
																		+ this.member_id
																		+ "</div>"
																		+ "<div class='media-body text-left'>"
																		+ "<span>"
																		+ this.preply_content
																		+ "</span>"
																		+ "<br>"
																		+ "<span> 별점 : "
																		+ this.member_score
																		+ "</span>"
																		+ "<br>"
																		+ this.preply_regdt
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
						var member_score = $(this).parent().prev().find("output>b").text();
						
						alert(member_score);
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
								preply_content : preply_content,
								member_score : member_score = 5
							}),
							success : function() {
								getAllList();
							}
						});

					});

					function printPaging(pageMaker) {
						var str = "";
						var product_seq = ${product_detail.product_seq};
						if (pageMaker.prev) {
							str += "<li><a href='" + (pageMaker.startPage - 1)
									+ "'> << </a></li>";
						}

						for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
							var strClass = pageMaker.pcri.page == i ? 'class=active'
									: '';
							str += "<li "+strClass+"><a href='"+i+"'>" + i
									+ "</a></li>";
						}

						if (pageMaker.next) {
							str += "<li><a href='" + (pageMaker.endPage + 1)
									+ "'> >> </a></li>";
						}

						$('.pagination').html(str);
					}

					var replyPage = 1;
					$(".pagination").on("click", "li a", function(event) {
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
							<a href="#"> <img class="media-object img-circle image"
								src="/resources/member/member_img/${product_member.member_img }"
								alt="...">
							</a>
						</div>
						<div class="media-body text-left">
							<h4 class="media-heading"
								style="line-height: 100px; font-weight: bold;">${product_member.member_first_name}
								${product_member.member_last_name}</h4>
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
				<form class="text-left" id="frm" method="get"
					action="product/reservation_step1">
					<input type="hidden" name="checkin_dt" id="checkin"
						value="${checkin}"> <input type="hidden"
						name="checkout_dt" id="checkout" value="${checkout}"> <input
						type="hidden" name="product_seq" id="product_seq"
						value="${product_detail.product_seq}">

					<h2>＄ ${product_detail.product_price}</h2>
					<h5>숙박일시</h5>
					<div id="reportrange" class="form-group form-control"
						style="background: #fff; cursor: pointer;">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
						<b class="caret"></b>
					</div>
					<h5>숙박인원</h5>
					<div class="form-group">
						<input type="number" name="reserv_count" class="form-control"
							value="${number_of_people}">
					</div>
					<div class="form-group">
						<c:if test="${duplicate eq 0}">
							<button type="submit" class="btn btn-primary">예약 요청</button>
						</c:if>
						<c:if test="${duplicate eq 1}">
							<button type="button" class="btn btn-primary">이미 예약 중...</button>
						</c:if>
						<c:if test="${duplicate eq 2}">
							<button type="button" class="btn btn-primary">예약 완료</button>
						</c:if>
						<c:if test="${duplicate eq 3}">
							<button type="submit" class="btn btn-primary">예약 요청</button>
							<br>
							<br>
							<br>
							<strong>또 오셨군요..!</strong>
						</c:if>

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
		var myLatLng = {
			lat : Number('${product_detail.product_lat}'),
			lng : Number('${product_detail.product_lng}')
		};
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
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
<script>
//star rating
var starRating = function(){
  var $star = $(".star-input"),
      $result = $star.find("output>b");
  $(document)
    .on("focusin", ".star-input>.input", function(){
    $(this).addClass("focus");
  })
    .on("focusout", ".star-input>.input", function(){
    var $this = $(this);
    setTimeout(function(){
      if($this.find(":focus").length === 0){
        $this.removeClass("focus");
      }
    }, 100);
  })
    .on("change", ".star-input :radio", function(){
    $result.text($(this).next().text());
  })
    .on("mouseover", ".star-input label", function(){
    $result.text($(this).text());
  })
    .on("mouseleave", ".star-input>.input", function(){
    var $checked = $star.find(":checked");
    if($checked.length === 0){
      $result.text("0");
    } else {
      $result.text($checked.next().text());
    }
  });
};
starRating();
</script>
