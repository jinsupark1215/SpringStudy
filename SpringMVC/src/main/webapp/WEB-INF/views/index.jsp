<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/vue"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
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
#box{
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
#title {
	text-align: center;
	font-size: 3em;
	font-weight: bold;
	background-color: #F5F5F5;
	margin-bottom: 10px;
}
#btnGroup {
	margin-bottom: 2%;
	margin-top: 30px;
	text-align: center;
}
#btns{
	text-align: center;
}
#signText {
	font-size: 3em;
	font-weight: bold;
	color: gray;
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
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container" id="top">메인 페이지</div>
	<div id="app">
		<div v-if="errored">
			<div class="row" id="box">
				<div class="container" id="outer">
					<div class="row" id="title">ERROR</div>
					<h1 style="text-align: center">{{msg}}</h1>
					<div class="row" id="btns">
						<button type="button" id="ok" class="btn btn-info" @click='okBtn'>확인</button>
					</div>
				</div>
			</div>
		</div>
		<div v-if='loginPage'>
			<div class="row" id="box" v-if ="!logined">
				<div class="container" id="outer">
					<p class="h3 mb-3 font-weight-normal" id="signText">로그인</p>
					<form class="form-horizontal" action="#" method="post" id="form">
						<div class="form-group has-primary has-feedback">
							<label class="control-label col-md-2" for="id">아이디</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="id" id="id" v-model="id" required>
							</div>
						</div>

						<div class="form-group has-primary has-feedback">
							<label class="control-label col-md-2" for="pwd">비밀번호</label>
							<div class="col-md-9">
								<input type="password" class="form-control" name="pwd" id="pwd" v-model="pw" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-2 col-md-10">
								<button type="button" class="btn btn-info" @click='logIn'>
									확인<span class="glyphicon glyphicon-ok" style="margin-left: 15px"></span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row" id="box" v-if ="logined">
				<div class="container" id="outer">
					<h1>{{id}} 님 로그인 되었습니다.!!!</h1>
					<div id="btns">
						<button type="button" class="btn btn-info" @click='showList'>회원 리스트</button>
						<button type="button" class="btn btn-success" onclick="location.href = 'member/logOut'">로그아웃</button>
					</div>
				</div>
			</div>
		</div>
		<div v-if='listPage'>
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
								<tr v-for="mem in memList">
									<td>{{mem.id}}</td>
									<td>{{mem.name}}</td>
									<td>{{mem.addr}}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="form-group">
						<div class="col-md-offset-1 col-md-8">
							<button type="button" id="ok" class="btn btn-info" @click='okBtn'>확인</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		new Vue({
			el : '#app',
			data : {
				memList : null,
				logined : false,
				loginPage : true,
				listPage : false,
				id : '',
				pw : '',
				errored : false,
				msg : ''
			},
			methods : {
				logIn : function(){
					axios
					.post('/board/rest/logIn/'+this.id+'/'+this.pw)
					.then(response => {
						this.id = response.data
						this.pw = ''
						
						if(this.id == ""){
							alert("로그인 실패");
							this.loginPage = false
							this.errored = true
							this.msg = '아이디 또는 패스워드가 틀립니다'
						} else {
							alert("로그인 성공");
							this.logined = true
							this.errored = false
							this.msg = id + '님 로그인 되었습니다!!'
						}
					})
				},
				
				showList : function(){
					axios
					.get('/board/rest/getList')
					.then(response => {
						this.memList = response.data
						this.listPage = true
						this.errored = false
						this.loginPage = false
					})
				},
				
				okBtn : function(){
					this.errored = false
					this.loginPage = true
					this.listPage = false
				}
			}
		});
		
		Vue.config.devtools = true;
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>