<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.MemberDAO"%>  
<%@ page import ="java.io.PrintWriter"%>   
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:useBean id="member" class="member.Member" scope ="page"/>
<jsp:setProperty name="member" property="userid"/>
<jsp:setProperty name="member" property="password"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
       String uid = null;
       PrintWriter write = response.getWriter();
       if(session.getAttribute("userid")!=null){
    	   uid = (String)session.getAttribute("userid");
       }
      
       MemberDAO mem = new MemberDAO();
       int result = mem.login(member.getUserid(),member.getPassword());
      
       if(result==1){
    	    session.setAttribute("userid", member.getUserid());
    	    write.println("<script>");
    	    write.println("alert('비밀번호가 맞습니다.')");
    	    write.println("location.href = 'main.jsp'");
    	    write.println("</script>");
    	    
    	   
       }
       else if(result==0){
    	   write.println("<script>");
    	   write.println("alert('비밀번호가 틀렸습니다.')");
    	   write.println("history.back()");
    	   write.println("</script>");
       }
       else if(result==-1){
    	   write.println("<script>");
    	   write.println("alert('존재하지 않는 아이디입니다.')");
    	   write.println("history.back()");
    	   write.println("</script>");
       }
       else if(result==-2){
    	   write.println("<script>");
    	   write.println("alert('데이터베이스 오류입니다.')");
    	   write.println("history.back()");
    	   write.println("</script>");
       }
   %>
</body>
</html>