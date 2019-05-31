<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 430px">
		<div class="container" id="outer">
			<h3 class="signText">공지사항 수정</h3>
			<form class="form-horizontal" id="form" action="/board/update?seq=${board.seq}" method="post">
				<input type="hidden" id="seq" name = "seq" value="${board.seq}">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="title">제목<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="title" id="title" value="${board.title}">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
	
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="content">내용<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<textarea class="form-control" rows="5" id = "content" name = "content">${board.content}</textarea>
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