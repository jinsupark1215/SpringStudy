<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	padding-top: 7px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="col-md-offset-4 col-md-4" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">회원 정보 확인</p>
			<form class="form-horizontal" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="id">아이디</label>
					<div class="data col-md-5" id="id">${requestScope.id}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="name">이름</label>
					<div class="data col-md-5" id="name">${requestScope.name}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="addr">주소</label>
					<div class="data col-md-5" id="addr">${requestScope.addr}</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-3 col-md-8">
						<button type="button" class="btn btn-info" onclick="location.href='../'">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>