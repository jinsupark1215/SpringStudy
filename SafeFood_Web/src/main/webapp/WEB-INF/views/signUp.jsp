<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var id;
	var pwd;
	var checkPwd;
	var name;
	var addr;
	var phone;
	var allergy = new Array();

	$(function() {
		$("#submitBtn").on('click', function(source) {
			id = $("#id").val();
			pwd = $("#pwd").val();
			checkPwd = $("#checkPwd").val();
			name = $("#name").val();
			addr = $("#addr").val();
			phone = $("#phone").val();
			$('input:checkbox[name="allergy"]').each(function() {
				if (this.checked == true) {
					allergy.push(this.value);
				}
			});
			
			if(id.length == 0){
				alert("회원아이디는 필수입력 항목입니다.");
				source.preventDefault()
				return;
			}
			
			if(pwd.length == 0){
				alert("비밀번호는 필수입력 항목입니다.");
				source.preventDefault()
				return;
			}
			
			if(pwd.length < 6){
				alert("비밀번호는 영문 숫자 포함 6자리 이상입니다.")
				source.preventDefault()
				return;
			}
			
			if (pwd != checkPwd){
				alert("입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
				source.preventDefault()
				return;
			}
			
			if(name.length == 0){
				alert("회원이름은 필수입력 항목입니다.");
				source.preventDefault()
				return;
			}
			
			if(phone.length == 0){
				alert("전화번호는 필수입력 항목입니다.");
				source.preventDefault()
				return;
			}
			
			$("#form").attr("action", "/member/regist");
			$("#form").submit();
		});
		
		$("#cancelBtn").on('click', function(source) {
			$("#form").attr("action", "../");
			$("#form").submit();
		});
	});
</script>
<style type="text/css">
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row" id="box">
		<div class="container" id="outer">
			<p class="h3 mb-3 font-weight-normal" id="signText">회원 가입</p>
			<form class="form-horizontal" id="form" action="#" method="post">
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="id">아이디<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="id" id="id">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="pwd">비밀번호<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문 숫자 포함 6자리 이상">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="checkPwd">비밀번호 확인<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="checkPwd" id="checkPwd" placeholder="비밀번호를 한번더 입력하세요">
						<span class="glyphicon glyphicon-pencil form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="name">이름<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="name" id="name" placeholder="User Name">
						<span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="addr">주소<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="addr" id="addr" placeholder="address">
						<span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>

				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="phone">전화번호<span style="color: red"> *</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="phone" id="phone"	placeholder="010-xxxx-xxxx">
						<span class="glyphicon glyphicon-lock form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				
				<div class="form-group has-primary has-feedback">
					<label class="control-label col-md-2" for="allergyList">알레르기<span style="color: gray"> *</span></label>
					<div class="col-md-9" id = "allergyList">
						<fieldset class="allergyField" style="margin-left: 5px;">
							<legend class="allergyField">Check</legend>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="대두"><label class="form-check-label">대두</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="땅콩"><label class="form-check-label">땅콩</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="우유"><label class="form-check-label">우유</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="게"><label class="form-check-label">게</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="새우"><label class="form-check-label">새우</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="참치"><label class="form-check-label">참치</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="연어"><label class="form-check-label">연어</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="쑥"><label class="form-check-label">쑥</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="소고기"><label class="form-check-label">소고기</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="닭고기"><label class="form-check-label">닭고기</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="돼지고기"><label class="form-check-label">돼지고기</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="복숭아"><label class="form-check-label">복숭아</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="민들레"><label class="form-check-label">민들레</label>
							</div>
							<div class="allergyChk form-check col-md-2">
								<input name="allergy" class="op form-check-input" type="checkbox" value="계란흰자"><label class="form-check-label">계란흰자</label>
							</div>
						</fieldset>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info" id="submitBtn">
							등록<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
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