<%@page import="player.Player"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter"%>  
<%@ page import = "player.PlayerDAO" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   function radio_check(obj)
   {
	   var checked = document.getElementsByName("tab").length;
	   for(var i=0;i<checked;i++){
		   if(document.getElementsByName("tab")[i].checked==true){
			str = document.getElementsByName("tab")[i].value;
		   }
	   }
	   obj.submit();
   }
   
</script>
</head>
<body>
  <%
    String str = "1";
    PrintWriter write = response.getWriter();
    String position = request.getParameter("tabb");
	 
  %>
<div id="rank1">
	<h3> PLAYER RANKING</h3>
		<button>더보기</button>
		<div class="tabmenu">
		 <form name="ranking" method ="post" action="rank.jsp" >
			<input type="radio" name="tabb" id="tab1"  onclick='radio_check(this.form)' value="1"> <label
				for="tab1">타자</label> <input type="radio" name="tabb" id="tab2" onclick='radio_check(this.form)'> <label
				for="tab2">투수</label> <input type="radio" name="tabb" id="tab3" onclick='radio_check(this.form)'> <label
				for="tab3">주간랭킹</label>
		 </form>		
			<table style="border: 1px solid"#dddddd">
				<%
				PlayerDAO p = new PlayerDAO();
				ArrayList<Player> list = p.getList();
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%= list.get(i).getPlayer_name()%></td>
					<td><%= list.get(i).getPlayer_num()%></td>
					<td><%= list.get(i).getTeam_id()%></td>
					<td><%= list.get(i).getCareer()%></td>
					<td><%= str%></td>
				</tr>
				<%
	              }
			%>
			</table>
			<h1><%=position %></h1>
		</div>
	</div>

<div id="rank2">
	<h3>TEAM RANKING</h3>
	<button>더보기</button>
	<div>내용</div>
</div>
</body>
</html>