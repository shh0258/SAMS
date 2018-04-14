<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ include file="/WEB-INF/include/adminheader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<!-- jQuery -->
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

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css">

<style>
h3{ text-align: center; }
.section {
	position: fixed;
	left:50%;
	top:50%;
	transform: translate(-50%, -50%);
	background: white;
	display: block;
	padding: 20px;
	margin: 20px;
	border-radius: 5px;
	box-shadow: 0px 1px 3px gray;
	width: 300px;
	
}
button{
	display: inline-block;
	margin-top: 10px;
	padding: 3px 15px;
	margin-left: 5px;
}
</style>
</head>
<body>
<div class="section">
	<h3>메일 전송 실패</h3>
	<div align="center">
	<button class="btn btn-warning">메일 보내기</button>
	</div>
</div>
</body>
<script>
	$("button").click(function() {
		location.href = "sendEmail.do";
	})
</script>

</html>