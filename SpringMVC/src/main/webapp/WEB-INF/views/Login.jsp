<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var id;
	var pwd;

	$(function() {
		$("#submitBtn").on('click', function(source) {
			var target = source.target;

			id = $("#id").val();
			pwd = $("#pwd").val();

			if(id.length == 0){
				alert("아이디를 입력하세요.");
				source.preventDefault()
				return;
			}
			
			if(pwd.length == 0){
				alert("비밀번호를 입력하세요.");
				source.preventDefault()
				return;
			}
			
			$("#form").attr("action", "member/logIn");
			$("#form").submit();
		});
		
		$("#signUpBtn").on('click', function(source) {
			$("#form").attr("action", "member/goSignUp");
			$("#form").submit();
		});
	});
</script>
<style type="text/css">
#box{
	background-color: purple;
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
}
</style>
</head>
<body>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">로그인</p>
			<form class="form-horizontal" action="#" method="post" id="form">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="id" id="id" required>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">비밀번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pwd" id="pwd" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="button" class="btn btn-info" id="submitBtn">
							확인<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="button" class="btn btn-warning" id="signUpBtn">
							회원가입<span class="glyphicon glyphicon-remove" style="margin-left: 15px"></span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>