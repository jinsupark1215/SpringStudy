<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.*,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 섭취 정보</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/vue"></script>

<script type="text/javascript">
var start;
var end;

$(document).ready(function() {
	$(".nav-tabs a").click(function() {
		$(this).tab('show');
	});
});

$(function(){
	drawChart();
	
	$("#submitBtn").on('click', function(source) {
		start = $("#start").val();
		end = $("#end").val();
		var todayArray = getRecentDate().split('-');
		
		var startArray = start.split('-');
        var endArray = end.split('-');   

        var today = new Date(todayArray[0], todayArray[1], todayArray[2]);
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);

        if(today.getTime() < start_date.getTime()){
        	alert("시작날짜는 현재 날짜보다 크면 안됩니다.");
        	source.preventDefault()
        	return;
        }
        
        if(start_date.getTime() > end_date.getTime()) {
            alert("종료날짜보다 시작날짜가 작아야합니다.");
            source.preventDefault()
            return;
        }
		
        $("#form").submit();
	});
	
});


function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}

function drawChart() {
	new Chart($("#chart"), {
		type : "doughnut",
		data : {
			labels : [ "탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤",
					"포화 지방산", "트랜스지방" ],
			datasets : [ {
				label : '# of Votes',
				data : [${carbo},
					${protein},
					${fat},
					${sugar},
					${natrium},
					${chole},
					${fattyacid},
					${transfat}],
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

</script>
<style type="text/css">
* {
	font-family: 'Stylish', sans-serif;
}

#userInfo {
	background-image: url("/resources/img/cake.jpg");
	color: white;
	font-size: 3em;
	font-weight: bold;
	text-align: center;
}

.modal-backdrop fade in {
	position: fixed;
}

.body {
	border-radius: 25px;
	background-color: antiquewhite;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
	padding-left: 20px;
	padding-bottom: 20px;
}

#form {
	padding: 20px;
}

#dateLabel {
	margin-right: 10px;
}

.nav>li {
	width: 10%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container" style="margin-top: 4%; width: 95%;">
		<div class="container" style="height: 90vh; width: 100%">
			<div class="row" id="userInfo">${name}님의 섭취정보</div>
			<div class="row" style="position: absolute; width: 50%; top: 14%; left: 5%;">
				<h2>섭취식품 영양 정보</h2>
			</div>
			<div class="row" style="height: 40%; width: 65%; position: absolute; top: 22%;">
				<div class="col-md-7" style="height: 100%; position: relative;">
					<canvas id="chart" style="height: 100%; width: auto;"></canvas>
				</div>
			</div>

			<div class="row">
				<div style="border: 1px solid gold;">
					<div class="col-md-5" style="height: 100%; width: 40%; position: absolute; top: 60%; border-top: 1px solid gold;">
						<div class="row" style="border-top: 1px solid purple;">
							<h3>영양소 정보</h3>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">칼로리</div>
							<div class="col-md-9" id="kcal">${calory }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">탄수화물</div>
							<div class="col-md-9" id="tan">${carbo }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">단백질</div>
							<div class="col-md-9" id="dan">${protein }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">지방</div>
							<div class="col-md-9" id="fat">${fat }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">당류</div>
							<div class="col-md-9" id="dang">${sugar }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">나트륨</div>
							<div class="col-md-9" id="na">${natrium }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">콜레스테롤</div>
							<div class="col-md-9" id="col">${chole }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">포화 지방산</div>
							<div class="col-md-9" id="po">${fattyacid }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
						<div class="row">
							<div class="col-md-3">트랜스지방</div>
							<div class="col-md-9" id="trans">${transfat }</div>
						</div>
						<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					</div>
				</div>

				<div class="foods"
					style="width: 55%; position: relative; float: right;">

					<div class="tab-content">
						<!-- 전체 먹은 음식 관리 -->
						<div id="eatall" class="tab-pane fade in active">
							<form action="/eat/myEat" method="post" name="form" id="form">
								<label class="col-md-3"
									style="font-size: 2em; font-weight: bold">검색 기간 설정</label>
								<div class="col-md-3">
									<label for="start" class="dateLabel">검색 시작일</label>
									<c:choose>
										<c:when test="${start eq null}">
											<input type="date" name="start" id="start">
										</c:when>
										<c:otherwise>
											<input type="date" name="start" id="start" value="${start}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-3">
									<label for="end" class="dateLabel">검색 종료일</label>
									<c:choose>
										<c:when test="${end eq null}">
											<input type="date" name="end" id="end">
										</c:when>
										<c:otherwise>
											<input type="date" name="end" id="end" value="${end}">
										</c:otherwise>
									</c:choose>
								</div>
								<button type="button" class="btn btn-info" id="submitBtn">
									<span class="glyphicon glyphicon-search"></span> 검색
								</button>
							</form>
							<section class="row" id="maincon">
								<div style="height: 15px;"></div>

								<!-- 길이를 먼저 지정해 주는 코드 -->
								<c:set var="length" value="${fn:length(eatList)/16+1}"></c:set>

								<!-- navigation tab 설정 -->
								<ul class="nav nav-tabs">
									<c:forEach var="page" begin="1" end="${length}" step="1"
										varStatus="status">
										<li id="page${status.index}"
											class=<c:if test="${status.index eq 1}">active</c:if>><a
											id="sector${status.index}" href="#chap${status.index}">${status.index}</a>
										</li>
									</c:forEach>
								</ul>

								<!-- tab content -->
								<div class="tab-content">
									<c:forEach var="content" begin="1" end="${length}" step="1"
										varStatus="status">
										<div style="height: 15px;"></div>
										<div id="chap${status.index}"
											class="tab-pane fade <c:if test="${status.index eq 1}">in active</c:if>">
											<table style="height: 60%; width: 90%; margin: auto;"
												border=1>
												<c:forEach var="card_index" items="${eatList}"
													begin="${(status.index-1)*16}"
													end="${(status.index-1)*16+15}" varStatus="indexStatus">
													<c:if test="${(indexStatus.index%4) eq 0}">
														<tr>
													</c:if>
													<!-- 카드 내용 -->
													<td style="width: 22%; height: 20%; padding: 10px;">
														<div class="hovereffect"
															style="height: auto; width: auto;">
															<img class="img-responsive"
																src="/resources/${card_index.value.img}"
																alt="${card_index.value.name}"
																style="height: 50%; width: 40%;">

															<div class="overlay"
																onclick="show('${card_index.value.name}', '${card_index.value.img}','${card_index.value.maker}',
																'${card_index.value.calory}','${card_index.value.material}','${card_index.value.supportpereat}','${card_index.value.calory}',
																'${card_index.value.carbo}','${card_index.value.protein}','${card_index.value.fat}','${card_index.value.sugar}','${card_index.value.natrium}',
																'${card_index.value.chole}','${card_index.value.fattyacid}','${card_index.value.transfat}')">
																<h2 style="margin: 0; margin-top: 5px;">
																	${card_index.value.name}<br>${card_index.value.maker}
																</h2>
																<!--  Modal 창 -->
															</div>
														</div>
														<table style="width: 100%">
															<tr>
																<td style="margin-left: 10%;">
																	이름 : ${card_index.value.name} <br>
																	날짜 :${card_index.key.date}
																</td>
																<td style="float: right; margin-right: 20%;">
																	<h5>${card_index.key.count}개</h5>
																</td>
															</tr>
														</table>
														<div style="text-align: center">
															<button type="button" class="btn btn-danger" onclick="location.href='/eat/delete?code=${card_index.value.code}&date=${card_index.key.date}&today=no'" style="width: 50%" ><span class="glyphicon glyphicon-minus"></span> 삭제</button>
														</div>
													</td>
													<c:if test="${(indexStatus.index%4) eq 3}">
														</tr>
													</c:if>
												</c:forEach>

											</table>
										</div>
										<table></table>
									</c:forEach>
								</div>

								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog" style="height:100vh;">

									<div class="modal-dialog"
										style="width: 40%; height: 60%;">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title" id="title"></h4>
											</div>
											<div class="modal-body"
												style="text-align: center; float: left; height:80vh;">
												<table style="height:30%;">
													<tr>
														<td style="width:45%; height:350px;"><img class="img-responsive" id="modalimg" src=""
															style="height: 100%; width: 100%;"></td>
														<td>
															<p id="content"></p>
														</td>
													</tr>
												</table>
												<canvas id="foodchart" style="height: 37%; width: 37%;"></canvas>
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>

								<!-- 추천 창 -->
								<div style="border: 1px solid gold;"></div>
								<div style="border: 1px solid purple;"></div>

							</section>

						</div>

					</div>
				</div>
			</div>
		</div>
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
		
		

	function show(name, img, maker, calory, material, sup, cal, car, prot, fat, sugar, nat, chole, fat, tran){
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		drawChart2( sup, cal, car, prot, fat, sugar, nat, chole, fat, tran);
		//얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다..  

	    $("#title").html(maker + " )  " +name);
		$("#modalimg").attr("src", "/resources/"+img);
	    $("#content").html(material);
	    //modal을 띄워준다.  

	    $("#myModal").modal('show');
	}
</script>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>