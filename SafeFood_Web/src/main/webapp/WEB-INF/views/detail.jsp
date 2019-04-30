<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.ArrayList,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품 상세</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	drawChart();
});

function add(){
	var quantity = $("#quan").val();
	
	$("#form").attr("action", "/eat/addFood");
	$("#form").submit();
}

function drawChart() {
	new Chart($("#chart"), {
		type : "doughnut",
		data : {
			labels : [ "칼로리", "탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤",
					"포화 지방산", "트랜스지방" ],
			datasets : [ {
				label : '# of Votes',
				data : [${food.calory},
					${food.carbo},
					${food.protein},
					${food.fat},
					${food.sugar},
					${food.natrium},
					${food.chole},
					${food.fattyacid},
					${food.transfat}],
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

.btn-circle.btn-xl {
	width: 70px;
	height: 70px;
	padding: 10px 16px;
	font-size: 24px;
	line-height: 1.33;
	border: 0px;
	border-radius: 35px;
	background-color: #F5F5F5;
}

hr {
	margin-top: 10px;
	margin-bottom: 10px;
}

#footer {
	margin-top: 5%;
	background-color: #fafafa;
	padding-left: 10%;
	padding-top: 1%;
	padding-bottom: 1%
}

#footer li {
	height: 30px;
}

#copyright {
	background-color: #f5f5f5;
	padding-top: 25px;
	padding-bottom: 25px;
	margin: 0;
	text-align: center;
	color: #999999;
}

#menu {
	margin-top: 20px;
	text-align: center;
}

#menu a {
	text-decoration: none;
	color: black;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container" style="text-align: center; margin-top: 20px;">
		<h1 style="font-weight: bold">제품 정보</h1>
	</div>
	<div class="col-md-offset-4 col-md-4" style="text-align: center;">
		<button type="button" class="btn btn-default btn-circle btn-xl" disabled>
			<i class="glyphicon glyphicon-shopping-cart"></i>
		</button>
	</div>
	<div class="container">
		<div class="col-md-3">
			<img id="foodImg" src="/resources/${food.img }" width="200px" height="200px">
		</div>
		<div class="col-md-offset-1 col-md-8" id="info">
			<hr>
			<div class="row">
				<div class="col-md-2">제품명</div>
				<div class="col-md-10" id="name">${food.name }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2">제조사</div>
				<div class="col-md-10" id="maker">${food.maker }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2">원재료</div>
				<div class="col-md-10" id="material">${food.material }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2">알레르기 성분</div>
				<div class="col-md-10" id="aller">${allergy}</div>
			</div>
			<hr>
			<div class="col-md-3" style="padding: 0">
				<form action="#" method="get" id="form">
					<input type="hidden" name="code" value="${food.code}">
					<div class="form-group">
						<label for="quan">Quantity</label> <input type="number" class="form-control" name="quan" id="quan" value="1" min="1">
					</div>
				</form>

				<div class="btn-group">
					<button type="button" class="btn btn-info" onclick="add()">
						<span class="glyphicon glyphicon-cutlery" style="margin-right: 15px"></span>추가
					</button>
					<c:choose>
						<c:when test="${zzimlist.contains(food.code)}">
							<button type="button" class="btn btn-danger" onclick="location.href='../zzim/del?code=${food.code}'">
								<span class="glyphicon glyphicon-minus"></span> 찜 해제
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-info" onclick="location.href='../zzim/add?code=${food.code}'">
								<span class="glyphicon glyphicon-plus"></span> 찜
							</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 5%">
		<h3>영양 정보</h3>
		<div class="col-md-6">
			<canvas id="chart" height="240"></canvas>
		</div>
		<div class="col-md-6">
			<hr>
			<div class="row">
				<div class="col-md-3">일일 제공량</div>
				<div class="col-md-9" id="oneday">${food.supportpereat }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">칼로리</div>
				<div class="col-md-9" id="kcal">${food.calory }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">탄수화물</div>
				<div class="col-md-9" id="tan">${food.carbo }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">단백질</div>
				<div class="col-md-9" id="dan">${food.protein }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">지방</div>
				<div class="col-md-9" id="fat">${food.fat }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">당류</div>
				<div class="col-md-9" id="dang">${food.sugar }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">나트륨</div>
				<div class="col-md-9" id="na">${food.natrium }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">콜레스테롤</div>
				<div class="col-md-9" id="col">${food.chole }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">포화 지방산</div>
				<div class="col-md-9" id="po">${food.fattyacid }</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">트랜스지방</div>
				<div class="col-md-9" id="trans">${food.transfat }</div>
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>