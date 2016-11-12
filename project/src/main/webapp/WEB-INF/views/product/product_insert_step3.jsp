<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/datepicker/moment.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/datepicker/daterangepicker.css">
<script type="text/javascript"
	src="/resources/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/js/date.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
        $(document).ready(function() {
            $('a[data-toggle="tab"]').on('hidden.bs.tab', function(e){
                alert("이벤트 실행됨");
            });
        });
</script>
<style type="text/css">
.main {
	height: 900px;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 100%;
	height: 100%;
	background: white;
}
.step_div {
	height: 10%;
}
#all_tab_div{
	height:80%;
}
#btns_div{
	height: 10%;
}

#tab1_div{
	height: 100%;
}
#tab2_div{
	height: 100%;
}
#tab3_div{
	height: 100%;
}
#tab4_div{
	height: 100%;
}
#tab5_div{
	height: 100%;
}
#tab6_div{
	height: 100%;
}
#tab7_div{
	height: 100%;
}
#blank_div{ 
	width :15%;
	height:100%;
	float: left;
}
#select_div{
width :35%;
height: 80%;
float: left;
}
#select_div_top{
	height: 20%;
}
#explanation_div{
background-color:#FAFAFA;
width :40%;
height: 100%;
float: right;
}
#blank2_div{
	width: 10%;
	heigth:100%;
	float: left;
}
#explanation {
	background-color:white;
	width: 60%;
	height: 70%;
	border: 1px solid #eeeeee;
	margin-left: 20px;
	margin-top: 50px;
	padding: 20px;
}
#tab_place{
	height: 100%;
}
#tab_place p{
	color: gray;
	margin-top: 10px;
}

#tab_place input{
}
textarea {
	height: 100%;
	border: none;
}

.p_checkbox_title {
	margin-left: 10px;
	font-size: 20px;
	vertical-align:10px;
	color: gray; 
}
.p_checkbox {
	width: 250px;
	display: inline-block;
	margin-bottom: 10px;
}
</style>

<div class="main">
	<div class="container">
		<div class="step_div">
			<h2>Hosting Step 3</h2>
		</div>
		<div id="all_tab_div">
			
			<ul id="tab_bar" class="nav nav-pills " role="tablist">
			  <li role="presentation" class="active"><a data-target="#tab1_div" role="tab" id="tab1" data-toggle="tab" aria-controls="tab1_div" aria-expanded="true">숙소 유형</a></li>
			  <li role="presentation" class=""><a data-target="#tab2_div" role="tab" id="tab2" data-toggle="tab" aria-controls="tab1_div" aria-expanded="false">침실 / 손님<span class="badge">42</span></a></li>
			  <li role="presentation" class=""><a data-target="#tab3_div" role="tab" id="tab3" data-toggle="tab" aria-controls="tab3_div" aria-expanded="false">욕실</a></li>
			  <li role="presentation" class=""><a data-target="#tab4_div" role="tab" id="tab4" data-toggle="tab" aria-controls="tab4_div" aria-expanded="false">편의도구</a></li>
			  <li role="presentation" class=""><a data-target="#tab5_div" role="tab" id="tab5" data-toggle="tab" aria-controls="tab5_div" aria-expanded="false">보안</a></li>
			  <li role="presentation" class=""><a data-target="#tab6_div" role="tab" id="tab6" data-toggle="tab" aria-controls="tab6_div" aria-expanded="false">이용 규칙</a></li>
			  <li role="presentation" class=""><a data-target="#tab7_div" role="tab" id="tab7" data-toggle="tab" aria-controls="tab7_div" aria-expanded="false">공유 공간</a></li>
			  
			</ul>
			<p style="height: 7px; width: 100%; background-color:#FFBA46;"></p>
			<!--숙소유형-->
			<div id="tab_place" class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="tab1_div" class="tab_div"  aria-labelledby="tab1">
					<div id="blank_div"></div>
					<div id="select_div">
						<div id="select_div_top">
							<h3>등록하실 숙소의 종류는 무엇인가요?</h3>
						</div>
						<p>숙소 건물 유형</p>
						<select class="form-control input-lg" name="building_code" id="building_code">
							<option selected="selected">아파트</option>
							<option>개인실</option>
							<option>다인실</option>
						</select>
						<p>게스트가 묵을 방 유형</p>
						<select class="form-control input-lg" name="accom_code" id="accom_code">
							<option selected="selected">집전체</option>
							<option>개인실</option>
							<option>다인실</option>
						</select>
					</div>
					<div id="blank2_div"></div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">집 전체
게스트에게 별채를 포함한 집 전체를 빌려줍니다.

개인실
호스트와 공유하는 공간이 있긴 하지만 게스트에게 잠을 잘 수 있는 개인실이 제공됩니다.

다인실
게스트가 단독으로 쓸 수 있는 방이 제공되지 않습니다.</textarea>
						</div>
					</div>
				</div>
				<!--침실/손님-->
				<div role="tabpanel" class="tab-pane fade" id="tab2_div" aria-labelledby="tab2">
					<div id="blank_div"></div>
					<div id="select_div">
						<div id="select_div_top">
							<h3>침실의 종류는 무엇인가요?</h3>
						</div>
						<p>침대 유형</p>
						<select class="form-control input-lg" name="building_code" id="building_code">
							<option selected="selected">아파트</option>
							<option>개인실</option>
							<option>다인실</option>
						</select>
						<p>손님 유형</p>
						<select class="form-control input-lg" name="accom_code" id="accom_code">
							<option selected="selected">집전체</option>
							<option>개인실</option>
							<option>다인실</option>
						</select>
					</div>
					<div id="blank2_div"></div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
침대 유형
침대유형을 선택해주세요. 

손님 유형		
어떤 손님이 숙소를 이용하는데 적합한지 선택합니다.
						</textarea>
						</div>
					</div>
				</div>
				<!--욕실-->
				<div role="tabpanel" class="tab-pane fade" id="tab3_div" aria-labelledby="tab3">
					<div id="blank_div"></div>
					<div id="select_div">
						<div id="select_div_top">
							<h3>욕실에 어떤 것들이 있나요?</h3>
						</div>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">욕실</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">샤워부스</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">세면대</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">좌변기</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">비데</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">목욕탕</span></p>
					</div>
					<div id="blank2_div"></div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
욕실에 어떤 편의도구가 있는지 선택해주세요

						</textarea>
						</div>
					</div>
				</div>
				<!--편의시설-->
				<div role="tabpanel" class="tab-pane fade" id="tab4_div" aria-labelledby="tab4">
					<div id="blank_div"></div>
					<div id="select_div" style="width: 45%;" >
						<div id="select_div_top">
							<h3>숙소 내에 어떤 편의도구가 배치되어있나요?</h3>
						</div>
						<div style="overflow: auto; height: 100%; ">
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">수건,비누,화장지</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">무선 인터넷</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">샴푸</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">옷장/서랍장</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">TV</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">에어컨</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">조식, 커피 , 차</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">책장/작업공간</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">벽난로</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">다리미</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">헤어드라이기</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">컴퓨터</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">휴대폰 충전기</span></span>


						</div>
					</div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
필수품목을 제공하면 게스트가 내 집처럼 편안하게 머물 수 있습니다.
일부 호스트는 조식 또는 커피와 차만 제공하기도 합니다. 
필수 사항은 아니지만, 이런 서비스를 제공하면 게스트가 보다
 환영받는다고 느낄 수 있습니다.

						</textarea>
						</div>
					</div>
				</div>
				<!--보안-->
				<div role="tabpanel" class="tab-pane fade" id="tab5_div" aria-labelledby="tab5">
					<div id="blank_div"></div>
					<div id="select_div" style="width: 45%;" >
						<div id="select_div_top">
							<h3>숙소 내에 어떤 안전 도구/시설이 있나요?</h3>
						</div>
						<div style="overflow: auto; height: 100%; ">
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">연기 감지기</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">일산화탄소 감지기</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">구급 상자</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">안전 정보 카드</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">소화기</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">침실 장금 장치</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">금고</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">스프링 쿨러</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">세콤</span></span>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">CCTV</span></span>
						<br>
						<span class="p_checkbox"><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">전자도어락</span></span>
						</div>
					</div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
숙소를 이용하는 손님의 안전을 위해서 최소한의 안전도구를 비치해주세요.
						</textarea>
						</div>
					</div>
				</div>
				<!--이용규칙-->
				<div role="tabpanel" class="tab-pane fade" id="tab6_div" aria-labelledby="tab6">
					<div id="blank_div"></div>
					<div id="select_div">
						<div id="select_div_top">
							<h3>숙소의 이용규칙을 정해주세요.</h3>
						</div>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">실내 금연</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">애완동물 동반 금지</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">주류 반입 금지</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">마약류 반입 금지</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">파티 금지</span></p>
						<p><input type="checkbox" name="" value="" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">남녀 혼속 금지</span></p>
						<p>기타 사항</p>
						<textarea cols="" rows="5" class="form-control" name="product_role"></textarea>
					</div>
					<div id="blank2_div"></div>
					<div id="explanation_div">
						<div id="explanation">
						<textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
숙소의 규칙을 지정합니다.

손님이 숙소에서 하지말아야할 사항 또는
특이사항을 정합니다.

체크박스에 보이는 규칙 이외에 대해서는 직접 기입해주세요.

						</textarea>
						</div>
					</div>
				</div>
				<!--숙소이미지-->
				<div role="tabpanel" class="tab-pane fade" id="tab7_div" aria-labelledby="tab7">
					<div id="blank_div"></div>
					<div id="select_div"></div>
					<div id="explanation_div"></div>
				</div>
			</div>
		</div>
		<div id="btns_div">
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>