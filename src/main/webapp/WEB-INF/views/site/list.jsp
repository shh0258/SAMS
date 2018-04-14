<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
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
<link rel="stylesheet" type="text/css" href="../css/puzzle.css">
<link rel="stylesheet" type="text/css" href="../css/default.css">

<style type="text/css">
.boardList li {
	list-style: none;
	border-bottom: 1px solid #ebebeb;
	padding: 5px 10px;
}

.boardList li:last-child {
	border-bottom: none;
}

.boardList li:hover {
	background: #ebebeb;
	cursor: pointer;
}

.boardList li>table {
	width: 100%;
}

.boardList li>table td {
	padding: 1px 3px;
	text-align: right;
}

.boardList li>table td:first-child {
	width: 3%;
	text-align: left;
}

.boardList li>table td:nth-child(2) {
	text-align: left;
}

.section table td:nth-child(3) {
	width: 90px;
}

.section table td:nth-child(4) {
	width: 45px;
}

.section table td:last-child {
	width: 100px;
}

.section:first-child h3, ul {
	padding: 0px;
	margin: 0px;
}

.section button {
	display: inline-block;
	margin-top: 10px;
	padding: 3px 15px;
	margin-left: 5px;
}

.pagelist {
	left:50%;
}
</style>
</head>
<body>
	<section class="section">
		<h3>${ title }</h3>
	</section>
	<section class="boardList section">
		<form method="get">
			<input type="hidden" name="pg" value="1" />
			<ul>
				<c:forEach var="board" items="${ list }">
					<li data-url="${ board.p_no }">
						<table>
							<tr>
								<td>${ board.p_no }</td>
								<td>${ board.title }</td>
								<td>${ board.p_name }</td>
								<td>${ board.hits }</td>
								<td>${ board.p_date }</td>
							</tr>
						</table>
					</li>
				</c:forEach>
			</ul>
			<div class="pagination pagination-small pagination-centered pageList">
				<ul>
					<c:forEach var="page" items="${ pagination.pageList }">
						<li class='${ page.cssClass }'><a
							data-page="${ page.number }">${ page.label }</a></li>
					</c:forEach>
				</ul>
			</div>
		</form>

		<c:if test="${ success != null }">
			<div class="section">삭제되었습니다.</div>
		</c:if>

		<c:if test="${ where == '1'}">
			<c:if test="${ member.dept_no == '1'}">
				<button data-url="boardNew.do?department=${ department }&where=${ where }&${ pagination.queryString }">글쓰기</button>
			</c:if>
		</c:if>
		<c:if test="${ where != '1' }">
			<button data-url="boardNew.do?department=${ department }&where=${ where }&${ pagination.queryString }">글쓰기</button>
		</c:if>
	</section>
</body>

<script>
	$(function() {
		$(".boardList form > ul li").click(function() {
			location.href = "board.do?department=${department}"+"&id=" + $(this).attr("data-url");
		})
		$("section.boardList button").click(function() {
			location.href = $(this).attr("data-url");
		})
		$("div.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			$("form").submit();
		});
	});
</script>

</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>