<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
h3 {
	margin: 0px
}

.section table {
	width: 100%;
}

.section table td {
	padding: 1px 3px;
			text-align:right;	
}

.section table td:first-child {
	width: 3%;
	text-align:left;
}

.section table td:nth-child(2) {
	text-align:left;
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

.section table tr:nth-child(2) td {
	text-align: left;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.section button {
	display: inline-block;
	margin-top: 10px;
	padding: 3px 15px;
	margin-left: 5px;
}

.board tr td:last-child{
	padding:10px;
}
		
.com li {
	list-style: none;
	padding: 3px 10px;
}

.com li:before {
	color: gray;
	content: "ㄴ ";
}

.com li span {
	color: gray;
	font-size: 0.8em;
	margin-left:5px;
}

.com li span:hover {
	color: #5a5acc;
	font-weight: bold;
	
	cursor: pointer;
}
.com li span:first-child{
	margin-left:10px;
}

.buttons{ float: right; }
.replyButton { margin-left:50%; transform: translateX(-50%); padding:5px 7px; margin-top:10px }
</style>
</head>
<body>
	<section class="section">
		<h3>${ title }</h3>
	</section>
	<section class="section">
		<table class="board">
			<tr>
				<td>${ board.p_no }</td>
				<td>${ board.title }</td>
				<td>${ board.p_name }</td>
				<td>${ board.hits }</td>
				<td>${ board.p_date }</td>
			</tr>

			<tr>
				<td colspan="5">${ board.p_contents }
					<div class="buttons" data-url1="${ board.p_no }" data-url2="${ where }" data-url3="${ department }">
						<button>목록</button>
						<c:if test="${ member.member_id == board.member_id }">
							<button>수정</button>
							<button>삭제</button>
						</c:if>
					</div></td>
			</tr>
		</table>

		<ul class='com'>
			<c:forEach var="reply" items="${ list }">
				<li data-url="${ reply.r_no }">
					${ reply.r_name }: ${ reply.r_contents }<span>${ reply.r_date }</span>
					<c:if test="${ member.member_id == reply.member_id }">
						<span class='edit'>수정</span><span class='del'>삭제</span>
					</c:if>
				</li>
			</c:forEach>
			<!-- 
				<li>이름 덧글 <span>수정</span> <span>삭제</span></li>
				<li>이름 덧글 <span>수정</span> <span>삭제</span></li>
				<li>이름 덧글 <span>수정</span> <span>삭제</span></li>
			-->
			
			<form:form method="post" modelAttribute="reply">
				<input class="form-control" value="댓글을 입력하세요 " style="margin-top:10px;" name="temp"/>
				<input type="hidden" name="what" value="new" />
				<input type="submit" class="replyButton" value="댓글 저장" />
			</form:form>
		</ul>
	</section>
</body>

<script>
		$(".buttons button:nth-child(1)").click(function() {
			location.href = "boardList.do?department=${ board.dept_no }&where=${ board.board_type }";
		})
		$(".buttons button:nth-child(2)").click(function() {
			location.href = "boardEdit.do?department=${ board.dept_no }&where=${ board.board_type }&id=${board.p_no}";
		})
		$(".buttons button:nth-child(3)").click(function() {
			if(confirm('정말로 삭제하시겠습니까?')){
				var form = document.createElement("form");
		    	form.setAttribute("method", "post");
			    form.setAttribute("path", "board.do");

				var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "id");
	    	    hiddenField.setAttribute("value", $(this).parent().attr("data-url1"));
		        form.appendChild(hiddenField);
		        
		        hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "where");
		        hiddenField.setAttribute("value", $(this).parent().attr("data-url2"));
		        form.appendChild(hiddenField);
		        
		        hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "department");
		        hiddenField.setAttribute("value", $(this).parent().attr("data-url3"));
		        form.appendChild(hiddenField);
		        
		        hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "what");
		        hiddenField.setAttribute("value", "board");
		        form.appendChild(hiddenField);

			    document.body.appendChild(form);
			    form.submit();
			}
		})
		$(".com .del").click(function() {
			if(confirm('정말로 삭제하시겠습니까?')){
				var form = document.createElement("form");
		    	form.setAttribute("method", "post");
			    form.setAttribute("path", "board.do");

				var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "what");
	        	hiddenField.setAttribute("value", "delete");
	    	    form.appendChild(hiddenField);
	
		        hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
	        	hiddenField.setAttribute("name", "temp");
	    	    hiddenField.setAttribute("value", $(this).parent().attr("data-url"));
		        form.appendChild(hiddenField);

			    document.body.appendChild(form);
			    form.submit();
			}
		})
</script>

</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>