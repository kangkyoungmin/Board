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
	padding:10px;
	overflow:auto;
}
.list{
	margin-left: 20%;
	border-top:2px solid navy;
	width: 60%;
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
}
.list_wrap .page a {
	display:inline-block;
	margin-left:10px;
	padding: 5px ;
	border:1px solid black;
	font-size:12px;
	border-radius:100px;
	
}
.list_wrap .page a.p{
	background:#eee;
	border:1px solid #eee;
	color:black;
	text-decoration:none;
}

.list_wrap .page a.num{
	font-weight:600;
	border:1px solid black;
	text-decoration:none;
	color:black;
}
#board_content{
	display:block;
	width:100%;
	height:400px;
	padding:15px;
	box-sizing:border-box;
	border:0;
	resize:vertical;
	
}
.t{
	width:100px;
}
#name{
	padding: 10px;
	text-align-last: center;
}

</style>
</head>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
				
				// 수정 
				$(".update_btn").on("click", function(){
					formObj.attr("action", "/board/updateView");
					formObj.attr("method", "get");
					formObj.submit();				
				})
				
				// 삭제
				$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
					}
				})
			
				
				// 취소
				$(".list_btn").on("click", function(){
					
					location.href = "/board/list";
				})
				
				//댓글 작성
				$(".replyWriteBtn").on("click", function(){
					  var formObj = $("form[name='replyForm']");
					  formObj.attr("action", "/board/replyWrite");
					  formObj.submit();
					  
					  
				});
			
				//댓글 수정 View
				$(".replyUpdateBtn").on("click", function(){
					
					
					location.href = "/board/replyUpdateView?board_id=${read.board_id}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}"
									+"&comment_id="+$(this).attr("data-comment_id");
				});
					
				
				
			//댓글 삭제 View
				$(".replyDeleteBtn").on("click", function(){
					location.href = "/board/replyDeleteView?board_id=${read.board_id}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&comment_id="+$(this).attr("data-comment_id");
				});
				
			
			})
			
			function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
		}
		
	</script>
	
<body>
<h3 id="name"> 상세보기 </h3>

<div class="list_wrap">
	<form name="readForm" role="form" method="post">
		<input type="hidden" id="board_id" name="board_id" value="${read.board_id}" />
		<input type="hidden" id="page" name="page" value="${scri.page}"> 
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
	</form>
	
		<table class="list">
		
			<tr>
				<td width="100"><label for = "board_title" class="t" >제목</label></td>
				<td><input type="text" id="board_title" name="board_title" value="${read.board_title}" readonly="readonly"/></td>
				<td width="100"><label for = "title" class="t" >조회수</label></td>
				<td><c:out value="${read.views}"/></td>
				
			</tr>
			
			<tr>
				<td width="100"><label for = "userid" class="t" >작성자</label></td>
				<td><input type="text" id="userid" name="userid" value="${read.userid}"  readonly="readonly"/></td>
				<td width="100"><label for = "board_date" class="t" >작성 일자</label></td>
				<td><fmt:formatDate value="${read.board_date}" pattern="yy-MM-dd"/></td>
				
			</tr>
			 <c:forEach var="file" items="${file}">
				<tr>	
				<td width="100"><label for = "file" class="t" >첨부 파일</label></td>
				<td>
					<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						
				</td>			
				</tr>		
			
			</c:forEach>
		
		
			<tr>
				<td colspan="4"><textarea id="board_content" name="board_content" readonly="readonly">
				<c:out value="${read.board_content}" /></textarea></td>
			
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="update_btn" value="수정">
					<input type="button" class="delete_btn" value="삭제">
					<input type="button" class="list_btn" value="목록">
					
					
				</td> 
			</tr>
		
		
			
		</table>
		
	  
	  <!--  
	    
	    <table id="reply" class="list">
	    	<c:forEach items="${replyList}" var="replyList">
	    	
			<tr class="replyList">
				
				<td colspan="5" width="200">
				${replyList.comment_content}</td>
			</tr>
			<tr>
			
				<td width="100"><label for = "title" class="t" >작성자 :</label></td>
				<td width="800">${replyList.userid}</td>
			
				<td colspan="2">
					 
					<input type = "button" class="replyUpdateBtn" data-comment_id="${replyList.comment_id}" value="수정">
					
					<input type = "button" class="replyDeleteBtn" data-comment_id="${replyList.comment_id}" value="삭제" >
				</td>
			</tr>
			</c:forEach>
		</table>
		  
		
		
		<form name="replyForm" method="post">
		  <input type="hidden" id="board_id" name="board_id" value="${read.board_id}" />	  
		  <input type="hidden" id="page" name="page" value="${scri.page}"> 
		  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
		  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
		  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		
			<table class="list">
			<tr>
				<td width="50" ><input type="text"  id="userid" name="userid" /></td>
				<td><input type="text" style="width:700px; height:30px" id="comment_content" name="comment_content" /></td>
				<td> <button type="button" class="replyWriteBtn">작성</button>
					
				</td>
			</tr>
			</table>
		  
		</form>
	   
-->

	</div>

</body>
</html>