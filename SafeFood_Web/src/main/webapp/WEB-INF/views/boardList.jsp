<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, edu.ssafy.safefood.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
}

table thead tr th {
	text-align: center;
	font-weight: bold;
	background-color: white;
}

#resultTable {
	margin-top: 1%;
	margin-bottom: 1%;
	width: 100%;
}

.table {
	background-color: white;
	text-align: center;
}

.data {
	padding-top: 7px;
}

.bottom {
	width: 200px;
}

#searchForm {
	display: inline-block;
	padding: 0;
}

#searchBtn {
	float: right;
	margin-right: 5px;
	width: 100px;
}

#searchArea {
	float: right;
	height: 32px;
	margin-right: 10px;
}

#class {
	float: right;
	height: 32px;
	margin-right: 10px;
}

.search{
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 530px">
		<div class="container" id="outer">
			<h3 id="signText">공지사항</h3>
			<form class="form-horizontal" action="#" method="post">
				<div class="col-md-8" id="resultTable">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>게시순서</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td>${board.seq}</td>
									<td><a href="detail?seq=${board.seq}">${board.title}</a></td>
									<td>${board.regDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="row" style="text-align: center">
					<button type="button" class="bottom btn btn-info" onclick="location.href = '../'">확인</button>
					<c:if test="${id eq 'admin'}">
						<button type="button" class="bottom btn btn-warning" onclick="location.href = '/board/goRegist'">공지사항 등록</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>