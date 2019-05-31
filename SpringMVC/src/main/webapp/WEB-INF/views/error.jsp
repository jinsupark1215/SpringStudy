<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#box{
	background-color: gray;
	padding-bottom: 3%;
	margin-top: 3%;
}
#outer {
	background-color: #F5F5F5;
	border-radius: 20px;
	margin-top: 3%;
	padding: 40px;
}

#title {
	text-align: center;
	font-size: 3em;
	font-weight: bold;
	background-color: #F5F5F5;
	margin-bottom: 10px;
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
	<div class="row" id="box">
		<div class="container" id="outer">
			<div class="row" id="title">ERROR</div>
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