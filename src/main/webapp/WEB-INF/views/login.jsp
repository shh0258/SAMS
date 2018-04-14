<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="sams.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- Script to Activate the Carousel -->
<script>
	$('.carousel').carousel({
		interval : 5000
	//changes the speed
	})
</script>
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<style>
body{
	background:#ebebeb;
}
h3 {
	text-align: center;
}

h5 {
	text-align: center;
}

button.login {
	margin-top: 30px;
}

div.first_login {
	padding: 50px;
	border: solid 1px white;
	margin: auto;
	margin-top: 50px;
	background-color: white;
	text-align: center;
	display: none;
}

div.change_pw {
	padding: 5px;
	border: solid 1px white;
	margin: auto;
	margin-top: 50px;
	background-color: white;
	display: none;
}

td {
	padding: 5px !important;
}

.center {
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.center_m {
	position: fixed;
	left: 50%;
	top: 30%;
	transform: translate(-50%, -50%);
}

.logo {
	position: absolute;
	top: 10px;
	right: 10px;
	display: block;
	z-index: -1;
}

.section button {
	display: inline-block;
	margin-top: 10px;
	padding: 3px 15px;
	margin-left: 5px;
	
	width:100%;
}
.section input {
	padding:3px 5px;
	text-align: center;
}

.footer {
	color: gray;
	position: fixed;
	bottom: 10px;
	text-align: center;
	z-index: -1;
	left: 50%;
	transform: translate(-50%);
}

</style>

</head>
<body>

	<div class="main center section">
		<h3>인문학습원</h3><hr/>

		<form method="POST" action="login_processing.do">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="phone_number_id" /><br /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pword" /><br /></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" class="btn btn-primary">
				<i class="icon-check icon-white"></i> 로그인
			</button></td>
			</tr>
		</table>
		</form>

		<c:if test="${ param.error != null }">
			<div class="alert alert-error">로그인 실패</div>
		</c:if>
		
<!-- 
		<center>
			<button onclick="$('.first_login').show()" type="submit"
				class="login">로그인</button>
			<button type="submit">PW찾기</button>
		</center>
-->

	</div>

	<div class="first_login center section">
		<h4>
			최초로 로그인 하셨습니다.<br /> 안전을 위해 비밀번호를 변경해 주세요.<br />
		</h4>
		<center>
			<button onclick="$('.change_pw').show()" type="submit">확인</button>
		</center>
	</div>
	<div class="change_pw center section">
		<h4>비밀번호 변경</h4>
		<div>
			<label>ID</label> <input class="form-control" type="text"> <label>PW</label>
			<input class="form-control" type="text">
		</div>
		<br />

		<center>
			<button type="submit">확인</button>
		</center>
	</div>

	<img class="logo" src="img/sams_logo.png" width="300" height="250" />
	<footer id="foot">
		</div>
		<footer class="footer">
			<div class="container">

				<p>
					08359 서울시 구로구 연동로 320/지하철 1-7호선 온수역(성공회대입구역) <br>&copy; 2010
					SUNGKONGHOE UNIVERSITY. ALL RIGHT RESERVED
				</p>

			</div>
		</footer>
</body>

</html>