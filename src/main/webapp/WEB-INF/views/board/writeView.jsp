<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#bo{
	margin-top:43px;
}
</style>
</head>
<script type="text/javascript">

	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		})
		fn_addFile();
	})
	function fn_valiChk(){
		var regForm = $("form[name='writeForm'] .chk").length;
		for(var i = 0; i<regForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
			
	
		
	</script>
<body id = "bo">

<h3 id="name"> 글쓰기 </h3>

<div class="list_wrap">
	<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
		<table class="list">
			<tr>
				<td ><label for = "board_title" class="t" >제목</label></td>
				<td colspan="4">
				<input type="text" style="width:800px; height:20px" id="board_title" name="board_title" value="" class="chk" title="제목을 입력하세요."/></td>
				
			</tr>
			
			<tr>
				<td><label for = "file" class="t" >첨부 파일</label></td>
				<td width="40"><input type="file" id="file" name="file"></td>
				
				<td><label for = "userid" class="t" >작성자</label></td>
				<td><input name="userid" id="userid" value="${sessionScope.id}"></td>
				
				
			</tr>
			
			<tr>
				<td colspan="5" ><textarea id="board_content" name="board_content" class="chk" title="내용을 입력하세요."></textarea></td>
			
			</tr>
			<tr>
				<td colspan="5">
					<input type="submit" class="write_btn" value="등록">
					<button type="button" onclick="history.back();">취소</button >
					
					
				</td> 
			</tr>
			
		</table>
	
	
	
	
	</form>
</div>



</body>
</html>