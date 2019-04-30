<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SafeFood | 상품 정보 목록</title>
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Stylish" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
function search(){
	var searchCondition = document.getElementById("searchCondition").value;
	var searchWord = document.getElementById("searchWord").value;
  	location.href="/food/search?searchCondition="+searchCondition+"&searchWord="+searchWord;
}
</script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="jumbotron" style="background-color: #8C8C8C; margin-bottom: 0" align="center">
		<div style="color: white;">
			<h1>WHAT WE PROVIDE</h1>
			<hr>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
		</div>
	</div>
	<div class="jumbotron" style="background-color: #353535" align="center">
		<div class="container-fluid">
			<form class="form-inline" id="frm">
				<input type="hidden" id="code" value='code' />
				<div class="form-group">
					<label style="color: white;">검색 조건</label>
					<select class="form-control" style="background-color: #8C8C8C; color: white; font-weight: bold; margin-left: 10px" id="searchCondition">
						<option value="name">상품명</option>
						<option value="maker">제조사</option>
						<option value="material">원재료</option>
					</select>
				</div>
				<div class="form-group ml-1" style="margin-left: 20px">
					<label style="color: white;">검색 단어</label> <input type="text" class="form-control" id="searchWord" style="background-color: #8C8C8C; margin-left: 10px">
					<button type="button" class="btn btn-info" id="searchBtn" style="margin-left: 10px" onclick="search()">검색</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>