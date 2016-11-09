<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>

<!--지도 스크립트  -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5EjijY1yCUoti4Fr2ggCay4VowpqPdvc&callback=initMap"
	async defer>
</script>

<!-- 지도스크립트 끝 -->
<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>


<script type="text/javascript">
	var map;
	function initMap() {
		// Create a map object and specify the DOM element for display.
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.566535,
				lng : 126.9779692
			},
			scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
			mapTypeControl : false, //맵 타입 컨트롤 사용 여부
			zoom : 17
		});
	}
</script>
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
						<h3 class="media-heading">Katie&Jake's home in central
							Seoul(Type-A)</h3>
						<!-- 위치  별점 예시-->
						<h4>중구, 서울, 한국 별점</h4>
						<h4>개인실, 숙박인원 2명, 침대 한개</h4>
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
				<span>Welcome to Katie & Jake’s home located in the heart of
					Seoul. - Cozy private room with a beautiful city view - Walking
					distance from attractions in central Seoul (Cityhall, Gwanghuamoon,
					Deoksoo Palace, Namdaemoon Market, Namsan, Myungdong) - Easy access
					to popular tourist attractions ( Hongdae, Dondaemoon, Itaewon) - 2
					min walk from Seodaemoon subway station(#5) and 10 min walk fron
					seoul city hall station(#1,#2) - Supermarket, 24 hours convenient
					stores, bakery, starbucks, bank in a 3 minute.</span>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 숙소 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소</strong>
				</div>
				<div class="col-sm-5 text-left">
					숙박 가능 인원 : 2<br> 욕실 : 1 <br> 침대 종류 : 침대<br> 침실 : 1<br>
					침대 : 1
				</div>
				<div class="col-sm-5 text-left">
					체크인 : 14:00 이후<br> 체크아웃 : 12:00<br> 집 유형 : 아파트<br>
					숙소 유형 : 개인실
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 시설 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>시설</strong>
				</div>
				<div class="col-sm-5 text-left">
					건물 내 엘리베이터<br> 인터넷
				</div>
				<div class="col-sm-5 text-left">
					아침 식사 <br> 옷걸이<br>
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
				<div class="col-sm-5 text-left">일 단위 요금 : ￦42319</div>
				<div class="col-sm-5 text-left"></div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 설명-->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>설명</strong>
				</div>
				<div class="col-sm-10 text-left">
					<span>서울의 중심에 위치한 뷰가 좋은 고층아파트 입니다. 서대문역에서 도보 2분이며, 시청역 10번
						출구에서도 도보 10분 정도면 접근가능합니다. 인근에 덕수궁 돌담길, 정동길, 서울 시립미술관, 경희궁, 서울역사박물관
						등이 소재하여, 명동, 서울역, 광화문, 서울시청, 남대문시장, 남산 등 많은 관광명소에 도보로 접근가능합니다. 인근에
						농협 하나로마트, 편의점, 파리바게뜨 베이커리, 스타벅스, 폴바셋 등 커피샵, 농협은행, 하나은행 등 생활편의시설이
						소재하여 이용에 편리합니다.</span>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 숙소 이용규칙 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소 이용규칙</strong>
				</div>
				<div class="col-sm-10 text-left">
					흡연 금지 <br> 반려동물 동반에 적합하지 않음<br> 파티나 이벤트 금지<br>
					어린이(0-12세) 숙박에 안전하거나 적합하지 않을 수 있음 <br> 체크인은 14:00 이후입니다. <br>
					No smoking No drinking <br> Only for women and couple(No Kids)
					<br>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>안전 기능</strong>
				</div>
				<div class="col-sm-5 text-left">화재 감지기</div>
				<div class="col-sm-5 text-left">소화기</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 예약 가능 여부 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>예약 가능 여부</strong>
				</div>
				<div class="col-sm-5 text-left">최소 숙박 1일</div>
				<div class="col-sm-5 text-left"></div>
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
						<span>멋 져 요</span>
					</div>

				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-12 text-left">
					<hr>
				</div>
			</div>
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

						</a> 아이디
					</div>
					<!-- 댓글 작성창 -->
					<div class="media-body text-left">
						<h4 class="media-heading">호스트 아이디</h4>
						호스트 주소 회원 가입일<br>
						<p>저희집으로 놀러오세요</p>
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


		<!-- 가격 및 날짜표시 -->
		<div class="col-sm-3">
			<!-- 가격  -->
			<div>
				<form class="text-left">
					<h2>￦42319</h2>
					<h5>숙박일시</h5>
					<div id="reportrange" class="form-group form-control"
						style="background: #fff; cursor: pointer;">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span></span>
						<b class="caret"></b>
					</div>
					<h5>숙박인원</h5>
					<div class="form-group">
						<!-- db로 코드를 넣어줘야함 -->
						<select class="form-control">
							<option>숙박인원 1명</option>
							<option>숙박인원 2명</option>
							<option>숙박인원 3명</option>
							<option>숙박인원 4명</option>
							<option>숙박인원 5명</option>
						</select>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary">예약 요청</button>
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

<%@include file="../footer.jsp"%>
<!--달력 스크립트  -->
<script type="text/javascript">
	$(function() {
		// 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
		var start_date = moment().subtract(29, 'days');
		var end_date = moment();
		function cb(start, end) {
			$('#reportrange span').html(
					start.format('YYYY-MM-DD') + ' - '
							+ end.format('YYYY-MM-DD'));
		}
		cb(start_date, end_date);
		$('#reportrange').daterangepicker(
				{
					ranges : {
						'오늘' : [ moment(), moment() ],
						'어제' : [ moment().subtract(1, 'days'),
								moment().subtract(1, 'days') ],
						'지난 7일' : [ moment().subtract(6, 'days'), moment() ],
						'지난 30일' : [ moment().subtract(29, 'days'), moment() ],
						'이번 달' : [ moment().startOf('month'),
								moment().endOf('month') ],
						'지난 달' : [
								moment().subtract(1, 'month').startOf('month'),
								moment().subtract(1, 'month').endOf('month') ]
					},
					'startDate' : start_date,
					'endDate' : end_date
				}, cb);
	});

</script>
<!--달력 스크립트  끝-->

