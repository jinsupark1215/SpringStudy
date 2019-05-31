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
*{
	font-family: 'Stylish', sans-serif;
}

#outer {
	margin-top: 7%;
	padding: 40px;
	padding-top: 15px;
	border: 2px solid;
}

#signText {
	font-size: 3em;
	font-weight: bold;
	padding-left: 1%;
	padding-top: 20px;
	padding-bottom: 20px;
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
	<div style="min-height: 490px">
		<div class="container" id="outer">
			<h3 class="signText">회원 정보 확인</h3>
			<form class="form-horizontal" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="id">아이디</label>
					<div class="data col-md-5" id="id">${id}</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="name">이름</label>
					<div class="data col-md-5" id="name">${name}</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="birth">생일</label>
					<div class="data col-md-5" id="birth">${birth}</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="성별">성별</label>
					<div class="data col-md-5" id="gen">${gender}</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="addr">주소</label>
					<div class="data col-md-5" id="addr">${addr}</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="phone">전화번호</label>
					<div class="data col-md-5" id="phone">${phone}</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-offset-1 col-md-2" for="allergy">알레르기</label>
					<div class="data col-md-8" id="allergy">
						<fieldset class="allergyField" style="margin-left: 5px;">
							<legend class="allergyField">Check</legend>
							${allergy}
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