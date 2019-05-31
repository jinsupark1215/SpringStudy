<%@page import="edu.ssafy.safefood.dto.Health"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SafeFood | HealthCare</title>
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Stylish" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
.links {
	margin: 0;
	padding: 0;
	width: 30px;
	height: 30px;
	left: 20px;
	top: 40%;
	position: fixed;
	z-index: 100;
	font-size: 20px;
	font-weight: bold;
}

.slides {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.slides ul li {
	position: absolute;
	text-align: center;
	font-size: 20px;
}

.links ul li {
	list-style: none;
}

.links ul li a {
	text-decoration: none;
	color: black;
}

.links ul li a:hover {
	color: #eee;
}

#slide1 {
	background-color: red;
}

#slide2 {
	background-color: green;
	display: none;
}

#slide3 {
	background-color: blue;
	display: none;
}

* {
	font-family: 'Stylish', sans-serif;
}

td {
	width: 30%;
	height: 50%;
	position: relative;
}

td>span {
	transition: 1s ease;
	position: absolute;
	top: 45%;
	font-size: 2.5em;
}

td img {
	vertical-align: middle;
	transition: 1s ease;
	-webkit-filter: grayscale(100%);
	filter: gray;
}

td:hover img {
	transition: 1s ease;
	-webkit-filter: grayscale(0%);
	filter: none;
}

td:active img {
	-webkit-filter: grayscale(0%);
	filter: none;
}

.tab-pane {
	margin: auto;
}

td:hover span {
	transition: 1s ease;
	font-size: 2.5em;
}

.listitems {
	border: 1px solid gold;
	width: 13%;
	height: 80%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- ${healthList} -->
	<table style="height: 50%; width: 80%; margin: auto; margin-top: 4%;">
		<tr class="nav nav-tabs">
			<!-- body part -->
			<td>
				<img id="bodyimg" class="img-responsive" src="/resources/img/body.jpg" alt="${card_index.value.name}" style="height: 400px; width: 100%;" onclick="bodyclick('BODY')">
				<span style="left: 10%; color: white;">BODY</span>
			</td>
			<!-- health part -->
			<td>
				<img id="healthimg" class="img-responsive" src="/resources/img/health.jpg" alt="${card_index.value.name}" style="height: 400px; width: 100%;" onclick="healthclick('HEALTH')">
				<span style="left: 10%; color: black;">HEALTH</span>
			</td>
			<!-- mental part -->
			<td>
				<img id="mentalimg" class="img-responsive" src="/resources/img/mental.jpg" alt="${card_index.value.name}" style="height: 400px; width: 100%;" onclick="mentalclick('MENTAL')">
				<span style="left: 30%; color: white;">MENTAL</span>
			</td>
		</tr>
	</table>
	<h1 style="text-align: center;" id="tit"></h1>
	<div class="tab-content" style="height: 40vh; width: 95%; margin: auto; text-align: center;">
		<!-- body -->
		<div id="bodytab" class="tab-pane fade" style="height: 100%; width: 90%;">
			<table style="border: 1px solid gold; height: 70%; width: 100%">
				<tr>
					<c:forEach items="${bodyList }" var="contents">
						<td class="listitems" style="padding: 4px;">
							<button type="button" style="width: 80%; height: 90%;" onclick="showModal('${contents.care_name}','${contents.care_q1}','${contents.care_a1}','${contents.care_q2}','${contents.care_a2}','${contents.care_q3}','${contents.care_a3}','${contents.care_food}')">${contents.care_name}</button>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>

		<!-- health -->
		<div id="healthtab" class="tab-pane fade" style="height: 100%; width: 90%;">
			<table style="border: 1px solid gold; height: 70%; width: 100%">
				<tr>
					<c:forEach items="${healthList }" var="contents">
						<td class="listitems" style="padding: 4px;">
							<button type="button" style="width: 80%; height: 90%;" onclick="showModal('${contents.care_name}','${contents.care_q1}','${contents.care_a1}','${contents.care_q2}','${contents.care_a2}','${contents.care_q3}','${contents.care_a3}','${contents.care_food}')">${contents.care_name}</button>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<!-- mental -->
		<div id="mentaltab" class="tab-pane fade" style="height: 100%; width: 90%;">
			<table style="border: 1px solid gold; height: 70%; width: 100%">
				<tr>
					<c:forEach items="${mentalList }" var="contents">
						<td class="listitems" style="padding: 4px;">
							<button type="button" style="width: 80%; height: 90%;" onclick="showModal('${contents.care_name}','${contents.care_q1}','${contents.care_a1}','${contents.care_q2}','${contents.care_a2}','${contents.care_q3}','${contents.care_a3}','${contents.care_food}')">${contents.care_name}</button>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" style="height: 100vh;">

		<div class="modal-dialog" style="width: 65%; height: 60%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="title"></h4>
				</div>
				<div class="modal-body" style="text-align: center; float: left; height: 80vh;">
					<table style="height: 30%;">
						<tr>
							<td style="width: 45%; height: 20%; border-top: 2px solid purple;">
								<p id="contentq1" style="font-size: 2.5em;"></p>
							</td>
						</tr>
						<tr>
							<td style="border-bottom: 1px solid gold">
								<p id="contenta1" style="font-size: 1.5em;"></p>
							</td>
						</tr>
						<tr>
							<td style="width: 45%; height: 20%; border-top: 1px solid purple;">
								<p id="contentq2" style="font-size: 2.5em;"></p>
							</td>
						</tr>
						<tr>
							<td style="border-bottom: 1px solid gold">
								<p id="contenta2" style="font-size: 1.5em;"></p>
							</td>
						</tr>
						<tr>

							<td style="width: 45%; height: 20%; border-top: 1px solid purple;">
								<p id="contentq3" style="font-size: 2.5em;"></p>
							</td>
						</tr>
						<tr>
							<td style="border-bottom: 1px solid gold">
								<p id="contenta3" style="font-size: 1.5em;"></p>
							</td>
						</tr>
						<tr>
							<td><p id="goodfood" style="font-size: 2.5em;"></td>
						</tr>
						<tr>
							<td style="border-bottom: 3px solid purple">
								<p id="foodcontent" style="font-size: 1.5em;"></p>
							</td>
						</tr>
					</table>
					<canvas id="foodchart" style="height: 37%; width: 37%;"></canvas>
				</div>

				<div class="modal-footer">
					<button type="button" style="display: none;" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function showModal(care_name, care_q1, care_a1, care_q2, care_a2, care_q3,
			care_a3, care_food) {
		//얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다..  
		//제목
		$("#title").html(care_name);
		//이미지

		//$("#content1").attr("src", "/resources/"+img);
		$("#contentq1").html(care_q1);
		$("#contenta1").html(care_a1);

		$("#contentq2").html(care_q2);
		$("#contenta2").html(care_a2);

		$("#contentq3").html(care_q3);
		$("#contenta3").html(care_a3);

		$("#goodfood").html(care_name + "에 좋은 음식");
		$("#foodcontent").html(care_food);
		//modal을 띄워준다.  

		$("#myModal").modal('show');
	}

	function bodyclick(str) {
		$("#tit").html(str);
		$("#bodytab").addClass("in active");
		$("#healthtab").removeClass("in active");
		$("#mentaltab").removeClass("in active");
	}

	function healthclick(str) {
		$("#tit").html(str);
		$("#bodytab").removeClass("in active");
		$("#healthtab").addClass("in active");
		$("#mentaltab").removeClass("in active");
	}

	function mentalclick(str) {
		$("#tit").html(str);
		$("#bodytab").removeClass("in active");
		$("#healthtab").removeClass("in active");
		$("#mentaltab").addClass("in active");
	}

	var shown = 0;
	var slides = $(".slides li");

	$(function() {
		$('.links a').click(function(e) {
			e.preventDefault();
			var h = $(".slides").width();
			var clicked = $('.links a').index(this);
			var toShowSlide = slides.eq(clicked);
			var toHideSlide = slides.eq(shown);
			if (clicked > shown) {
				toHideSlide.animate({
					"left" : "-" + h + "px"
				}, "slow");
				toShowSlide.css({
					"left" : h + "px"
				}).show().animate({
					"left" : 0
				}, "slow");
				shown = clicked;
			} else if (clicked < shown) {
				toHideSlide.animate({
					"left" : h + "px"
				}, "slow");
				toShowSlide.css({
					left : "-" + h + "px"
				}).show().animate({
					"left" : 0
				}, "slow");
				shown = clicked;
			}
		});

		$(window)
				.bind(
						'mousewheel DOMMouseScroll',
						function(event) {
							if (slides.filter(":animated").length > 0) {
								return;
							} //애니메이션 진행 중에 발생한 휠은 무시
							if (event.originalEvent.wheelDelta > 0
									|| event.originalEvent.detail < 0) {
								// scroll up
								if (shown > 0) { //무한 반복되길 원하면 (shown >= 0)
									$('.links a').eq(shown - 1).triggerHandler(
											"click");
								}
							} else {
								// scroll down
								if (shown < slides.length - 1) {
									$('.links a').eq(shown + 1).triggerHandler(
											"click");
								}
								//무한 반복되길 원하면 아래 3줄 주석제거
								// 			else {
								// 				$('.links a').eq(0).triggerHandler("click");
								// 			}				
							}
						});

	});
</script>
</html>