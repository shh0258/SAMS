<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ include file="/WEB-INF/include/adminheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<style type="text/css">
.sec {
	background: white;
	display: block;
	padding: 20px;
	margin: 20px;
	border-radius: 5px;
	box-shadow: 0px 1px 3px gray;
}

h3 {
	margin: 0px
}

.board {
	width: 100%;
}

.board td, th {
	padding: 5px;
}

.board tr>:first-child {
	text-align: left;
	width: 20%;
}

.board tr>:nth-child(2) {
	width: 20%;
	text-align: left;
}

.board tr>:nth-child(3) {
	width: 20%;
	text-align: left;
}

.board tr>:nth-child(4) {
	text-align: center;
	width: 15%;
}

.board tr>:nth-child(5) {
	text-align: right;
}

.board tr td {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}
.btn{background:#ebebeb}
</style>

</head>
<body>
	<section class="sec">
		<table class="board">
			<thead>
				<tr>
					<th>신청자 ID</th>
					<th>기존 핸드폰 번호</th>
					<th>요청한 핸드폰 번호</th>
					<th>신청자</th>
					<!-- <th><input type="checkbox" name="allChk" id="allChk" /></th> -->
					<th>승인</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="change_require" items="${ list }">
				<tr>
					<td>${change_require.member_id}</td>
					<td>${change_require.phone_number_before}</td>
					<td>${change_require.phone_number}</td>
					<td>${change_require.member_name }</td>
					<!-- <td><input type="checkbox"></td> -->
					
					<c:if test="${ change_require.permission =='1' }">
						<td>승인 완료 / 유저 확인 대기중</td>
					</c:if>
					<c:if test="${ change_require.permission =='0' }">
						<td data-url="${change_require.member_id}"><span class="btn">승인 대기중</span></td>
					</c:if>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</section>
</body>

<script>
	$(function(){
		$("td span.btn").click(function() {
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("path", "memberEdit.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "id");
		    hiddenField.setAttribute("value", $(this).parent().attr("data-url"));
		    form.appendChild(hiddenField);
	
			document.body.appendChild(form);
			form.submit();
		});
	})
</script>

</html>
<%@ include file="/WEB-INF/include/footer.jsp"%>