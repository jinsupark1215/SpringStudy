<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String msg = (String) request.getAttribute("msg");
	if(msg == null){
		msg = "Error 발생";
	}
%>
<meta charset="UTF-8">
<title>에러</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
#box{
	background-color: gray;
	padding-bottom: 3%;
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
			<h1><%=msg %></h1>
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