<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,edu.ssafy.safefood.dto.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 섭취 정보</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/user.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
var start;
var end;

$(function(){
	$("#submitBtn").on('click', function(source) {
		start = $("#start").val();
		end = $("#end").val();
		
		var todayArray = getRecentDate().split('-');
		
		var startArray = start.split('-');
        var endArray = end.split('-');   

        var today = new Date(todayArray[0], todayArray[1], todayArray[2]);
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);

        if(today.getTime() < start_date.getTime()){
        	alert("시작날짜는 현재 날짜보다 크면 안됩니다.");
        	source.preventDefault()
        	return;
        }
        
        if(start_date.getTime() > end_date.getTime()) {
            alert("종료날짜보다 시작날짜가 작아야합니다.");
            source.preventDefault()
            return;
        }
		
        $("#form").submit();
	});
});

function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}

</script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#userInfo {
	background-color: purple;
	color: white;
	font-size: 3em;
	font-weight: bold;
	text-align: center;
}

.body{
	border-radius: 25px;
	background-color: antiquewhite;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
	padding-left: 20px;
	padding-bottom: 20px;
}

#form{
	padding: 25px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row" id="userInfo">${name}님의 섭취정보</div>
		<form action="/eat/myEat" method="post" name="form" id="form">
			<label class="col-md-3" style="font-size: 2em; font-weight: bold">검색 기간 설정</label>
			<div class="col-md-3">
				<label for="start">검색 시작일</label>
				<c:choose>
					<c:when test="${start eq null}">
						<input type="date" name="start" id="start">
					</c:when>
					<c:otherwise>
						<input type="date" name="start" id="start" value="${start}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-3">
				<label for="end">검색 종료일</label>
				<c:choose>
					<c:when test="${end eq null}">
						<input type="date" name="end" id="end">
					</c:when>
					<c:otherwise>
						<input type="date" name="end" id="end" value="${end}">
					</c:otherwise>
				</c:choose>
			</div>
			<button type="button" class="btn btn-info" id="submitBtn">
				<span class="glyphicon glyphicon-search"></span> 검색
			</button>
		</form>
		<section class="row" id="maincon">
			<c:forEach items="${eatList}" var="content">
				<div class="col-md-6" style="margin-bottom: 10px;">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="hovereffect">
							<img class="img-responsive" src="/resources/${content.value.img}"
								alt="" width="200px">
							<div class="overlay">
								<h2 style="margin: 0; margin-top: 5px;">
									${content.value.name}<br>${content.value.maker}
								</h2>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-8 col-xl-9">
						<div class="body">
							<br>
							섭취 식품 명 : ${content.value.name}<br>
							섭취 식품 개수 : ${content.key.count}<br>
							섭취 일자 : ${content.key.date}<br>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>