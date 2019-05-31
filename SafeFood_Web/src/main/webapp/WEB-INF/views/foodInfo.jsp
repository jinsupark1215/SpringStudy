<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 정보</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Stylish"
	rel="stylesheet">
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
	});
	function fresearch(keyword) {
		var searchCondition = document.getElementById("searchCondition").value;
		location.href = "/food/search?searchCondition=" + searchCondition
				+ "&searchWord=" + keyword;
	}

	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchWord = document.getElementById("searchWord").value;
		location.href = "/food/search/?searchCondition=" + searchCondition
				+ "&searchWord=" + searchWord;
	}

	$(document).ready(function() {
		$("#searchWord").keypress(function(e) {
			if (e.which == 13) {
				search();
			}
		});
	});
</script>
<style type="text/css">
* {
	font-family: 'Stylish', sans-serif;
}

.wrap {
	width: auto;
	white-space: nowrap;
	overflow: auto;
	overflow-x: scroll;
}

.content {
	border-radius: 45px;
	padding: 1%;
	background-color: aliceblue;
}

.body {
	padding-left: 2%;
	padding-right: 2%;
}

.data {
	margin-bottom: 15px;
}

.prod_box {
	position: relative;
	float: left;
	margin: 2%;
	width: 20%;
	height: 50%;
	padding: 30px 20px 25px;
	border: 1px solid #d6d6d6;
	box-shadow: 0 2px 0 #eaeaea;
	background: #fff;
	transition: background 0.5s linear;
}

.prod_box:hover {
	background-color: #676565;
	color: #fff;
}

.prod_box:hover p {
	background-color: #000000;
	opacity: 0.9;
}

p {
	background-color: #fff;
}

img {
	vertical-align: middle;
	transition: background 0.5s linear;
}

.prod_box>.img img {
	width: 100%;
}

.autotitle {
	font-size: 90%;
}

.main-container {
	padding: 40px;
}

.bodyclass {
	margin-left: 15%;
	margin-right: 15%;
}

.nav>li {
	width: 10%;
}

.opti {
	width: 100%;
	margin: auto;
	opacity: 0;
}

.prod_box:hover .opti {
	transition: .5s ease;
	opacity: 1 !important;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<section>
		<div class="bodyclass">

			<div class="data image-box style-3-b" style="position: relative;">
				<div style="height: 61px;"></div>
				<h1 style="text-align: center">섭취 식품 목록</h1>

				<div class="jumbotron"
					style="background-color: #353535; width: 100%; z-index: 2; padding: 20px;"
					align="center">
					<div class="container-fluid">
						<form class="form-inline" id="frm">
							<input style="VISIBILITY: hidden; WIDTH: 0px"> <input
								type="hidden" id="code" value='code' />
							<div class="form-group">
								<label style="color: white;">검색 조건</label> <select
									class="form-control"
									style="background-color: #8C8C8C; color: white; font-weight: bold; margin-left: 10px"
									id="searchCondition">
									<option value="name">상품명</option>
									<option value="maker">제조사</option>
									<option value="material">원재료</option>
									<option value="foodtype">식품타입</option>
								</select>
							</div>
							<div class="form-group ml-1" style="margin-left: 20px">
								<label style="color: white;">검색 단어</label> <input type="text"
									class="form-control" id="searchWord"
									style="background-color: #8C8C8C; margin-left: 10px">
								<button type="button" class="btn btn-info" id="searchBtn"
									style="margin-left: 10px" onclick="search()">검색</button>
							</div>
							<div>
								<h4>
									<span style="color: #01A9DB;">자주 검색한 단어 : </span>
									<c:forEach items="${freList }" var="freKeyword">
										<a href="#" onclick="fresearch('${freKeyword.searchWord}')">${freKeyword.searchWord}</a>
									</c:forEach>
								</h4>
							</div>
						</form>
					</div>
				</div>


				<div class="wrap" style="z-index: 1">

					<ul class="nav nav-tabs" id="navtabs">
						<li class="active;"><a data-toggle="tab" id="foodall"
							href="#home">전체</a></li>
						<li class=""><a data-toggle="tab" id="foodMain" href="#main">메인</a></li>
						<li class=""><a data-toggle="tab" id="foodDrink"
							href="#drink">음료</a></li>
						<li class=""><a data-toggle="tab" id="foodDessert"
							href="#dessert">간식</a></li>
					</ul>

					<div class="tab-content">

						<div id="home" class="tab-pane fade in active">
							<h3>ALL LIST</h3>
							<c:forEach items="${list}" var="content">
								<!-- item -->
								<div class="prod_box" onclick="showModal('${content.name}', '${content.img}','${content.maker}','${content.calory}','${content.material}','${content.supportpereat}','${content.calory}','${content.carbo}','${content.protein}','${content.fat}','${content.sugar}','${content.natrium}','${content.chole}','${content.fattyacid}','${content.transfat}','${content.code}')">
									<p class="img">
										<img src="/resources/${content.img }" alt="${content.name}">
									</p>
									<div class="prod_info">
										<h3 class="tit" style="text-align: center">${content.maker})<br>
											<span class="autotitle">${content.name}</span>
										</h3>

									</div>

									<div class="opti">
										<button type="button" class="btn btn-info pull-left"
											style="width: 100%;"
											onclick="location.href='/eat/addFood.do?code=${content.code}&quan=1&flag=yes'">
											<span class="glyphicon glyphicon-cutlery"></span> 추가
										</button>
									</div>
								</div>
								<!-- item -->

							</c:forEach>

						</div>

						<!-- 메인 -->
						<div id="main" class="tab-pane fade">
							<h3>Main</h3>
							<c:forEach items="${list}" var="content">
								<!-- item -->
								<c:if test="${content.foodtype eq 1}">
									<div class="prod_box" onclick="showModal('${content.name}', '${content.img}','${content.maker}','${content.calory}','${content.material}','${content.supportpereat}','${content.calory}','${content.carbo}','${content.protein}','${content.fat}','${content.sugar}','${content.natrium}','${content.chole}','${content.fattyacid}','${content.transfat}','${content.code}')">
										<p class="img">
											<img src="/resources/${content.img }" alt="${content.name}">
										</p>
										<div class="prod_info">
											<h3 class="tit" style="text-align: center">${content.maker})<br>
												<span class="autotitle">${content.name}</span>
											</h3>

										</div>

										<div class="opti">
											<button type="button" class="btn btn-info pull-left"
												style="width: 100%;"
												onclick="location.href='/eat/addFood.do?code=${content.code}&quan=1&flag=yes'">
												<span class="glyphicon glyphicon-cutlery"></span> 추가
											</button>
										</div>
									</div>
									<!-- item -->
								</c:if>
							</c:forEach>

						</div>
						<!-- 음료 -->
						<div id="drink" class="tab-pane fade">
							<h3>DRINK</h3>
							<c:forEach items="${list}" var="content">
								<!-- item -->
								<c:if test="${content.foodtype eq 2}">
									<div class="prod_box" onclick="showModal('${content.name}', '${content.img}','${content.maker}','${content.calory}','${content.material}','${content.supportpereat}','${content.calory}','${content.carbo}','${content.protein}','${content.fat}','${content.sugar}','${content.natrium}','${content.chole}','${content.fattyacid}','${content.transfat}','${content.code}')" >
										<p class="img">
											<img src="/resources/${content.img }" alt="${content.name}">
										</p>
										<div class="prod_info">
											<h3 class="tit" style="text-align: center">${content.maker})<br>
												<span class="autotitle">${content.name}</span>
											</h3>

										</div>

										<div class="opti">
											<button type="button" class="btn btn-info pull-left"
												style="width: 100%;"
												onclick="location.href='/eat/addFood.do?code=${content.code}&quan=1&flag=yes'">
												<span class="glyphicon glyphicon-cutlery"></span> 추가
											</button>
										</div>
									</div>
								</c:if>
								<!-- item -->

							</c:forEach>

						</div>
						<!-- 디저트(간식) -->
						<div id="dessert" class="tab-pane fade">
							<h3>DESSSERT</h3>
							<c:forEach items="${list}" var="content">
								<!-- item -->
								<c:if test="${content.foodtype eq 3}">
									<div class="prod_box" onclick="showModal('${content.name}', '${content.img}','${content.maker}','${content.calory}','${content.material}','${content.supportpereat}','${content.calory}','${content.carbo}','${content.protein}','${content.fat}','${content.sugar}','${content.natrium}','${content.chole}','${content.fattyacid}','${content.transfat}','${content.code}')">
										<p class="img">
											<img src="/resources/${content.img }" alt="${content.name}">
										</p>
										<div class="prod_info">
											<h3 class="tit" style="text-align: center">${content.maker})<br>
												<span class="autotitle">${content.name}</span>
											</h3>

										</div>

										<div class="opti">
											<button type="button" class="btn btn-info pull-left"
												style="width: 100%;"
												onclick="location.href='/eat/addFood.do?code=${content.code}&quan=1&flag=yes'">
												<span class="glyphicon glyphicon-cutlery"></span> 추가
											</button>
										</div>
									</div>
								</c:if>
								<!-- item -->

							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog"
		style="height: 100vh;">

		<div class="modal-dialog" style="width: 40%; height: 60%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="title"></h4>
				</div>
				<div class="modal-body"
					style="text-align: center; float: left; height: 80vh;">
					<table style="height: 30%;">
						<tr>
							<td style="width: 45%; height: 350px;"><img
								class="img-responsive" id="modalimg" src=""
								style="height: 100%; width: 100%;"></td>
							<td>
								<p id="content"></p>
							</td>
						</tr>
					</table>
					<canvas id="foodchart" style="height: 37%; width: 37%;"></canvas>
				</div>

				<div class="modal-footer">
				<button type="button" id="addbtn" class="btn btn-info pull-left"
												style="width: 100%;"
												onclick="">
												<span class="glyphicon glyphicon-cutlery"></span> 추가
											</button>
					<button type="button" style="display: none;" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
	
			<script type="text/javascript">
		function drawChart2(  sup, cal, car, prot, fat, sugar, nat, chole, fat, tran) {
			new Chart($("#foodchart"), {
				type : "doughnut",
				data : {
					labels : [ "탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤",
							"포화 지방산", "트랜스지방" ],
					datasets : [ {
						label : '# of Votes',
						data : [car,
							prot,
							fat,
							sugar,
							nat,
							chole,
							fat,
							tran],
						backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)',
								'rgba(65, 200, 64, 0.2)', 'rgba(97, 70, 64, 0.2)',
								'rgba(200, 120, 64, 0.2)' ],
						borderColor : [ 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
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
		
		

	function showModal(name, img, maker, calory, material, sup, cal, car, prot, fat, sugar, nat, chole, fat, tran, code){
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		drawChart2( sup, cal, car, prot, fat, sugar, nat, chole, fat, tran);
		//얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다..  

	    $("#title").html(maker + " )  " +name);
		$("#modalimg").attr("src", "/resources/"+img);
		$("#addbtn").attr("onclick","location.href='/eat/addFood.do?code="+code+"&quan=1&flag=yes'");
	    $("#content").html(material);
	    //modal을 띄워준다.  

	    $("#myModal").modal('show');
	}
</script>
	
</body>



</html>