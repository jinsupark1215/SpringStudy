<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
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

#title {
	text-align: center;
	font-size: 3em;
	font-weight: bold;
	margin-bottom: 10px;
}

#btnGroup {
	margin-bottom: 2%;
	margin-top: 30px;
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
			<div id="title">ERROR</div>
			<h1>${msg}</h1>
			<div class="row" id="btnGroup">
				<div style="text-align: center">
					<c:if test="${msg eq '로그인 정보가 없습니다.'}">
						<button type="button" class="btn btn-info" onclick="location.href = '/member/signup'">회원가입하기</button>
						<button type="button" class="btn btn-info" onclick="location.href = '/member/goLogin'">로그인하기</button>
					</c:if>
					<button type="button" class="btn btn-info" onclick="location.href = '../'">홈으로 가기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>