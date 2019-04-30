<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
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
*{
	font-family: 'Stylish', sans-serif;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<br>
	<br>
	<br>
	<div class="container">
		<section class="main-container">
			<h1 style="text-align: center;">찜 리스트</h1>
			<div class="container">
			<c:forEach items="${zzimList}" var="content">
	
					<div class="col-md-3">
						<div class="thumnail">
							<div class="hovereffect">
								<img class="img-responsive" src="/resources/${content.img}" alt=""
									style="width:100%">
								<div class="overlay">
									<h2 style="margin: 0; margin-top: 10px;">
										${content.name}<br>${content.maker}
									</h2>
								</div>
							</div>
						</div>
					</div>

			</c:forEach>
			</div>
		</section>
		
		<br>
		<div class="container" style="margin-top: 5%">
			<h2 style="text-align: center">찜 식품 영양 정보</h2>
			<br><br>
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