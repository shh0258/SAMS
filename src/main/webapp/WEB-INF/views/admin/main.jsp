<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>

<!-- jQuery -->
<script src="../js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<!-- Script to Activate the Carousel -->
<script>
	$('.carousel').carousel({
		interval : 5000
	//changes the speed
	})
</script>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/default.css">
</head>

<style>
#total {
	background: white;
	display: block;
	padding: 20px;
	margin: 20px;
	border-radius: 5px;
	box-shadow: 0px 1px 3px gray;
}

button {
	text-align: center;
	display: inline-block;
	width: 20%;
	height: 150px;
	border: none;
	margin: 10px;
	box-shadow: 0px 1px 3px gray;
	border-radius: 5px;
}

button:hover {
	background: #ebebeb;
}

ul {
	list-style: none;
}

ul li {
	display: inline-block;
	padding: 3px 5px;
	margin: 20px 5px;
}

ul li:hover {
	background: #ebebeb;
}
</style>

</head>
<body>
	<div class="section">
		<h3>운영자 페이지</h3>
	</div>
	<div></div>
	<div align="center" id="total">
		<button id="email">이메일 전송</button>
		<button id="excel">명단 추가</button>
		<button id="phone">번호 변경 요청 확인</button>

		<ul>
			&lt;
			<li data-url="2">함께 맞는 비</li>
			<li data-url="3">최고경영자</li>
			<li data-url="4">인문학습원</li>
			<li data-url="5">더불어 숲</li> &gt;
		</ul>
	</div>
</body>
<script>
	$("#excel").click(function() {
		location.href = "/SAMS/admin/excel.do";
	})
	$("#email").click(function() {
		location.href = "/SAMS/admin/sendEmail.do";
	})
	$("#phone").click(function() {
		location.href = "/SAMS/admin/grantId.do";
	})

	$("li").click(
			function() {
				location.href = "/SAMS/site/main.do?department="
						+ $(this).attr("data-url");
			})
</script>
</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>