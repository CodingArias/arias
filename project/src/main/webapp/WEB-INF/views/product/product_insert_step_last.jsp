<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>


<script type="text/javascript"
	src="/resources/js/gallery_slider/jssor.slider-21.1.6.mini.js"></script>

<script type="text/javascript">

$("title").text("숙소 정보");
	jQuery(document).ready(function($) {

		var jssor_1_SlideshowTransitions = [ {
			$Duration : 1200,
			x : 0.3,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : -0.3,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : -0.3,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : 0.3,
			$During : {
				$Top : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : -0.3,
			$SlideOut : true,
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : -0.3,
			$During : {
				$Top : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : 0.3,
			$SlideOut : true,
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$Cols : 2,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$ChessMode : {
				$Column : 3
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$Cols : 2,
			$SlideOut : true,
			$ChessMode : {
				$Column : 3
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : 0.3,
			$Rows : 2,
			$During : {
				$Top : [ 0.3, 0.7 ]
			},
			$ChessMode : {
				$Row : 12
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : 0.3,
			$Rows : 2,
			$SlideOut : true,
			$ChessMode : {
				$Row : 12
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : 0.3,
			$Cols : 2,
			$During : {
				$Top : [ 0.3, 0.7 ]
			},
			$ChessMode : {
				$Column : 12
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			y : -0.3,
			$Cols : 2,
			$SlideOut : true,
			$ChessMode : {
				$Column : 12
			},
			$Easing : {
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$Rows : 2,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$ChessMode : {
				$Row : 3
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : -0.3,
			$Rows : 2,
			$SlideOut : true,
			$ChessMode : {
				$Row : 3
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			y : 0.3,
			$Cols : 2,
			$Rows : 2,
			$During : {
				$Left : [ 0.3, 0.7 ],
				$Top : [ 0.3, 0.7 ]
			},
			$ChessMode : {
				$Column : 3,
				$Row : 12
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			y : 0.3,
			$Cols : 2,
			$Rows : 2,
			$During : {
				$Left : [ 0.3, 0.7 ],
				$Top : [ 0.3, 0.7 ]
			},
			$SlideOut : true,
			$ChessMode : {
				$Column : 3,
				$Row : 12
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Top : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			$Delay : 20,
			$Clip : 3,
			$Assembly : 260,
			$Easing : {
				$Clip : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			$Delay : 20,
			$Clip : 3,
			$SlideOut : true,
			$Assembly : 260,
			$Easing : {
				$Clip : $Jease$.$OutCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			$Delay : 20,
			$Clip : 12,
			$Assembly : 260,
			$Easing : {
				$Clip : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			$Delay : 20,
			$Clip : 12,
			$SlideOut : true,
			$Assembly : 260,
			$Easing : {
				$Clip : $Jease$.$OutCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		} ];

		var jssor_1_options = {
			$AutoPlay : true,
			$SlideshowOptions : {
				$Class : $JssorSlideshowRunner$,
				$Transitions : jssor_1_SlideshowTransitions,
				$TransitionsOrder : 1
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$ThumbnailNavigatorOptions : {
				$Class : $JssorThumbnailNavigator$,
				$Cols : 10,
				$SpacingX : 8,
				$SpacingY : 8,
				$Align : 360
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*responsive code begin*/
		/*you can remove responsive code if you don't want the slider scales while window resizing*/
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 800);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$(window).bind("load", ScaleSlider);
		$(window).bind("resize", ScaleSlider);
		$(window).bind("orientationchange", ScaleSlider);
		/*responsive code end*/
	});
</script>


<style>
/* jssor slider arrow navigator skin 05 css */
/*
        .jssora05l                  (normal)
        .jssora05r                  (normal)
        .jssora05l:hover            (normal mouseover)
        .jssora05r:hover            (normal mouseover)
        .jssora05l.jssora05ldn      (mousedown)
        .jssora05r.jssora05rdn      (mousedown)
        .jssora05l.jssora05lds      (disabled)
        .jssora05r.jssora05rds      (disabled)
        */
.jssora05l, .jssora05r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 40px;
	height: 40px;
	cursor: pointer;
	background: url('/resources/img/gallery_slider/a17.png') no-repeat;
	overflow: hidden;
}

.jssora05l {
	background-position: -10px -40px;
}

.jssora05r {
	background-position: -70px -40px;
}

.jssora05l:hover {
	background-position: -130px -40px;
}

.jssora05r:hover {
	background-position: -190px -40px;
}

.jssora05l.jssora05ldn {
	background-position: -250px -40px;
}

.jssora05r.jssora05rdn {
	background-position: -310px -40px;
}

.jssora05l.jssora05lds {
	background-position: -10px -40px;
	opacity: .3;
	pointer-events: none;
}

.jssora05r.jssora05rds {
	background-position: -70px -40px;
	opacity: .3;
	pointer-events: none;
}
/* jssor slider thumbnail navigator skin 01 css */
/*.jssort01 .p            (normal).jssort01 .p:hover      (normal mouseover).jssort01 .p.pav        (active).jssort01 .p.pdn        (mousedown)*/
.jssort01 .p {
	position: absolute;
	top: 0;
	left: 0;
	width: 72px;
	height: 72px;
}

.jssort01 .t {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border: none;
}

.jssort01 .w {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
}

.jssort01 .c {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 68px;
	height: 68px;
	border: #000 2px solid;
	box-sizing: content-box;
	background: url('/resources/img/gallery_slider/t01.png') -800px -800px
		no-repeat;
	_background: none;
}

.jssort01 .pav .c {
	top: 2px;
	_top: 0px;
	left: 2px;
	_left: 0px;
	width: 68px;
	height: 68px;
	border: #000 0px solid;
	_border: #fff 2px solid;
	background-position: 50% 50%;
}

.jssort01 .p:hover .c {
	top: 0px;
	left: 0px;
	width: 70px;
	height: 70px;
	border: #fff 1px solid;
	background-position: 50% 50%;
}

.jssort01 .p.pdn .c {
	background-position: 50% 50%;
	width: 68px;
	height: 68px;
	border: #000 2px solid;
}

* html .jssort01 .c, * html .jssort01 .pdn .c, * html .jssort01 .pav .c
	{ /* ie quirks mode adjust */
	width /**/: 72px;
	height /**/: 72px;
}

.main {
	height: auto;
	width: 100%;
}

.container {
	/*상 우 하 좌  */
	margin: 0px auto;
	width: 70%;
	height: 100%;
	background: white;
}

.product_info_div {
	width: 50%;
	height: 100%;
	float: left;
}

.product_step {
	height: 100px;
}

.row {
	height: 1000px;
}
</style>

<div class="main">
	<div class="container">
		<div class="product_step">
		
			<h3>숙소 정보</h3>
			<hr>
		</div>
		<div class="row">
			<!-- product 설명 구간-->
			<div class="col-sm-12 text-left">
				<div class="col-sm-3 text-left">
					<!-- 임의 이미지  -->
					<img  style="width: 100px; height: 100px;" class="img-circle"
						src="/resources/member/member_img/${product_member.member_img }">
					<h4 style="margin-left: 25px;"><strong>${product_member.member_first_name} ${product_member.member_last_name}</strong></h4>
				</div>
				<div class="col-sm-7 text-center">
					<h2>${product.product_name }</h2>
					<h6>${product.product_addr }</h6>
					<h6>${product.product_addr_detail }</h6>
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
				<span>${product.product_info}</span>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 숙소 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>숙소</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6 text-left">숙박 가능 인원 :
						${product.number_of_people }</div>
					<div class="col-sm-6 text-left">침대 종류 : ${product.bed_name }</div>
					<div class="col-sm-6 text-left">숙소 유형 : ${product.accom_name }</div>
					<div class="col-sm-6 text-left">건물 유형 :
						${product.building_name }</div>
					<div class="col-sm-6 text-left">추천 손님 : ${product.sguest_name }</div>
				</div>

			</div>

			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 예약 정보 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>예약 정보</strong>
				</div>
				<div class="col-sm-10 text-left">
					<div class="col-sm-6 text-left">최소 숙박 가능 일수 :
						${product.product_mindt }</div>
					<div class="col-sm-6 text-left">준비 기간 :
						${product.product_readydt }</div>
					<div class="col-sm-6 text-left">최대 숙박 가능 일수 :
						${product.product_maxdt }</div>
					<div class="col-sm-6 text-left">Check-In Time :
						${product.checkin_time } 이후</div>
					<div class="col-sm-6 text-left">최소 몇 일 전 예약 :
						${product.product_prepdt }</div>
					<div class="col-sm-6 text-left">Check-Out Time :
						${product.checkout_time }</div>
				</div>

			</div>
			<div class="col-sm-12">
				<hr>
			</div>


			<!-- 사용 가능 공간 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>사용 가능 공간</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="space" items="${product_space }">
						<div class="col-sm-6 text-left">${space.space_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>

			<!-- 제공 서비스 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>제공 서비스 </strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="convin" items="${product_convin}">
						<div class="col-sm-6 text-left">${convin.convin_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 안전 기능 -->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>안전 기능</strong>
				</div>
				<div class="col-sm-10 text-left">
					<c:forEach var="safety" items="${product_safety}">
						<div class="col-sm-6 text-left">${safety.safety_name}</div>
					</c:forEach>
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
					<c:forEach var="regulation" items="${product_regulation}">
						<div class="col-sm-6 text-left">${regulation.regulation_name}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<!-- 숙소 이용규칙 끝-->
			
			<!-- 가격-->
			<div class="col-sm-12 text-left">
				<div class="col-sm-2 text-left">
					<strong>가격</strong>
				</div>
				<div class="col-sm-5 text-left">일 단위 요금 :
					$${product.product_price }</div>
			</div>
			<div class="col-sm-12">
				<hr>
			</div>
			<div class="col-sm-12 text-left">
				<div id="jssor_1"
					style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 456px; overflow: hidden; visibility: hidden; background-color: #24262e;">
					<!-- Loading Screen -->
					<div data-u="loading"
						style="position: absolute; top: 0px; left: 0px;">
						<div
							style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
						<div
							style="position: absolute; display: block; background: url('/resources/img/gallery_slider/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
					</div>
					<div data-u="slides"
						style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 356px; overflow: hidden;">
						<c:forEach var="product_img" items="${product_pic}">
							<div data-p="144.50">
								<img data-u="image" src="/resources/product/product_images/${product_img.pimg_name}" /> <img
									data-u="thumb" src="/resources/product/product_images/${product_img.pimg_name}" />
							</div>
						</c:forEach>
					
					</div>
					<!-- Thumbnail Navigator -->
					<div data-u="thumbnavigator" class="jssort01"
						style="position: absolute; left: 0px; bottom: 0px; width: 800px; height: 100px;"
						data-autocenter="1">
						<!-- Thumbnail Item Skin Begin -->
						<div data-u="slides" style="cursor: default;">
							<div data-u="prototype" class="p">
								<div class="w">
									<div data-u="thumbnailtemplate" class="t"></div>
								</div>
								<div class="c"></div>
							</div>
						</div>
						<!-- Thumbnail Item Skin End -->
					</div>
					<!-- Arrow Navigator -->
					<span data-u="arrowleft" class="jssora05l"
						style="top: 158px; left: 8px; width: 40px; height: 40px;"></span>
					<span data-u="arrowright" class="jssora05r"
						style="top: 158px; right: 8px; width: 40px; height: 40px;"></span>
				</div>
			</div>

			<div class="col-sm-12">
				<hr>
			</div>			
			
			<div class="col-sm-12 text-right">
				<input id="saveBtn" class="btn btn-success" type="button"
					value="확인" onclick="location.href='/product/product_list';"/>
			</div>

		</div>
	</div>
</div>


<%@include file="../footer.jsp"%>

