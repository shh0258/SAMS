<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

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
<link rel="stylesheet" type="text/css" href="../css/puzzle.css">
<link rel="stylesheet" type="text/css" href="../css/default.css">
</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
				<a class="navbar-brand" href="main.do">HOME</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a>${dName}</a>
						<ul>
							<li><a href="hello.do?department=${ department }">인사말</a></li>
							<li><a href="saup.do?department=${ department }">사업안내</a></li>
							<li><a href="jojik.do?department=${ department }">조직안내</a></li>
							<li><a href="path.do?department=${ department }">오시는 길</a></li>
						</ul></li>
					<li><a>회원정보</a>
						<ul>
							<li><a href="memberEdit.do?department=${ department }">개인정보관리</a></li>
						</ul></li>
					<li><a>동문회</a>
						<ul>
							<li><a href="autoList.do?department=${ department }&batch=1">기수별 동문명단</a></li>
							<li><a href="autoListExe.do?department=${ department }">동문회 임원명단</a></li>
						</ul></li>
					<li><a>커뮤니티</a>
						<ul>
							<li><a href="boardList.do?department=${ department }&where=1">공지사항</a></li>
							<li><a href="boardList.do?department=${ department }&where=2">자유게시판</a></li>
							<!--department=${department}&-->
						</ul></li>
					<li><a>…</a>
						<ul>
							<li><a href="main.do?department=${ department }">첫 화면</a></li>
							<li><a href="SAMS/logout.do">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
</body>

<script type="text/javascript">
	click = 0;
	now = 0;
	$("div>ul>li>a").click(function() {
		$(this).parent().parent().find('>li>ul>li').slideUp('fast');
		$(this).parent().find('li').slideDown('fast');
	});
	
	/*
	$(function() {
		$("ul li ul li").click(function(){
			location.href = $(this).$(parent).attr("data-url")+"department=&where="+$(this).attr("data-url");
		})
	});
	*/
</script>

</html>