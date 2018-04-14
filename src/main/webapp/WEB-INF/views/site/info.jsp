<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/default.css">
<style>
#contents td{
padding : 10px;

}
</style>
</head>
<body onload='changeTable()' onresize='changeTable()'>

	<div class="section">
		<h3>
			회원 정보
		</h3>
	</div>

	<div id="privacy" align="center" class="section">

		<table>
			<tr>
				<td class="first">
					<div align="center">
						<img src="../img/user.png" width="200" height="200">
					</div>
				</td>
				<td class="second">
					<form>
						<table id ="contents">
							<tr>
								<td>기수</td>
								<td>${member.batch}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${member.name}</td>
							</tr>
							<tr>
								<td>휴대전화</td>
								<td>${member.phone_number_id}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${ member.email}</td>
							</tr>
							<tr>
								<td>직장전화</td>
								<td>${ member.w_tel}</td>
							</tr>
							<tr>
								<td>소속지위</td>
								<td>${member.position}</td>
							</tr>
							<tr>
								<td>직장</td>
								<td>${member.work}</td>
							</tr>
							<tr>
								<td>직장지위</td>
								<td>${member.w_position}</td>
							</tr>
						</table>


					</form>

				</td>
			</tr>



		</table>

	</div>

	<div id="privacy2" class="section">


		<table align="center">
			<tr>
				<td><br> <br>
					<div alige="center">
						<img src="../img/user.png" width="200" height="200">

					</div>
				<td>
			</tr>
			<tr>
				<td align="center">
					<form>
						<table id ="contents">
							<tr>
								<td>기수</td>
								<td>${member.batch}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${member.name}</td>
							</tr>
							<tr>
								<td>휴대전화</td>
								<td>${member.phone_number_id}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${ member.email}</td>
							</tr>
							<tr>
								<td>직장전화</td>
								<td>${ member.w_tel}</td>
							</tr>
							<tr>
								<td>소속지위</td>
								<td>${member.position}</td>
							</tr>
							<tr>
								<td>직장</td>
								<td>${member.work}</td>
							</tr>
							<tr>
								<td>직장지위</td>
								<td>${member.w_position}</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>

	</div>
	<script language='javascript'>
		function changeTable() {
			if (window.innerWidth > 600) {
				document.getElementById('privacy').style.display = 'block';
				document.getElementById('privacy2').style.display = 'none';
			} else {
				document.getElementById('privacy').style.display = 'none';
				document.getElementById('privacy2').style.display = 'block';
			}
		}
		$(".save").click(function() {
			var answer = confirm('수정하시겠습니까?');
			if (answer) {
				var form = $(this).parents('form');
				form.submit();
			} else {
				return false;
			}
		});
	</script>
</body>
</html>


<%@ include file="/WEB-INF/include/footer.jsp"%>