<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var pwd;
	var checkPwd;

	$(function() {
		$("#updateBtn").on('click', function(source) {
			pwd = $("#pwd").val();
			checkPwd = $("#checkPwd").val();

			if (pwd.length == 0){
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.")
				source.preventDefault();
				return;
			}
			
			if (pwd.length != 0 && pwd.length < 6) {
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.")
				source.preventDefault();
				return;
			}
			
			if (pwd != checkPwd){
				alert("입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
				source.preventDefault();
				return;
			}
			
			$("#form").attr("action", "/member/resetPw");
			$("#form").submit();
		});

		$("#cancelBtn").on('click', function(source) {
			$("#form").attr("action", "../");
			$("#form").submit();
		});
	});
</script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#outer {
	margin-top: 10%;
	padding: 40px;
	padding-top: 5px;
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

#allergyList {
	display: inline-block;
}

.allergyChk {
	float: left;
}

.data {
	padding-top: 5px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 430px">
		<div class="container" id="outer">
			<h3 id="signText">비밀번호 재설정</h3>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="data col-md-5" id="id">${requestScope.id}</div>
					<input type = "hidden" name = "id" value = "${requestScope.id}">
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">비밀번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문 숫자 포함 6자리 이상">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="checkPwd">비밀번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="checkPwd" id="checkPwd" placeholder="비밀번호를 한번 더 입력하세요">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info" id="updateBtn">
							재설정<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="submit" class="btn btn-danger" id="cancelBtn">
							취소<span class="glyphicon glyphicon-remove" style="margin-left: 15px"></span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>