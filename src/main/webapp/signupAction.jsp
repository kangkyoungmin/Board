<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="userid" />
<jsp:setProperty name="member" property="name" />
<jsp:setProperty name="member" property="password" />
<jsp:setProperty name="member" property="address" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	PrintWriter write = response.getWriter();
	String phonenum="";
	String[] phone = request.getParameterValues("phone");
	
	for(String str:phone)
	{
		phonenum+=str;
	}

	
	member.setPhone(phonenum);

	if (member.getAddress() == null ||  member.getClass() == null || member.getName() == null
			|| member.getPassword() == null || member.getPhone() == null || member.getUserid() == null) {
		write.println("<script>");
		write.println("alert('입력이 안된 사항이 있습니다.')");
		write.println("history.back()");
		write.println("</script>");
	}
	else{
		MemberDAO mem = new MemberDAO();
		int result = mem.join(member);
		write.println(result);
		if(result==-1){
			write.println("<script>");
			write.println("alert('이미 존재하는 아이디입니다.')");
			write.println("history.back()");
			write.println("</script>");
		}
		else if(result==1){
			session.setAttribute("userid", member.getUserid());
			write.println("<script>");
			write.println("location.href='main.html'");
			write.println("</script>");
		}
	}
	%>
</body>
</html>