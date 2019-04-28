<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 정보</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchWord = document.getElementById("searchWord").value;
		location.href = "foodInfo.do?searchCondition=" + searchCondition + "&searchWord=" + searchWord;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="jumbotron"
		style="background-color: #8C8C8C; margin-bottom: 0" align="center">
		<div style="color: white;">
			<h1>WHAT WE PROVIDE</h1>
			<hr>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
		</div>
	</div>
	<div class="jumbotron" style="background-color: #353535" align="center">
		<div class="container-fluid">
			<form class="form-inline" id="frm">
				<input type="hidden" id="code" value='code' />
				<div class="form-group">
					<label style="color: white;">검색 조건</label> <select
						class="form-control"
						style="background-color: #8C8C8C; color: white; font-weight: bold; margin-left: 10px"
						id="searchCondition">
						<option value="name">상품명</option>
						<option value="maker">제조사</option>
						<option value="material">원재료</option>
					</select>
				</div>
				<div class="form-group ml-1" style="margin-left: 20px">
					<label style="color: white;">검색 단어</label> <input type="text"
						class="form-control" id="searchWord"
						style="background-color: #8C8C8C; margin-left: 10px">
					<button type="button" class="btn btn-info" id="searchBtn"
						style="margin-left: 10px" onclick="search()">검색</button>
				</div>
			</form>
		</div>
	</div>

	<section class="main-container">

		<c:forEach items="${list}" var="content">
			<div class="image-box style-3-b">
				<div class="row">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="hovereffect">
							<h4 style="color: red" class="text-warning">


								<c:forEach items="${allergy}" var="aler">
									<c:if test="${content.material.contains(aler)}"> 
										${aler} 
									</c:if>
								</c:forEach>
							</h4>
							<img class="img-responsive" src="${content.img }" alt=""
								width="200px">
							<div class="overlay">


								<h2>
									${content.name}<br>${content.maker}
								</h2>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-8 col-xl-9">
						<div class="body">
							<h3 class="title">
								<a href="foodDetail.do?code=${content.code }">${content.name}</a>
							</h3>
							<p class="small mb-10">
								<i class="glyphicon glyphicon-calendar"></i> Feb, 2017 <i
									class="glyphicon glyphicon-tag"></i> Web Design
							</p>
							<div class="separator-2"></div>
							<p class="mb-10">${content.material}</p>
							<input type="hidden" id=code name="code${content.code}"
								value="${content.code}">
							<div class="btn-group">
								<div class="btn-group">
									<button type="button" class="btn btn-info"
										onclick="location.href='eat.addFood.do?code=${content.code}&quan=1&flag=yes'">
										<span class="glyphicon glyphicon-user"></span>추가
									</button>

									<c:choose>
										<c:when test="${zzimlist.contains(content.code)}">
											<button type="button" class="btn btn-danger"
												onclick="location.href='zzim.del.do?code=${content.code}'">
												<span class="glyphicon glyphicon-user"></span>찜 해제
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-info"
												onclick="location.href='zzim.add.do?code=${content.code}'">
												<span class="glyphicon glyphicon-user"></span>찜
											</button>
										</c:otherwise>
									</c:choose>
									<!-- 	<c:if test="${zzimlist.contains(content.code)}">
										<h1>TEST</h1>
									</c:if>
													
									<button type="button" class="btn btn-info" onclick="location.href='zzim.add.do?code=${content.code}'">
										<span class="glyphicon glyphicon-user"></span>찜
									</button> -->



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>