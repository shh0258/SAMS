<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ include file="/WEB-INF/include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

<body>

	<section class="section">
		<div class="hello" align="left">
			<h4>
				사업안내
			</h4>
		</div>
	</section>
	<br>
	<section class="section">
		<div align="center">
			<img src="../img/saupinfo.jpg" style="max-width: 70%; height: auto">
		</div>
	</section>

</body>
</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>