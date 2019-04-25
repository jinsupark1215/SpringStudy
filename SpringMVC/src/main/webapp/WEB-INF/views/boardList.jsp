<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, edu.ssafy.board.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#searchBtn").click(function() {
			var keyword = $("#searchArea").val();
			if(keyword.length == 0){
				alert("검색어는 공백으로 입력할 수 없습니다.");
				source.preventDefault()
				return;
			}else{
				$("#searchForm").submit();
			}
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
	margin-top: 3%;
}

table thead tr th {
	text-align: center;
	font-weight: bold;
	background-color: white;
}

#resultTable {
	margin-top: 1%;
	margin-bottom: 1%;
	width: 1100px;
}

.table {
	background-color: white;
	text-align: center;
}

.data {
	padding-top: 7px;
}

.bottom {
	width: 200px;
}

#searchForm {
	display: inline-block;
	padding: 0;
}

#searchBtn {
	float: right;
	margin-right: 5px;
	width: 100px;
}

#searchArea {
	float: right;
	height: 32px;
	margin-right: 10px;
}

#class {
	float: right;
	height: 32px;
	margin-right: 10px;
}

.search{
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">게시글 리스트</p>
			<form class="form-inline col-md-offset-7 col-md-5" action="search" id="searchForm">
				<div class="search form-group">
					<button type="button" class="btn btn-success" id="searchBtn">검색</button>
				</div>
				<div class="search form-group">
					<input type="text" id="searchArea" name="searchArea">
				</div>
				<div class="search form-group">
					<select id="class" name="class">
						<option selected>작성자</option>
						<option>제목</option>
					</select>
				</div>
			</form>
			<form class="form-horizontal" action="#" method="post">
				<div class="col-md-8" id="resultTable">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>게시순서</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=list.get(i).getSeq()%></td>
								<td><a href="detail?seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getTitle()%></a></td>
								<td><%=list.get(i).getWriter()%></td>
								<td><%=list.get(i).getRegDate()%></td>
								<td><%=list.get(i).getCnt()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>

				<div class="col-md-offset-3 col-md-10">
					<button type="button" class="bottom btn btn-info" onclick="location.href = '../'">확인</button>
					<button type="button" class="bottom btn btn-warning" onclick="location.href = 'goRegist'">게시글 등록</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>