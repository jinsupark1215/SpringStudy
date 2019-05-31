<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
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
			
			$("#form").attr("action", "/board/regist");
			$("#form").submit();
		});
		
		$("#cancelBtn").on('click', function(source) {
			$("#form").attr("action", "/board/list");
			$("#form").submit();
		});
	});
</script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#outer {
	margin-top: 8%;
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 470px;">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">공지사항 작성</p>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-1" for="title">제목<span style="color: red"> *</span></label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="title" id="title">
					</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-1" for="content">내용<span style="color: red"> *</span></label>
					<div class="col-md-10">
						<textarea class="form-control" rows="5" id = "content" name = "content" ></textarea>
					</div>
				</div>
	
				<div class="form-group">
					<div class="row" style="text-align: center;">
						<button type="submit" class="btn btn-info" id="submitBtn" style="width: 200px">
							등록<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
						</button>
						<button type="submit" class="btn btn-danger" id="cancelBtn" style="width: 200px">
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