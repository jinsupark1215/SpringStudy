<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Stylish" rel="stylesheet">
<script type="text/javascript">
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
</script>
<style type="text/css">
* {
	font-family: 'Stylish', sans-serif;
}

#user {
	font-size: 25px;
	font-weight: bold;
	margin: 0;
	margin-left: 30%;
	margin-bottom: 5%;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #ffffff;
	overflow-x: hidden;
	transition: 0.5s;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	font-size: 36px;
	width: 250px;
	background-color: #ffd014;
	border: none;
	color: black;
	height: 59px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

#logo {
	text-decoration: none;
	font-size: 1.7em;
	font-weight: bold;
	color: black;
}

.memInfo{
	border: 1px #ffd014;
	background-color: white;
	padding: 10%;
	margin-bottom: 10%;
}

.myBtn{
	width: 200px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" style="width: 100%; padding-top: 4px;">
		<div style="padding-top: 4px;  float:right; width:10%;">
			<span class="navbar-brand" style="font-size:2em;color: black;cursor: pointer;padding-top: 10px;padding-bottom: 0px;padding-right: 0px;padding-left: 70px;" onclick="openNav()">&#9776; open</span>
			<div id="mySidenav" class="sidenav">
				<button class="closebtn" onclick="closeNav()">close &times;</button>
				<div class="memInfo">
					<c:choose>
						<c:when test="${empty id}">
							<button type="button" class="myBtn btn btn-warning" style="margin-bottom: 10px" onclick="location.href='/member/goLogin'">
								<i class="glyphicon glyphicon-log-in" style="margin-right: 10px"></i>Login
							</button>
							<button type="button" class="myBtn btn btn-warning" onclick="location.href='/member/signup'">
								<i class="glyphicon glyphicon-user"></i> Sign Up
							</button>
						</c:when>
						<c:otherwise>
							<h2 id="user">${id}님</h2>
							<button type="button" class="myBtn btn btn-warning" style="margin-bottom: 10px" onclick="location.href='/member/mypage'">
								<i class="glyphicon glyphicon-user"></i> MyPage
							</button>
							<button type="button" class="myBtn btn btn-warning" onclick="location.href='/member/logout'">
								<i class="glyphicon glyphicon-log-out"></i> LogOut
							</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="list-group">
					<a href="/board/list" class="list-group-item">공지 사항</a>
					<a href="/food/goFoodInfo" class="list-group-item">상품 정보</a>
					<a href="/eat/bestEat" class="list-group-item">베스트 섭취 정보</a>
					<a href="/eat/myEat" class="list-group-item">내 섭취 정보</a>
					<a href="/eat/today" class="list-group-item">Today</a>
					<a href="/resources/html/qnaList.html" class="list-group-item">QnA</a>
					<a href="/health/check" class="list-group-item">건강 정보</a>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<a href="/" id="logo" style="text-decoration: none;"><img height="48px" src="/resources/img/logo.png" alt="mainlogo">식 품 안 전 정 보</a>
		</div>
	</nav>
</body>
</html>