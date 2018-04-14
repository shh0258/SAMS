<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sams.*" %>

<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title></title>

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Script to Activate the Carousel -->
	<script>
	    $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    })
    </script>

	<!-- Bootstrap Core CSS -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../css/business-casual.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/puzzle.css">
	<link rel="stylesheet" type="text/css" href="../css/default.css">

	<style type="text/css">

		.center{
			margin-left: 53%;
			transform: translateX(-50%);

			width: 80%;
		}

		table{
			display: inline-block;
			padding: 10px;
		}

		table:hover{
			background: #ebebeb;
			cursor: pointer;
		}
		
		table tr td{
			padding: 10px;
			font-size: 1.7em;
		}
		table tr:first-child td:first-child{
			background: white;

			width: 160px;
			padding: 10px;
		}
		table tr:last-child td{
			text-align: center;
		}

		#search{
			float: right;
		}
		!img:first-child{
			width: 100px;
		}

		form{
			display: none;
			float:right;
		}
		input{
			padding: 3px;
			margin: 3px;
			font-size: 15px;
		}

		#search:hover{
			cursor: pointer;
		}

	</style>
</head>
<body>
	<section class="section">

		<h3>동문회 임원명단
		<img id="search" src="../img/search_gray.png"/ onClick="click">
		<form action="autoListExe.jsp" method="send">
		<input name="search"></input><input type="submit" value="검색" />
			</form>
		</h3>
		
		<br/><br/>

		<div class="center">
			<c:forEach var="member" items="${ list }">
			<table data-url="${ member.member_id }">
				<tr><td rowspan="3"><img src="../img/user_small.png"/></td><td>${ member.batch }기</td></tr>
				<tr><td>${ member.name}</td></tr>
				<tr><td>${member.position}</td></tr>
				<tr><td colspan="2">${ member.phone_number_id }</td></tr>
			</table>
			</c:forEach>
		</div>

	</section>
</body>

<script type="text/javascript">
	$(function() {
		$("table").click(function() {
			location.href = "info.do?department=${ department }&id=" + $(this).attr("data-url");
		});
		$("#search").click(function (){
			$(this).parent().find("form").slideToggle('fast');
		});
	});
</script>

</html>

<%@ include file="/WEB-INF/include/footer.jsp" %>