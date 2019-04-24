<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, edu.ssafy.board.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	margin-top: 7%;
}

table thead tr th {
	text-align: center;
	font-weight: bold;
	background-color: white;
}

#resultTable {
	margin-top: 1%;
	margin-bottom: 1%;
	width: 550px;
}

.table{
	background-color: white;
	text-align: center;
}

.data {
	padding-top: 7px;
}

#ok{
	width: 450px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="col-md-offset-4 col-md-4" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">회원 리스트</p>
			<form class="form-horizontal" action="#" method="post">
				<div class="col-md-8" id="resultTable">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=list.get(i).getId() %></td>
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getAddr()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>

				<div class="form-group">
					<div class="col-md-offset-1 col-md-8">
						<button type="button" id="ok" class="btn btn-info" onclick="location.href='../'">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>