<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session = request.getSession();
	String id;
	if(session.getAttribute("id") == null){
		id = "error";
	} else {
		id = (String) session.getAttribute("id");
	}
	
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#top{
	margin-top:3%;
	text-align: center;
	font-size: 3em;
	font-weight: bold;
}
#error{
	text-align: center;
	font-size: 2em;
	font-weight: bold;
	margin-top: 2%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container" id="top">메인 페이지</div>
	<%
		if(msg != null){
	%>
		<div class="container" id="error"><%=msg %></div>
	<%
		}
	%>
	<%
		if(!id.equals("error")){ 
	%>
		<jsp:include page="/WEB-INF/views/LoginSuccess.jsp"></jsp:include>
	<%
		} else {
	%>
		<jsp:include page="/WEB-INF/views/Login.jsp"></jsp:include>
	<%
		}
	%>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>