<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#outer {
	margin-top: 5%;
	padding: 40px;
	padding-top: 5px;
}

#signText {
	font-size: 3em;
	font-weight: bold;
	padding-left: 1%;
	border-top: 2px solid;
	border-bottom: 1px solid gainsboro;
	padding-top: 20px;
	padding-bottom: 20px;
}

.data {
	padding-top: 3px;
	padding-bottom : 3px;
	background-color: white;
	margin-top: 4px;
}

#btns{
	text-align: center;
	margin-top: 2%;
}

.bottom{
	width: 150px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 530px">
		<div class="container" id="outer">
			<h3 id="signText">${board.title}</h3>
			<div class="col-md-1" style="border-bottom: 2px solid; padding-bottom: 10px;">등록일</div>
			<div class="col-md-11" style="border-bottom: 2px solid; padding-bottom: 10px;">${board.regDate}</div>
			<div style="border-bottom: 1px solid gainsboro; padding: 4%; font-size: 25px;">
				${board.content}
			</div>
			<div class="row" id="btns">
				<button type="button" class="bottom btn btn-info" onclick="location.href='/board/list'">목록</button>
				<c:if test="${id eq 'admin'}">
					<button type="button" class="bottom btn btn-warning" onclick="location.href='goUpdate?seq=${board.seq}'">수정하기</button>
					<button type="button" class="bottom btn btn-danger" onclick="location.href='delete?seq=${board.seq}'">삭제하기</button>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>