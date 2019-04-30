<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String aller = (String) request.getAttribute("allergy");
	String[] allergies = {"대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레", "계란흰자"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var pwd;
	var name;
	var addr;
	var phone;
	var allergy = new Array();

	$(function() {
		$("#updateBtn").on('click', function(source) {
			pwd = $("#pwd").val();
			name = $("#name").val();
			addr = $("#addr").val();
			phone = $("#phone").val();
			$('input:checkbox[name="allergy"]').each(function() {
				if (this.checked == true) {
					allergy.push(this.value);
				}
			});

			if (pwd.length != 0 && pwd.length < 6) {
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.");
				source.preventDefault();
				return;
			}
			
			$("#form").attr("action", "/member/updateInfo");
			$("#form").submit();
		});

		$("#cancelBtn").on('click', function(source) {
			$("#form").attr("action", "../");
			$("#form").submit();
		});
	});
</script>
<style type="text/css">
*{
	font-family: 'Stylish', sans-serif;
}

#box {
	background-color: gray;
	padding-bottom: 3%;
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
}

fieldset.allergyField {
	border: 1px groove #ddd !important;
	padding: 0 1.4em 1.4em 1.4em !important;
	margin: 0 0 1.5em 0 !important;
}

legend.allergyField {
	font-size: 1.2em !important;
	font-weight: bold !important;
	text-align: left !important;
	width: auto;
	padding: 0 10px;
	border: 1px solid gray;
	background-color: white;
}

#allergyList {
	display: inline-block;
}

.allergyChk {
	float: left;
}

.data {
	padding-top: 5px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">회원 정보 수정</p>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디</label>
					<div class="data col-md-5" id="id">${id}</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">비밀번호</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문 숫자 포함 6자리 이상">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="name">이름</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="name" id="name" placeholder="User Name">
						<span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="addr">주소</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="addr" id="addr" placeholder="address">
						<span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="phone">전화번호</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="phone" id="phone" placeholder="010-xxxx-xxxx">
						<span class="glyphicon glyphicon-lock form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="allergy">알레르기</label>
					<div class="col-md-9" id="allergyList">
						<fieldset class="allergyField" style="margin-left: 5px;">
							<legend class="allergyField">Check</legend>
							<%
								for(String a : allergies) {
									if(aller.contains(a)){
							%>
									<div class="allergyChk form-check col-md-2">
										<input name="allergy" class="op form-check-input" type="checkbox" value="<%=a%>" checked><label class="form-check-label"><%=a%></label>
									</div>
							<%			
									} else {
							%>
									<div class="allergyChk form-check col-md-2">
										<input name="allergy" class="op form-check-input" type="checkbox" value="<%=a%>"><label class="form-check-label"><%=a%></label>
									</div>
							<%
									}
								}
							%>
						</fieldset>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info" id="updateBtn">
							수정<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
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