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
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
				confirm("수정되었습니다.");
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
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
	
	var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>
	
<body>
<h3 id="name"> 상세보기 </h3>

<div class="list_wrap">
	<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="${update.board_id}" readonly="readonly"/>
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
			<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
	
		<input type="hidden" name="board_id" value="${update.board_id}" readonly="readonly"/>
		<table class="list">
			
			
			<tr>
				<td width="100" ><label for = "board_title" class="t">제목</label></td>
				<td><input type="text" id="board_title" name="board_title" value="${update.board_title}" class="chk" title="제목을 입력하세요."/></td>
				<td width="100" ><label for = "title" class="t" >조회수</label></td>
				
				<td><c:out value="${read.views}"/></td>
				
			</tr>
			
			<tr>
				<td width="100" ><label for = "userid" class="t" >작성자</label></td>
				<td><input type="text" id="userid" name="userid" value="${update.userid}" readonly="readonly"/></td>
				<td width="100" ><label for = "board_date" class="t" >작성 일자</label></td>
				<td><fmt:formatDate value="${update.board_date}" pattern="yy-MM-dd"/></td>
				
			</tr>
			
			<tr>
				<c:forEach var="file" items="${file}" varStatus="var">
				<td width="100" ><label for = "file" class="t" >첨부 파일</label></td>
				<td id="fileIndex">
				
					<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
					<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
					<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
					<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
				
				</td>
				<!-- <td><button type="button" class="fileAdd_btn">파일추가</button></td>-->
				</c:forEach>
			</tr>				
			
			
			<tr>
				<td colspan="4"><textarea id="board_content" name="board_content" class="chk" title="내용을 입력하세요">
				<c:out value="${update.board_content}" /></textarea></td>
			
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" class="update_btn" value="저장">
					<input type="submit" class="cancel_btn" value="취소">
					
					
					
				</td> 
			</tr>
			
		</table>
	
		
	
	
	
	</form>
		</div>

</body>
</html>