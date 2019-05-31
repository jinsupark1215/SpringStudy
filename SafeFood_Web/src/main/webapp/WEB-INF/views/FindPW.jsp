<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var id;
	var name;
	var phone;

	$(function() {
		$("#submitBtn").on('click', function(source) {
			var target = source.target;

			id = $("#id").val();
			name = $("#name").val();
			phone = $("#phone").val();

			if(id.length == 0){
				alert("아이디를 입력하세요.");
				source.preventDefault();
				return;
			}
			
			if(name.length == 0){
				alert("이름을 입력하세요.");
				source.preventDefault();
				return;
			}
			
			if(phone.length == 0){
				alert("전화번호를 입력하세요.");
				source.preventDefault();
				return;
			}
			
			$("#form").attr("action", "/member/findPW");
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
	margin-top: 9%;
	padding: 40px;
	padding-top: 5px;
	border : 2px solid;
}

#signText {
	font-size: 3em;
	font-weight: bold;
	padding-left: 1%;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 455px">
		<div class="container" id="outer">
			<h3 id="signText">비밀번호 찾기</h3>
			<form class="form-horizontal" action="#" method="post" id="form">
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="id" id="id" required>
					</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="name">이름</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="name" id="name" required>
					</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="phone">전화번호</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="phone" id="phone" required>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="button" class="btn btn-info" id="submitBtn">
							확인<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="button" class="btn btn-danger" id="cancelBtn">
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