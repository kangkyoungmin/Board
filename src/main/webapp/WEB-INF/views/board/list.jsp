<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border-collapse:collapse;
}

.list_wrap{
	padding:50px;
}
.list{
	width:80%;
	margin:auto;
	border-top:1px solid navy;
}
.list td, th{
	padding:10px;
	font-size:14px;
	text-align:center;
}
.list tr{
	border-bottom:1px solid #999;
}
.list td:nth-child(2){
	text-align:left;
}
.list_wrap .page a:first-child{
	margin-left: 0;
}
.list_wrap .page{
	margin-top:20px;
	font-size:0;
	text-align:center;
	margin-left:44%;
}
.list_wrap .page a {
	display:inline-block;
	padding: 5px 10px;
	border:1px solid black;
	font-size:12px;
	border-top:medium;
	
}
.list_wrap .page a.p{
	background:#eee;
	border:1px solid #eee;
	color:black;
	text-decoration:none;
}

.list_wrap .page a.num{
	font-weight:600;
	border:1px solid #eee;
	text-decoration:none;
	color:black;
}
#write{
	margin-right:12%;
	margin-top:35px;
}
#name{
	padding: 10px;
	text-align-last: center;
	margin:28%
}
#name2{
	margin-left:15%;
	
}
.search{
	margin-left:12%;
	margin-top:60px;
}
#bo{
	margin-top:43px;
}
li {list-style: none; float: left; padding: 6px; text-align:center;}
ul{text-align:center;}
</style>
 
</head>
<body id = "bo">
<span id="name2" style="font-size:1.5em; bold 1em; color:green;"> <a href="/webproject_jdbc_2/main.jsp">Home </a></span>
<span id="name" style="font-size:1.5em; text-align:center;"> 커뮤니티 </span>
<a href="/board/writeView"><button  id="write" style="float: right;"> 글쓰기 </button></a>
<div class="list_wrap">
	<form role="form" method="get">
		<table class="list">
		<tr><th>작성일</th> <th> 제목</th> <th> 작성자 </th> <th> 조회수</th></tr>
		 
		 <c:forEach items="${list}" var="list">
			 <tr>
				 <td><fmt:formatDate value="${list.board_date}" pattern="yy-MM-dd"/></td>
				 <td><a href="/board/readView?board_id=${list.board_id}"> <c:out value="${list.board_title}"/></a>  </td>
				 <td> <c:out value="${list.userid}"/> </td> 
				 <td> <c:out value="${list.views}"/></td>
			 </tr>
		 </c:forEach>
		</table>
	 
	
	<div class="page">
		<ul>
		     <c:if test="${pageMaker.prev}">
	    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="p">이전</a></li>
	    	</c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="list${pageMaker.makeSearch(idx)}" class="num">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" class="p">다음</a></li>
	   		</c:if>
	  </ul>
		
	</div>
	
	 <div class="search">
	    <select name="searchType">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
	      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
	      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
	      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	
	    <button id="searchBtn" type="button">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
  	</div>
	
  </form>
</div>




</body>
</html>