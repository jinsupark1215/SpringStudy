<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#box {
	background-color: gray;
	padding-bottom: 3%;
	margin-top: 3%;
}

#outer {
	background-color: #F5F5F5;
	border-radius: 20px;
	margin-top: 3%;
	padding: 40px;
	padding-top: 5px;
}

#signText {
	font-size: 3em;
	font-weight: bold;
	color: gray;
	margin-top: 7%;
}

.data {
	padding-top: 3px;
	padding-bottom : 3px;
	background-color: white;
	margin-top: 4px;
}

#btns{
	margin-left: 55px;
}

.btn{
	width: 150px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="col-md-offset-4 col-md-4" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">${requestScope.title}</p>
			<form class="form-horizontal" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="regdate">작성일</label>
					<div class="data col-md-9" id="regdate">${requestScope.regdate}</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="cnt">조회수</label>
					<div class="data col-md-9" id="cnt">${requestScope.cnt}</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="writer">작성자</label>
					<div class="data col-md-9" id="writer">${requestScope.writer}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="content">내용</label>
					<div class="data col-md-9" id="content">${requestScope.content}</div>
				</div>

				<div class="form-group">
					<div class="col-md-10" id="btns">
						<button type="button" class="btn btn-info" onclick="location.href='list'">확인</button>
						<button type="button" class="btn btn-warning" onclick="location.href='goUpdate?seq=${requestScope.seq}'">수정하기</button>
						<button type="button" class="btn btn-danger" onclick="location.href='delete?seq=${requestScope.seq}'">삭제하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>