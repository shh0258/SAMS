<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sams.*" %>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="css/default.css">
		<link rel="stylesheet" type="text/css" href="css/puzzle.css">
		<style type="text/css">
			body{
				background: white;
				font-family:"나눔고딕";
			}
		</style>

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			function puzzleOn(num) {
				var where=document.getElementById("links").getElementsByTagName("a")[num];
				where.style.color="black";

				var puzzle=document.getElementById("puzzle").getElementsByTagName("img")[num];
				puzzle.src="img/_"+(num+1)+".png";
				// where.style.text-decoration="bold";
			}function puzzleOff(num) {
				var where=document.getElementById("links").getElementsByTagName("a")[num];
				where.style.color="gray";

				var puzzle=document.getElementById("puzzle").getElementsByTagName("img")[num];
				puzzle.src="img/"+(num+1)+".png";
				// where.style.text-decoration="bold";
			}
		</script>
	</head>

	<body onload='changeTable()' onresize='changeTable()'>
	<div id="index1">
		<section id="puzzle">
			<div class="middle">
				<ul>
					<li data-url="2" onmouseover="puzzleOn(0)" onmouseleave="puzzleOff(0)"><img src="img/1.png"/></li>
					<li data-url="3" onmouseover="puzzleOn(1)" onmouseleave="puzzleOff(1)"><img src="img/2.png"/></li>
				</ul>
				<ul>
					<li data-url="4" onmouseover="puzzleOn(2)" onmouseleave="puzzleOff(2)"><img src="img/3.png"/></li>
					<li data-url="5" onmouseover="puzzleOn(3)" onmouseleave="puzzleOff(3)"><img src="img/4.png"/></li>
				</ul>
			</div>
		</section>
		<section id="side">
			<img class="logo" src="img/logo.png">
			<ul id="links">
				<li data-url="2"><a onmouseover="puzzleOn(0)" onmouseleave="puzzleOff(0)">함께맞는 비</a></li>
				<li data-url="3"><a onmouseover="puzzleOn(1)" onmouseleave="puzzleOff(1)">최고경영자</a></li>
				<li data-url="4"><a onmouseover="puzzleOn(2)" onmouseleave="puzzleOff(2)">인문학습원</a></li>
				<li data-url="5"><a onmouseover="puzzleOn(3)" onmouseleave="puzzleOff(3)">더불어 숲</a></li>
			</ul>
		</section>
		</div>
		
		<div id="index2">
		
		<section id="side">
			<img class="logo" src="img/logo.png">
			<ul id="links">
				<li data-url="2"><a onmouseover="puzzleOn(0)" onmouseleave="puzzleOff(0)">함께맞는 비</a></li>
				<li data-url="3"><a onmouseover="puzzleOn(1)" onmouseleave="puzzleOff(1)">최고경영자</a></li>
				<li data-url="4"><a onmouseover="puzzleOn(2)" onmouseleave="puzzleOff(2)">인문학습원</a></li>
				<li data-url="5"><a onmouseover="puzzleOn(3)" onmouseleave="puzzleOff(3)">더불어 숲</a></li>
			</ul>
		</section>
		</div>
		
		
		
	</body>
	
	<script type="text/javascript">
		$(function() {
			$("li").click(function(){
//				location.href = "main.do?department="+$(this).attr("data-url");
				location.href = "site/main.do?department="+$(this).attr("data-url");
			});
		});
		
		function changeTable() {
			if (window.innerWidth > 600) {
				document.getElementById('index1').style.display = 'block';
				document.getElementById('index2').style.display = 'none';
			} else {
				document.getElementById('index1').style.display = 'none';
				document.getElementById('index2').style.display = 'block';
			}
		}
		
	</script>
</html>