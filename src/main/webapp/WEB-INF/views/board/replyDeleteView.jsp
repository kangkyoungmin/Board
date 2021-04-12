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
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			location.href = "/board/readView?board_id=${replyDelete.board_id}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
		})
		
	})
	</script>
	
<body>
<h3 id="name"> 상세보기 </h3>

<div class="list_wrap">

		 
		<form name="updateForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="board_id" value="${replyDelete.board_id}" readonly="readonly"/>
					<input type="hidden" id="comment_id" name="comment_id" value="${replyDelete.comment_id}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
	
	   

			
	

	</div>

</body>
</html>