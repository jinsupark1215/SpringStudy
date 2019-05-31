<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var pwd;
	var name;
	var addr;
	var phone;

	$(function() {
		$("#updateBtn").on('click', function(source) {
			pwd = $("#pwd").val();
			name = $("#name").val();
			addr = $("#addr").val();
			phone = $("#phone").val();

			if (pwd.length != 0 && pwd.length < 6) {
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.");
				source.preventDefault();
				return;
			}
			
			$("#form").attr("action", "update");
			$("#form").submit();
		});

		$("#cancelBtn").on('click', function(source) {
			$("#form").attr("action", "../");
			$("#form").submit();
		});
	});
</script>
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
}


.data {
	padding-top: 5px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">회원 정보 수정</p>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="data col-md-5" id="id">${sessionScope.id}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">비밀번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문 숫자 포함 6자리 이상">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="name">이름</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="name" id="name" placeholder="User Name">
						<span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="addr">주소</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="addr" id="addr" placeholder="address">
						<span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info" id="updateBtn">
							수정<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
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