<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sams.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<head>
<link href="../css/default.css" rel="stylesheet">
<style>
	body{background:#ebebeb;}
	.red{background:#d44; color:white;}
	.red:hover{cursor:pointer;}
	.green{background:#4d4; color:white;}
</style>
</head>

<body>
	<c:if test="${ phoneChangeCheck != null }">
		<div class="section red" data-url="${ member.member_id }">핸드폰 번호 변경 요청을 확인했습니다.<br/>이 곳을 클릭해 주세요</div>
	</c:if>	
	
	<c:if test="${ fin != null }">
		<div class="section green">핸드폰 번호 변경이 완료되었습니다.<br/>다음 로그인 부턴 변경된 번호로 로그인 하시면 됩니다.</div>
	</c:if>

	<c:if test="${ admin == null }">
		<div class="section">반갑습니다.<br/>&lt;&lt;${dName}&gt;&gt;에 접속하셨습니다.<br/><br/>처음 접속하셨을시, 회원정보에서 비밀번호를 변경해주세요!</div>
	</c:if>
	<c:if test="${ err != null }">
		<div class="section">접속할 수 없는 페이지입니다.<br/>접속 가능한 페이지로 이동했습니다.</div>
	</c:if>
	<c:if test="${ admin != null }">
		<div class="section">관리자 계정으로 접속하셨습니다.<br/><a href="../admin/main.do">관리자 페이지로 이동</a></div>
	</c:if>
</body>

<script>
	$(function(){
		$(".red").click(function() {
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("path", "main.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "id");
		    hiddenField.setAttribute("value", $(this).attr("data-url"));
		    form.appendChild(hiddenField);
	
			document.body.appendChild(form);
			form.submit();
		});
	})
</script>

<%@ include file="/WEB-INF/include/footer.jsp" %>