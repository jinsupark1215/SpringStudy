<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	drawChart();
	$(".nav-tabs a").click(function() {
		$(this).tab('show');
	});
});

function drawChart() {
	new Chart($("#chart"), {
		type : "doughnut",
		data : {
			labels : [ "탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤", "포화 지방산", "트랜스지방" ],
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
#userInfo {
	background-image: url("/resources/img/cup.jpg");
	font-size: 3em;
	font-weight: bold;
	text-align: center;
	margin-bottom: 12px;
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

.modal-backdrop fade in {
	position: fixed;
}

#form {
	padding: 25px;
}

#dateLabel {
	margin-right: 10px;
}

.nav>li {
	width: 10%;
}

.progress {
	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container" style="margin-top: 4%; width: 95%;">
		<div class="container" style="height: 100vh; width: 100%">
			<div id="userInfo">오늘의 섭취정보</div>
			<div style="position: absolute; width: auto; top: 15%; left: 20%;">
				<h2>섭취식품 영양 정보</h2>
			</div>
			<div style="height: 40%; width: 70%; position: absolute; top: 21%;">
				<div class="col-md-7" style="position: relative;">
					<canvas id="chart" style="width: auto;"></canvas>
				</div>
			</div>
			<div>
				<div class="col-md-5"
					style="position: absolute; top: 59%; padding-top: 20px;">
					<div style="margin: auto; text-align: center;">
						<h3>영양소 정보</h3>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<div class="row">
						<div class="col-md-2">칼로리</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${percentage > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${percentage}%섭취
												(${calory} / ${kpd})</div>
										</c:when>
										<c:when test="${percentage >= 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${percentage}%">
												${percentage}% 섭취 (${calory} / ${kpd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${percentage}%">
												${percentage}% 섭취 (${calory} / ${kpd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div></div>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<div class="row">
						<div class="col-md-2">탄수화물</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">

									<c:choose>
										<c:when test="${carbo_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${carbo_per}%섭취
												(${carbo} / ${carbo_pd})</div>
										</c:when>
										<c:when test="${carbo_per >= 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${carbo_per}%">
												${carbo_per}% 섭취 (${carbo} / ${carbo_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${carbo_per}%">
												${carbo_per}% 섭취 (${carbo} / ${carbo_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<div class="row">
						<div class="col-md-2">단백질</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">

									<c:choose>
										<c:when test="${prot_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${prot_per}%섭취
												(${protein} / ${prot_pd})</div>
										</c:when>
										<c:when test="${prot_per > 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${prot_per}%">
												${prot_per}% 섭취 (${protein} / ${prot_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${prot_per}%">
												${prot_per}% 섭취 (${protein} / ${prot_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<!-- 지방영양소 -->
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<div class="row">

						<div class="col-md-2">지방</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${fat_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${fat_per}%섭취
												(${fat} / ${fat_pd})</div>
										</c:when>
										<c:when test="${fat_per > 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${fat_per}%">
												${fat_per}% 섭취 (${fat} / ${fat_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${fat_per}%">
												${fat_per}% 섭취 (${fat} / ${fat_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="col-md-2">
								<c:if test="${fat_per >=100}">
									<button style="width: auto;"
										onclick="showModal('${fat_care.care_name}','${fat_care.care_q1}','${fat_care.care_a1}','${fat_care.care_q2}','${fat_care.care_a2}','${fat_care.care_q3}','${fat_care.care_a3}','${fat_care.care_food}')">
										지방 과다!</button>
								</c:if>
							</div>
						</div>

					</div>

					<!-- 설탕영양소 -->
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<div class="row">
						<div class="col-md-2">당류</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${sugar_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${sugar_per}%섭취
												(${sugar} / ${sugar_pd})</div>
										</c:when>
										<c:when test="${sugar_per > 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${sugar_per}%">${sugar_per}%
												섭취 (${sugar} / ${sugar_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${sugar_per}%">
												${sugar_per}% 섭취 (${sugar} / ${sugar_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="col-md-2">
								<!-- 당류가 100퍼 이상일때 안내 내용 -->
								<c:if test="${sugar_per >= 100}">
									<button style="width: auto;"
										onclick="showModal('${sugar_care.care_name}','${sugar_care.care_q1}','${sugar_care.care_a1}','${sugar_care.care_q2}','${sugar_care.care_a2}','${sugar_care.care_q3}','${sugar_care.care_a3}','${sugar_care.care_food}')">
										과다!</button>
								</c:if>
							</div>
						</div>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<!-- 나트륨 영양소 -->
					<div class="row">
						<div class="col-md-2">나트륨</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">

									<c:choose>
										<c:when test="${nat_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${nat_per}%섭취
												(${natrium} / ${nat_pd})</div>
										</c:when>
										<c:when test="${nat_per > 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${nat_per}%">${nat_per}%섭취
												(${natrium} / ${nat_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${nat_per}%">${nat_per}%
												섭취 (${natrium} / ${nat_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-2">
									<!-- 나트륨이 100퍼 이상일때 안내 내용 -->
									<c:if test="${nat_per >= 100}">
										<button style="width: auto;"
											onclick="showModal('${nat_care.care_name}','${nat_care.care_q1}','${nat_care.care_a1}','${nat_care.care_q2}','${nat_care.care_a2}','${fat_care.care_q3}','${nat_care.care_a3}','${nat_care.care_food}')">
											과다!</button>
									</c:if>

								</div>
							</div>
						</div>

					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<!-- 콜레스테롤 영양소 -->
					<div class="row">
						<div class="col-md-2">콜레스테롤</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${chole_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${chole_per}%섭취
												(${chole} / ${chole_pd})</div>
										</c:when>
										<c:when test="${chole_per > 40}">
											<div class="progress-bar  progress-bar-striped active"
												role="progressbar" style="width:${chole_per}%">${chole_per}%섭취
												(${chole} / ${chole_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${chole_per}%">
												${chole_per}% 섭취 (${chole} / ${chole_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-2">
									<!-- 콜레스테롤이 100퍼 이상일때 안내 내용 -->
									<c:if test="${chole_per >= 100}">
										<button style="width: auto;"
											onclick="showModal('${chole_care.care_name}','${chole_care.care_q1}','${chole_care.care_a1}','${chole_care.care_q2}','${chole_care.care_a2}','${chole_care.care_q3}','${chole_care.care_a3}','${chole_care.care_food}')">
											과다!</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<!-- 포화지방산 영양소 -->
					<div class="row">
						<div class="col-md-2">포화 지방산</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${fatty_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${fatty_per}%섭취
												(${fattyacid} / ${fattyacid_pd})</div>
										</c:when>
										<c:when test="${fatty_per > 40}">
											<div class="progress-bar progress-bar-striped active"
												role="progressbar" style="width:${fatty_per}%">${fatty_per}%섭취
												(${fattyacid} / ${fatty_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${fatty_per}%">
												${fatty_per}% 섭취 (${fattyacid} / ${fatty_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-2">
									<!-- 포화지방산이 100퍼 이상일때 안내 내용 -->
									<c:if test="${fatty_per >= 100}">
										<button style="width: auto;"
											onclick="showModal('${fatty_care.care_name}','${fatty_care.care_q1}','${fatty_care.care_a1}','${fatty_care.care_q2}','${fatty_care.care_a2}','${fatty_care.care_q3}','${fatty_care.care_a3}','${fatty_care.care_food}')">
											과다!</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
					<!-- 트랜스지방 영양소 -->
					<div class="row">
						<div class="col-md-2">트랜스지방</div>
						<div class="col-md-10">
							<div class="col-md-10">
								<div class="progress" style="margin-bottom: 0">
									<c:choose>
										<c:when test="${trans_per > 100}">
											<div
												class="progress-bar progress-bar-danger progress-bar-striped active"
												role="progressbar" style="width: 100%">${trans_per}%섭취
												(${transfat} / ${trans_pd})</div>
										</c:when>
										<c:when test="${trans_per > 40}">
											<div class="progress-bar  progress-bar-striped active"
												role="progressbar" style="width:${trans_per}%">${trans_per}%섭취
												(${transfat} / ${trans_pd})</div>
										</c:when>
										<c:otherwise>
											<div class="progress-bar progress-bar-success active"
												role="progressbar" style="width:${trans_per}%">
												${trans_per}% 섭취 (${transfat} / ${trans_pd})</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<hr style="margin-top: 1%; margin-bottom: 0.5%;">
				</div>
			</div>

			<div class="foods"
				style="width: 55%; position: relative; float: right;">
				<div class="tab-pane fade in active">
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
									<table style="height: 60%; width: 90%; margin: auto;" border=1>
										<c:forEach var="card_index" items="${eatList}"
											begin="${(status.index-1)*16}"
											end="${(status.index-1)*16+15}" varStatus="indexStatus">
											<c:if test="${(indexStatus.index%4) eq 0}">
												<tr>
											</c:if>
											<!-- 카드 내용 -->
											<td style="width: 22%; height: 20%;padding: 10px;">
												<div class="hovereffect" style="height: auto; width: auto;">
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
														<td style="margin-left: 10%;">이름 :
															${card_index.value.name} <br> 날짜 :
															${card_index.key.date}
														</td>
														<td style="float: right; margin-right: 20%;">
															<h5>${card_index.key.count}개</h5>
														</td>
													</tr>
												</table>
												<div style="text-align: center">
													<button type="button" class="btn btn-danger" onclick="location.href='/eat/delete?code=${card_index.value.code}&date=${card_index.key.date}&today=yes'" style="width: 50%" ><span class="glyphicon glyphicon-minus"></span> 삭제</button>
												</div>
											</td>
											<c:if test="${(indexStatus.index%4) eq 3}">
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</c:forEach>
						</div>

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
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal2 -->
						<div class="modal fade" id="myModal2" role="dialog"
							style="height: 100vh;">

							<div class="modal-dialog" style="width: 65%; height: 60%;">
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
												<td
													style="width: 45%; height: 20%; border-top: 2px solid purple;">
													<p id="contentq1" style="font-size: 2.5em;"></p>
												</td>
											</tr>
											<tr>
												<td style="border-bottom: 1px solid gold">
													<p id="contenta1" style="font-size: 1.5em;"></p>
												</td>
											</tr>
											<tr>
												<td
													style="width: 45%; height: 20%; border-top: 1px solid purple;">
													<p id="contentq2" style="font-size: 2.5em;"></p>
												</td>
											</tr>
											<tr>
												<td style="border-bottom: 1px solid gold">
													<p id="contenta2" style="font-size: 1.5em;"></p>
												</td>
											</tr>
											<tr>

												<td
													style="width: 45%; height: 20%; border-top: 1px solid purple;">
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
									</div>

									<div class="modal-footer">

										<button type="button" style="display: none;"
											class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

					</section>
				</div>
			</div>
		</div>

		<div class="container" style="width: 100%; text-align: left;">
			<c:choose>
				<c:when test="${percentage < 100}">
					<div class="alert alert-info" style="font-size: 20px;">
						<strong>하루 권장량 보다 덜 드셨습니다.</strong> ${id}님의 건강한 삶을 위해 음식을 추천드립니다.
					</div>
					<fieldset class="col-md-12">
						<legend>추천 음식 리스트</legend>
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="panel-group" id="accordion">
									<c:forEach items="${recoList}" var="reco" varStatus="index">
										<div class="panel panel-default">
											<div class="panel-heading" style="text-align: center">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse${index.count}">${reco.name}</a>
												</h4>
											</div>
											<div id="collapse${index.count}"
												class="panel-collapse collapse">
												<div class="panel-body">
													<div class="col-md-offset-2 col-md-3">
														<img src="/resources/${reco.img}" width="350px;">
													</div>
													<div class="col-md-5">
														<div>
															<h3>영양소 정보</h3>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">제조사</div>
															<div class="col-md-10" id="maker">${reco.maker}</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">칼로리</div>
															<div class="col-md-10" id="cal">${reco.calory}</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">탄수화물</div>
															<div class="col-md-10" id="tan">${reco.carbo }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">단백질</div>
															<div class="col-md-10" id="dan">${reco.protein }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">지방</div>
															<div class="col-md-10" id="fat">${reco.fat }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">당류</div>
															<div class="col-md-10" id="dang">${reco.sugar }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">나트륨</div>
															<div class="col-md-10" id="na">${reco.natrium }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">콜레스테롤</div>
															<div class="col-md-10" id="col">${reco.chole }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">포화 지방산</div>
															<div class="col-md-10" id="po">${reco.fattyacid }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
														<div class="row">
															<div class="col-md-2">트랜스지방</div>
															<div class="col-md-10" id="trans">${reco.transfat }</div>
														</div>
														<hr style="margin-top: 1%; margin-bottom: 0.5%;">
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</fieldset>
				</c:when>
				<c:otherwise>
					<div class="alert alert-danger" style="font-size: 20px;">
						<strong>과섭취 하셨습니다!</strong> ${id}님의 건강한 삶을 위해 운동을 추천드립니다.
					</div>
					<fieldset class="col-md-12">
						<legend>추천 운동 리스트</legend>
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="panel-group" id="accordion">
									<c:forEach items="${exeList}" var="exer" varStatus="index">
										<div class="panel panel-default">
											<div class="panel-heading" style="text-align: center">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#collapse${index.count}">${exer.name}</a>
												</h4>
											</div>
											<div id="collapse${index.count}"
												class="panel-collapse collapse">
												<div class="panel-body"
													style="font-size: 2em; text-align: center">
													<div class="col-md-5"
														style="padding-top: 7%; padding-left: 12%; text-align: left">
														오늘 초과 섭취한 칼로리 량 : ${calory - kpd}kcal <br> 30분당 칼로리
														소모량 : ${exer.kcal}kcal <br> 필요한 운동시간 :
														<fmt:formatNumber value="${((calory-kpd)/exer.kcal)*30}"
															pattern="0" />
														분
													</div>
													<div class="col-md-6">${exer.url}</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</fieldset>
				</c:otherwise>
			</c:choose>

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

		$("#myModal2").modal('show');
	}
</script>
</body>
</html>