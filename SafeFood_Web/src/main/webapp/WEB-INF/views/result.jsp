<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#outer {
	margin-top: 12%;
	padding-top: 5px;
	border : 2px solid;
}

#btnGroup {
	padding-left: 40%;
	margin-bottom: 2%;
	margin-top: 30px;
}

button {
	width: 100%;
}

h1{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="min-height: 400px">
		<div class="container" id="outer">
			<h1>${msg}</h1>
			<div class="row" id="btnGroup">
				<div class="col-md-4">
					<button type="button" class="btn btn-info" onclick="location.href = '../'">확인</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>