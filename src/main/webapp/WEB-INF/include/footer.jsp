<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<script src="js/jquery.js"></script>
<link href="../css/defualt.css" rel="stylesheet">
</head>

<body>
	<section class="footer">
		<img src="../img/logo.png" class="clickable" data-url=""/> 08359 서울시 구로구 연동로 320/지하철 1-7호선
		온수역(성공회대입구역)<br /> COPYRIGHT 2010 SUNGKONGHOE UNIVERSITY. ALL RIGHT
		RESERVED
	</section>
	
	<script>
	$(".footer img").click(function() {
		location.href = "main.do";
	})
	</script>
</body>

</html>