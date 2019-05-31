<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SafeFood | 상품 정보 목록</title>
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Stylish" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

<style type="text/css">
* {
	font-family: 'Stylish', sans-serif;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

.carousel-indicators .active {
	width: 12px;
	height: 12px;
	margin: 0;
	background-color: #0396ff;
}

td {
	width: 33%;
	height: 33%;
	margin: 1px;
}

.primary-index {
	border-style: none;
	padding: 0px;
	width: 100%;
	height: 100%;
	transition: .5s ease;
}

.primary-index:hover .colordiv {
	transition: .5s ease;
	font-size: 1.5em;
	background: rgba(255, 255, 255, 0.5) !important;  
}

.colordiv {
	width: 100%;
	height: 100%;
	
}


.colordiv .p {
	vertical-align: middle;
}

.colorbtn {
	background-size: cover;
	height: 100%;
}

.red {
	background-image: url("/resources/img/red.jpg");
}

.brown {
	background-image: url("/resources/img/brown.jpg");
}

.yellow {
	background-image: url("/resources/img/yellow.jpg");
}

.blue {
	background-image: url("/resources/img/blue.jpg");
}

.green {
	background-image: url("/resources/img/green.jpg");
}

.purple {
	background-image: url("/resources/img/purple.jpg");
}

.white {
	background-image: url("/resources/img/white.jpg");
}

.jumbotron {
	margin-left: 6%;
	margin-right: 10%;
	width: 89%;
	height: 37%;
	background-image: url("/resources/img/OrangeWallpaper.jpg");
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="height: 105vh; width: 90% margin:auto;">
		<div style="height: 120px;"></div>
		<div class="jumbotron"
			style="background-color: #FAAC58; margin-bottom: 0; padding-top: 80px;"
			align="center">
			<div style="color: white;">
				<h1 style="color: black;">WHAT WE PROVIDE</h1>


				<div style="height: 100%; background-color: rgba(0, 0, 0, 0.7);">
					<div style="width: 100%; height: 30px;"></div>
					<p style="font-size: 2em;">
						<span style="color: #FF9800;">건강한 삶</span>을 위한 먹거리 프로젝트
					</p>
				</div>


			</div>
		</div>
		<div style="height: 5%;"></div>

		<!-- Crousel -->

		<div class="container"
			style="width: 90%; height: 50%; margin-bottom: 10%;">
			<div style="width: 50%; float: left;">
				<h2 style="text-align: center">가장 많이 섭취한 식품</h2>
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					style="width: 80%; margin-right: auto; margin-left: auto;">
					<!-- Indicators -->
					<ol class="carousel-indicators">

						<c:forEach items="${bestEatList}" varStatus="bestEat">
							<c:choose>
								<c:when test="${bestEat.index < 1}">
									<li data-target="#myCarousel" data-slide-to="${bestEat.index}" class="item${bestEat.index} active"
										style="border: 1px solid #0396ff;"></li>
								</c:when>
								<c:otherwise>
									<li data-target="#myCarousel" data-slide-to="${bestEat.index}" class="item${bestEat.index}"
										style="border: 1px solid #0396ff;"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${bestEatList}" var="bestEat" varStatus="cnt">
							<c:choose>
								<c:when test="${cnt.count < 2 }">
									<div class="item active">
										<img src="/resources/${bestEat.value.img}"
											alt="
							${bestEat.value.name}" width="200" height="200">
										<div class="carousel-caption">
											<h3>${bestEat.value.name}</h3>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="item">
										<img src="/resources/${bestEat.value.img}"
											alt="
							${bestEat.value.name}" width="200" height="200">
										<div class="carousel-caption">
											<h3>${bestEat.value.name}</h3>
										</div>
									</div>
								</c:otherwise>

							</c:choose>

						</c:forEach>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" role="button"
						style="color: black;"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" role="button"
						style="color: black;"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div style="width: 50%; float: right; padding: 0.2%; height: 100%">
				<div>
					<h2>INDEX</h2>
				</div>
				<!-- Buttons -->
				<div style="height: 80%;">
					<table
						style="height: 120%; width: 100%; border-collapse: separate; border-spacing: 10px">
						<tr>
							<td><button type="button"
									class=" primary-index red colorbtn" style="font-size: 2em;">
									<div class="colordiv"
										style="background-color: rgba(220, 97, 97, 0.7); transition: .5s ease;"
										onclick="location.href='/board/list'">공지 사항</div>
								</button></td>
							<td><button type="button"
									class="primary-index yellow colorbtn " style="font-size: 2em;">
									<div class="colordiv" style="background-color: #ffc10780;  transition: .5s ease;"
										onclick="location.href='/food/goFoodInfo'">상품 정보</div>
								</button></td>
							<td>
								<button type="button" class=" primary-index green colorbtn"
									style="font-size: 1.5em;">
									<div class="colordiv" style="background-color: #8bc34a99;  transition: .5s ease;"
										onclick="location.href='/eat/bestEat'">베스트 섭취 정보</div>
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" class=" primary-index blue colorbtn"
									style="font-size: 1.5em;">

									<div class="colordiv" style="background-color: #00bcd4b3;  transition: .5s ease;"
										onclick="location.href='/eat/myEat'">내 섭취 정보</div>
								</button>
							</td>
							<td>
								<button type="button" class=" primary-index purple colorbtn "
									style="font-size: 2em;">
									<div class="colordiv" style="background-color: #9c27b066;"
										onclick="location.href='/eat/today'">Today</div>
								</button>
							</td>
							<td>
								<button type="button" class=" primary-index white colorbtn"
									style="font-size: 2em;">
									<div class="colordiv" style="background-color: #00000066;  transition: .5s ease;"
										onclick="location.href='/resources/html/qnaList.html'">QnA</div>
								</button>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="button" class=" primary-index brown colorbtn"
									style="font-size: 2em;">
									<div class="colordiv" style="background-color: #7955489c;  transition: .5s ease;"
										onclick="location.href='/health/check'">건강 정보</div>
								</button>
							</td>
						
						
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 120px;"></div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	function fresearch(keyword) {
		var searchCondition = document.getElementById("searchCondition").value;
		location.href = "/food/search?searchCondition=" + searchCondition
				+ "&searchWord=" + keyword;
	}

	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchWord = document.getElementById("searchWord").value;
		location.href = "/food/search?searchCondition=" + searchCondition
				+ "&searchWord=" + searchWord;
	}

	$(document).ready(function() {
		$("#searchWord").keypress(function(e) {
			if (e.which == 13) {
				search();
			}
		});
	});

	/* Crousel */
	$(document).ready(function() {
		// Activate Carousel
		$("#myCarousel").carousel();

		// Enable Carousel Controls
		$(".left").click(function() {
			$("#myCarousel").carousel("prev");
		});
		$(".right").click(function() {
			$("#myCarousel").carousel("next");
		});
	});
</script>

</html>