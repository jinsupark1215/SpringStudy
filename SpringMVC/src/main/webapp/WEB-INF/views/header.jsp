<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	session = request.getSession();
	String id;
	if (session.getAttribute("id") == null) {
		id = "";
	} else {
		id = (String) session.getAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#menu {
	text-align: center;
	font-size: 25px;
	padding-top: 22px;
	padding-bottom: 22px;
}

#menu a {
	text-decoration: none;
	color: white;
}

#myHeader{
	background-color: black;
}
</style>
</head>
<body>
	<div class="header" id="myHeader">
		<div class="row">
			<!-- 메뉴 -->
			<div class="col-md-offset-3 col-md-9" id="menu">
				<div class="col-sm-2">
					<a href="#">공지 사항</a>
				</div>
				<div class="col-sm-2">
					<a href="/board/board/list">게시판</a>
				</div>
				<div class="col-sm-2">
					<a href="uploadForm">파일 업로드</a>
				</div>
				<div class="col-sm-2">
					<a href="/board/member/list">회원 리스트</a>
				</div>
				<div class="col-sm-2">
					<a href="#">메뉴 3</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>