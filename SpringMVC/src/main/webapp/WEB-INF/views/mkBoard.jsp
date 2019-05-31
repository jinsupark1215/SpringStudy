<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var title;
	var content;

	$(function() {
		$("#submitBtn").on('click', function(source) {
			title = $("#title").val();
			content = $("#content").val();
			
			if(title.length == 0){
				alert("제목은 공백일 수 없습니다.");
				source.preventDefault()
				return;
			}
			
			if(content.length == 0){
				alert("내용은 공백일 수 없습니다.");
				source.preventDefault()
				return;
			}
			
			$("#form").attr("action", "regist");
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">게시글 작성</p>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="title">제목<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="title" id="title">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="content">내용<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<textarea class="form-control" rows="5" id = "content" name = "content" ></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info" id="submitBtn">
							등록<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
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