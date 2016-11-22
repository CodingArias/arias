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

$("title").text("Hosting Step3 - 숙소 옵션 설정");
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
form {
   height: 100%;
}
.step_div {
   height: 10%;
}
#all_tab_div{
   height:80%;
}
#btns_div{
   height: 10%;
   text-align: right;
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
select {
   margin-bottom: 20px;
}
</style>

<div class="main">
   <div class="container">
      <form action="product_insert_step3" method="post">
         <div class="step_div">
            <h2>Hosting Step 3 - 숙소 옵션 설정</h2>
         </div>
         <div id="all_tab_div">
            
            <ul id="tab_bar" class="nav nav-pills " role="tablist">
              <li role="presentation" class="active"><a data-target="#tab1_div" role="tab" id="tab1" data-toggle="tab" aria-controls="tab1_div" aria-expanded="true">숙소</a></li>
              <li role="presentation" class=""><a data-target="#tab2_div" role="tab" id="tab2" data-toggle="tab" aria-controls="tab1_div" aria-expanded="false">침실 / 손님<span class="badge">42</span></a></li>
              <li role="presentation" class=""><a data-target="#tab3_div" role="tab" id="tab3" data-toggle="tab" aria-controls="tab3_div" aria-expanded="false">욕실</a></li>
              <li role="presentation" class=""><a data-target="#tab4_div" role="tab" id="tab4" data-toggle="tab" aria-controls="tab4_div" aria-expanded="false">제공 서비스</a></li>
              <li role="presentation" class=""><a data-target="#tab5_div" role="tab" id="tab5" data-toggle="tab" aria-controls="tab5_div" aria-expanded="false">안전 기능</a></li>
              <li role="presentation" class=""><a data-target="#tab6_div" role="tab" id="tab6" data-toggle="tab" aria-controls="tab6_div" aria-expanded="false">숙소 이용 규칙</a></li>
              <li role="presentation" class=""><a data-target="#tab7_div" role="tab" id="tab7" data-toggle="tab" aria-controls="tab7_div" aria-expanded="false">사용 가능 공간</a></li>
              
            </ul>
            <p style="height: 7px; width: 100%; background-color:#FFBA46;"></p>
            <div id="tab_place" class="tab-content">
               <!--숙소유형-->
               <div role="tabpanel" class="tab-pane fade active in" id="tab1_div" class="tab_div"  aria-labelledby="tab1">
                  <div id="blank_div"></div>
                  <div id="select_div">
                     <div id="select_div_top">
                        <h3>등록하실 숙소의 종류는 무엇인가요?</h3>
                     </div>
                     <p>숙소 건물 유형</p>
                     <select class="form-control input-lg" name="building_code_selected" id="building_code_selected">
                        <c:forEach var="building_code" items="${building_codes}" varStatus="status">
                           <c:if test="${status.first}">
                              <option value="${building_code.building_id}" selected="selected">${building_code.building_name}</option>
                           </c:if>
                           
                           <c:if test="${not status.first}">
                              <option value="${building_code.building_id}" >${building_code.building_name}</option>
                           </c:if>
                        </c:forEach>
                     </select>
                     <p>숙소 유형</p>
                     <select class="form-control input-lg" name="accom_code_selected" id="accom_code_selected">
                     <c:forEach var="accom_code" items="${accom_codes}" varStatus="status">
                           <c:if test="${status.first}">
                              <option value="${accom_code.accom_id}" selected="selected">${accom_code.accom_name}</option>
                           </c:if>
                           
                           <c:if test="${not status.first}">
                              <option value="${accom_code.accom_id}" >${accom_code.accom_name}</option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
                  <div id="blank2_div"></div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="aborder: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 집 전체게스트에게 별채를 포함한 집 전체를 빌려줍니다.
   
- 개인실
호스트와 공유하는 공간이 있긴 하지만 게스트에게 잠을 잘 수 있는 개인실이 제공됩니다.
   
- 다인실
게스트가 단독으로 쓸 수 있는 방이 제공되지 않습니다.
                     </textarea>
                     </div>
                  </div>
               </div>
               <!--침실/손님-->
               <div role="tabpanel" class="tab-pane fade" id="tab2_div" aria-labelledby="tab2">
                  <div id="blank_div"></div>
                  <div id="select_div">
                     <div id="select_div_top">
                        <h3>어떤손님이 숙소를 이용하면 좋을까요? 그리고 </h3>
                        <h3>침대의 종류는 무엇인가요?</h3>
                     </div>
                     <p>침대 유형</p>
                     <select class="form-control input-lg" name="bed_code_selected" id="bed_code_selected">
                        <c:forEach var="bed_code" items="${bed_codes}" varStatus="status">
                           <c:if test="${status.first}">
                              <option value="${bed_code.bed_id}" selected="selected">${bed_code.bed_name}</option>
                           </c:if>
                           
                           <c:if test="${not status.first}">
                              <option value="${bed_code.bed_id}">${bed_code.bed_name}</option>
                           </c:if>
                        </c:forEach>
                     </select>
                     <p>손님 유형</p>
                     <select class="form-control input-lg" name="suit_guest_code_selected" id="suit_guest_code_selected">
                        <c:forEach var="suit_guest_code" items="${suit_guest_codes}" varStatus="status">
                           <c:if test="${status.first}">
                              <option value="${suit_guest_code.sguest_id}" selected="selected">${suit_guest_code.sguest_name}</option>
                           </c:if>
                           
                           <c:if test="${not status.first}">
                              <option value="${suit_guest_code.sguest_id}">${suit_guest_code.sguest_name}</option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
                  <div id="blank2_div"></div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 침대 유형
침대유형을 선택해주세요. 
   
- 손님 유형      
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
                     <div style="overflow: auto; height: 100%;">
                        <c:forEach var="bath_code" items="${bath_codes}" varStatus="status">
                           <p><input type="checkbox" name="bath_code_checkeds" id="bath_code_checkeds" value="${bath_code.bath_id}" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">${bath_code.bath_name }</span></p>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="blank2_div"></div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 욕실에 어떤 도구이 있는지 선택해주세요
   
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
                        <c:forEach var="convin_code" items="${convin_codes}" varStatus="status">
                           <span class="p_checkbox"><input type="checkbox" name="convin_code_checkeds" id="convin_code_checkeds" value="${convin_code.convin_id }" class="form-control" style="width: 30px; display: inline;">
                              <span class="p_checkbox_title">${convin_code.convin_name}</span>
                           </span>
                              <c:if test="${(status.index % 2) == 1}"><br></c:if>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 필수품목을 제공하면 게스트가 내 집처럼 편안하게 머물 수 있습니다.
일부 호스트는 조식 또는 커피와 차만 제공하기도 합니다. 

- 필수 사항은 아니지만, 이런 서비스를 제공하면 게스트가 보다
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
                        <c:forEach var="safety_code" items="${safety_codes}" varStatus="status">
                           <span class="p_checkbox"><input type="checkbox" name="safety_code_checkeds" id="safety_code_checkeds" value="${safety_code.safety_id }" class="form-control" style="width: 30px; display: inline;">
                              <span class="p_checkbox_title">${safety_code.safety_name}</span>
                           </span>
                              <c:if test="${(status.index % 2) == 1}"><br></c:if>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 숙소를 이용하는 손님의 안전을 위해서 최소한의 안전도구를 비치해주세요.
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
                     <div style="overflow: auto; height: auto;">
                        <c:forEach var="regulation_code" items="${regulation_codes}" varStatus="status">
                           <p><input type="checkbox" name="regulation_code_checkeds" id="regulation_code_checkeds" value="${regulation_code.regulation_id}" class="form-control" style="width: 30px; display: inline;"><span class="p_checkbox_title">${regulation_code.regulation_name }</span></p>
                        </c:forEach>
                     </div>                  
                     <p>기타 사항</p>
                     <textarea cols="" rows="5" class="form-control" name="product_role"></textarea>
                  </div>
                  <div id="blank2_div"></div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 숙소의 규칙을 지정합니다.
   
- 손님이 숙소에서 하지말아야할 사항 또는 특이사항을 정합니다.
   
- 체크박스에 보이는 규칙 이외에 대해서는 직접 기입해주세요.
   
                     </textarea>
                     </div>
                  </div>
               </div>
               <!--공유 공간-->
               <div role="tabpanel" class="tab-pane fade" id="tab7_div" aria-labelledby="tab7">
                  <div id="blank_div"></div>
                  <div id="select_div" style="width: 45%;" >
                     <div id="select_div_top">
                        <h3>숙소 내에 어떤 공간을 공유하실 건가요?</h3>
                     </div>
                     <div style="overflow: auto; height: 100%; ">
                        <c:forEach var="space_code" items="${space_codes}" varStatus="status">
                           <span class="p_checkbox"><input type="checkbox" name="space_code_checkeds" id="space_code_checkeds" value="${space_code.space_id }" class="form-control" style="width: 30px; display: inline;">
                              <span class="p_checkbox_title">${space_code.space_name}</span>
                           </span>
                              <c:if test="${(status.index % 2) == 1}"><br></c:if>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="explanation_div">
                     <div id="explanation">
                     <textarea style="border: none; background-color:white; height: 100%;"  class="form-control" rows="" cols="" readonly="readonly">
- 숙소의 공유가능한 공간을 지정합니다.

- 집의 일부가 아닌 주변시설[ex)빨래방,도서관,편의점 등..]은 포함되지 않아요.

                     </textarea>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div id="btns_div">
            <input id="saveBtn" class="btn btn-success" type="button" value="뒤로가기"/>
            <input id="saveBtn" class="btn btn-success" type="submit" value="3단계 저장"/>
         </div>
      </form>
   </div>
   
</div>
<jsp:include page="../footer.jsp"></jsp:include>