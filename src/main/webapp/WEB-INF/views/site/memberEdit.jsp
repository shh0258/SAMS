<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<!-- jQuery -->
<script src="..js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="..js/bootstrap.min.js"></script>
<!-- Script to Activate the Carousel -->
<script>
	$('.carousel').carousel({
		interval : 5000
	//changes the speed
	})
</script>

<!-- Bootstrap Core CSS -->
<link href="..css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="..css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="..css/default.css">

<style>
	img{
		height:200px;
		width:200px;
	}
	
	input{
		padding:3px;
		margin-bottom:5px;
		width:100%;
	}
	span{margin-left:10px;}
	div{margin-bottom:10px;}
	.red{
		color:#d44;
		margin-left:10px;
	}
</style>

</head>
<body onload='changeTable()' onresize='changeTable()'>

	<div id="men" class="section">
		<h3>
			개인정보관리
		</h3>
	</div>

	<div id="privacy" align="center" class="section">

		<table>
			<tr>
				<td class="first">
					<div align="center">
						<img src="../img/user.png">
						<br/>사진업로드
						<input type="file" name="file_upload" value="사진업로드">
					</div>
				</td>
				<td class="second">
					<form method="post">

						<div>
							기수:
							<span>${member.batch}</span>
						</div>
						<div>
							이름<br/>
							<input type="text" name="name" value="${member.name}">
						</div>
						<div>
							휴대전화
							<c:if test="${ wait != null }">
								<span class="red">휴대전화 변경은 운영자의 확인 후 변경됩니다.</span>
							</c:if>
							<br/>
							<input type="text" name="phone_number_id"
								value="${member.phone_number_id}">
						</div>
						<div>
							이메일<br/>
							<input type="text" name="email" value="${ member.email}">
						</div>
						<div>
							직장전화<br/>
							<input type="text" name="w_tel" value="${ member.w_tel}">
						</div>
						<div>
							소속지위:
							<span>${member.position}</span>
						</div>
						<div>
							직장<br/>
							<input type="text" name="work" value="${member.work}">
						</div>
						<div>
							직장지위<br/>
							<input type="text" name="w_position" value="${member.w_position}">
						</div>
						<div>
							<input type="submit" class="save" value="저장" />
						</div>
					</form>
				</td>
			</tr>
		</table>
	</div>



	<div id="privacy2" class="section" align="center">
		<table>
			<tr>
				<td><br> <br>
					<div align="center">
						<img src="../img/user.png">
						<br/>사진업로드
						<input type="file" name="file_upload">
					</div>
				<td>
			</tr>
			<tr>
				<td align="left">
					<form method="post">
						<div>
							기수:
							<span>${member.batch}</span>
						</div>
						<div>
							이름<br/>
							<input type="text" name="name" value="${ member.name}">
						</div>

						<div>
							휴대전화<span class="red">휴대전화 변경은 운영자의 확인 후 변경됩니다.</span><br/>
							<input type="text" name="phone_number_id"
								value="${ member.phone_number_id}">
						</div>
						<div>
							이메일<br/>
							<input type="text" name="email" value="${member.email }">
						</div>
						<div>
							직장전화<br/>
							<input type="text" name="w_tel" value="${member.w_tel}">
						</div>
						<div>
							소속지위:
							<span>${member.position}</span>
						</div>
						<div>
							직장<br/>
							<input type="text" name="work" value="${member.work}">
						</div>
						<div>
							직장지위<br/>
							<input type="text" name="w_position" value="${member.w_position}">
						</div>
						<div>
							<input type="submit" class="save" value="저장" />
						</div>
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