<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
#box {
	background-color: gray;
	padding-bottom: 3%;
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

fieldset.allergyField {
	border: 1px groove #ddd !important;
	padding: 0 1.4em 1.4em 1.4em !important;
	margin: 0 0 1.5em 0 !important;
}

legend.allergyField {
	font-size: 1.2em !important;
	font-weight: bold !important;
	text-align: left !important;
	width: auto;
	padding: 0 10px;
	border: 1px solid gray;
	background-color: white;
}

.data {
	padding-top: 7px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
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

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="phone">전화번호</label>
					<div class="data col-md-5" id="phone">${requestScope.phone}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="allergy">알레르기</label>
					<div class="data col-md-8" id="allergy">
						<fieldset class="allergyField" style="margin-left: 5px;">
							<legend class="allergyField">Check</legend>
							${requestScope.allergy}
						</fieldset>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-3 col-md-8">
						<button type="button" class="btn btn-info" onclick="location.href='../'">
							확인<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="button" class="btn btn-info" onclick="location.href='/member/update'">
							수정<span class="glyphicon glyphicon-pencil" style="margin-left: 15px"></span>
						</button>
						<button type="button" class="btn btn-danger" onclick="location.href='/member/delPage'">
							탈퇴<span class="glyphicon glyphicon-remove" style="margin-left: 15px"></span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>