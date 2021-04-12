<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/style.css">
<script src="js/login.js"></script>
<style>
div {
	width: 300px;
	height: 100px;
}

div .schedule {
	position: relative;
	text-align: center;
	margin-left: 50%;
}

.schedule_table {
	margin-left: 40%;
	display: flex;
	position: relative;
	align-items: center;
	justify-content: center;
}

table {
	border: 1px solid #555;
}

#location {
	background-color: black;
	color: white;
}
</style>
</head>
<body>
   <%
       String uid = null;
       if(session.getAttribute("userid")!=null){
    	   uid = (String)session.getAttribute("userid");
       }
     %>



	<header>
		<div class="container">
		  <%
		      if(uid==null){ 
		  %>
			<ul class="sidemenu">
				<li><a href="index.html">Home</a></li>
				<li><a href="signup.html">회원가입</a></li>
				<li><a href="login.html">로그인</a></li>
			</ul>
			<% } else{ %>
			  <ul class="sidemenu">
				<li><a href="index.html">Home</a></li>
				<li><%=uid %></li>
			</ul>
			
			<% } %>
		</div>
	</header>
	<nav>
		<div class="container">
			<ul class="logo"
				style="float: left; padding-left: 50px; padding-bottom: 150px">
				<img src="image/logo2.png" width=100px height=100px>
			</ul>
			<ul class="leftMenu" style="float: right;">
				<li class="active"><a href="index.html">Home </a></li>
				<li class="dropBox"><a href="">일정/결과 </a> <span
					class="dropmenu"> <span><a href="schedule.html">일정</a></span>
						<span><a href="result.html">결과</a></span>
				</span></li>
				<li class="dropBox"><a href="rank.html">순위</a></li>
				<li class="dropBox"><a href="record.html">기록</a> <span
					class="dropmenu"> <span><a href="rank_1.html">주간/월간
								랭킹</a></span> <span><a href="result.html">역대 기록실</a></span>
				</span></li>
				<li class="dropBox"><a href="/board/list">커뮤니티 </a> <span
					class="dropmenu"> <span><a href="index.html">자유
								게시판</a></span> <span><a href="index.html">문의 게시판</a></span>
				</span></li>

			</ul>

		</div>


	</nav>
	<section>
		<div class="schedule">
			<input type="image" alt="" src="./image/left_.JPG" onclick="left();">
			<span id='currentdate' style="display: inline-block; width: 100px;"></span>
			<input type="image" alt="" src="./image/right_.JPG"
				onclick="right();">
		</div>

		<iframe src="./WEB-INF/views/Schedule.jsp" frameborder="0" width="600"
			height="300"></iframe>

	</section>

	<footer include-html="footer.html"></footer>
</body>

<script src="js/timeSchedule.js"></script>
</html>