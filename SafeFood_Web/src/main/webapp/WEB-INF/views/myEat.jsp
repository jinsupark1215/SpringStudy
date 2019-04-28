<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.*,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 섭취 정보</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	drawChart();
});

function drawChart() {
	new Chart($("#chart"), {
		type : "doughnut",
		data : {
			labels : [ "칼로리", "탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤",
					"포화 지방산", "트랜스지방" ],
			datasets : [ {
				label : '# of Votes',
				data : [${calory},
					${carbo},
					${protein},
					${fat},
					${sugar},
					${natrium},
					${chole},
					${fattyacid},
					${transfat}],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(65, 200, 64, 0.2)', 'rgba(97, 70, 64, 0.2)',
						'rgba(200, 120, 64, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)', 'rgba(65, 200, 64, 1)',
						'rgba(97, 70, 64, 1)', 'rgba(200, 120, 64, 1)' ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
}
</script>
<style type="text/css">
	#userInfo{
		background-color: purple;
		color: white;
		font-size : 3em;
		font-weight : bold;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class = "row" id="userInfo">
			${requestScope.name}님의 섭취정보
		</div>
		<section class="main-container">
			<c:forEach items="${eatList}" var="content">
				<div class="image-box style-3-b">
					<div class="row">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="hovereffect">
								<img class="img-responsive" src="/${content.key.img}" alt=""
									width="200px">
								<div class="overlay">
									<h2>
										${content.key.name}<br>${content.key.maker}
									</h2>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-8 col-xl-9">
							<div class="body">
								<h3 class="title">
									<br>
									섭취 식품 명 : ${content.key.name}<br><br>
									섭취 식품 개수 : ${content.value}
								</h3>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
		<div class="container" style="margin-top: 5%">
		<h3>영양 정보</h3>
		<div class="col-md-6">
			<canvas id="chart" height="240"></canvas>
		</div>
		<div class="col-md-6">
			<hr>
			<div class="row">
				<div class="col-md-3">칼로리</div>
				<div class="col-md-9" id="kcal">${calory }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">탄수화물</div>
				<div class="col-md-9" id="tan">${carbo }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">단백질</div>
				<div class="col-md-9" id="dan">${protein }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">지방</div>
				<div class="col-md-9" id="fat">${fat }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">당류</div>
				<div class="col-md-9" id="dang">${sugar }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">나트륨</div>
				<div class="col-md-9" id="na">${natrium }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">콜레스테롤</div>
				<div class="col-md-9" id="col">${chole }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">포화 지방산</div>
				<div class="col-md-9" id="po">${fattyacid }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">트랜스지방</div>
				<div class="col-md-9" id="trans">${transfat }</div>
			</div>
			<hr>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>