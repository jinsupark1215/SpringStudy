<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	session = request.getSession();
	String id = (String) session.getAttribute("id");
%>
<meta charset="UTF-8">
<title>로그인성공</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#outer {
	margin-top: 2%;
	border: 1px solid;
	padding: 2%;
	background-color: #F5F5F5;
	text-align: center;
}

.btn{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" id="outer">
		<h1><%=id%> 님 로그인 되었습니다.!!!</h1>
		<div class="col-md-offset-1 col-md-10">
			<button type="button" class="btn btn-info" onclick="location.href = 'member/mypage'">내 정보 확인</button>
			<button type="button" class="btn btn-warning" onclick="location.href = 'member/goUpdate'">내 정보 수정</button>
			<button type="button" class="btn btn-success" onclick="location.href = 'member/logOut'">로그아웃</button>
			<button type="button" class="btn btn-danger" onclick="location.href = 'member/delete'">회원 탈퇴</button>
		</div>
	</div>
</body>
</html>