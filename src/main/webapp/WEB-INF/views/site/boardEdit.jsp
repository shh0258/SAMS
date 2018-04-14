<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/default.css">

<style type="text/css">
.margintext {
	margin-top: 10px;
}

.margintextbottom {
	margin-bottom: 10px;
}

.board {
	width: 100%;
}

.board td {
	padding: 5px;
}

.board tr:frist-child td:first-child {
	text-algin: left;
	width: 3%;
}

.board tr:first-child td:nth-child(2) {
	width: 40%;
	text-align: left;
}

.board tr:frist-child td:nth-child(3) {
	text-align: right;
	width: 10%;
}

.board tr:frist-child td:last-child {
	width: 15%;
	text-align: right;
}

.board tr:nth-child(2) td {
	text-align: left;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

/*		p{
			padding: 10px;

			margin-top: 10px;
			margin-bottom: 10px;

			border-top: 1px solid gray;
			border-bottom: 1px solid gray;
		}*/
.board button {
	display: inline-block;
	margin-top: 10px;
	padding: 3px 15px;
	margin-left: 5px;
}

ul.com li {
	list-style: none;
	padding: 3px 10px;
}

ul.com li:before {
	color: gray;
	content: "ㄴ ";
}

ul.com li span {
	color: gray;
	font-size: 10pt;
}

ul.com li span:hover {
	color: #5a5acc;
	font-weight: bold;
}

input{
	margin-bottom:10px;
}
</style>
</head>

<body>
	<section class="section">
		<h3>${ title }</h3>
	</section>
	<section class="section">
		<form:form method="post" modelAttribute="board">
			<label>제목</label>
			<form:input class="form-control" path="title"/>
			
			<label class="margintext">글 내용</label>
			<textarea class="form-control margintextbottom" rows="6" name="p_contents">${ board.p_contents }</textarea>
			
			<label>파일</label>
			<form:input type="file" path="ufile"/>
			
		<div><!-- data-url="board.do?where=${ where }&id=${ id }" -->
			<input class="btn btn-default" type="submit" value="작성" data-url="boardEdit.do?id=${id}&department=${ department }&where=${ where }&${ pagination.queryString }"></input>
			<input class="btn btn-default" type="button" value="돌아가기" data-url="boardList.do?department=${ department }&where=${ where }&${ pagination.queryString }"></input>
			<!-- &${ pagination.queryString } -->
		</div>
		</form:form>
	</section>
	
	<c:if test="${ success != null }">
		<div class="section">저장되었습니다.</div>
	</c:if>
</body>

<script>
	$(function(){
		$(".btn[type='submit']").click(function() {
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("path", "boardEdit.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dept_no");
		    hiddenField.setAttribute("value", $(this).attr("data-url"));
		    form.appendChild(hiddenField);
	
			document.body.appendChild(form);
			form.submit();
		});
	})
	$(".btn[type='button']").click(function() {
		location.href = $(this).attr("data-url");
	})
</script>

</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>