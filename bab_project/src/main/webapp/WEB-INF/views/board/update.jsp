<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>공지사항 글수정</title> -->
    <!-- 테이블 -->
    <style>
    	.y_insert_table {
    		width: 100%;
    		border-top: 1px solid lightgray;
    		border-collapse: collapse;
    		text-align: center;
    	}
    	
    	.y_insert_td, y_insert_tr {
    		border-bottom: 1px solid lightgray;
    		border-left: 1px solid lightgray;
    		padding: 10px;
  		}
  		
  		.y_insert_td:first-child {
   		 	border-left: none;
 		}
 		
  		.ck.ck-content{
 			height: 350px;
 		} 
 		
    	
    </style>
    
  </head>
  <body>
  
    <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">글수정</h1>
		</div>
		
		<hr>
	</div>
    <button class="btn btn-secondary" id="y_btn_back" style="margin: 30px 20px 10px;">목록</button>
	<input id="y_input_hidden" type="hidden" value="${updateBoard.board_no }">
    <div style="margin-left: 20px;">
    <%-- <form action="<%= request.getContextPath() %>/board/update" method="POST"> --%>
    	<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">제목</td>
    			<td class="y_insert_td"><input id=board_title name=board_title type="text" class="form-control" value=${updateBoard.board_title }></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td">작성자</td>
				<td class="y_insert_td"><input type="text" class="form-control" value="아무개" name="name" readonly></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">내용</td>
    			<td class="y_insert_td"><textarea name="board_content" id="editor" style="margin: 10px; height: 200px; resize: none;">${updateBoard.board_content }</textarea></td>
    		</tr>
    	</table>
    	<button type="button" class="btn btn-primary" id="y_btn_updateDo" style="margin-top: 10px;">수정</button>
    <!-- </form> -->
    </div>
    
    
    <script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
    <script>
    
    // 공지사항 목록 돌아가기
    $("#y_btn_back").click(function(){
    	$("#menu_board").get(0).click();
    });
    
    // 공지사항 게시글 수정
    $("#y_btn_updateDo").click(function(){
    	var bNo =$("#y_input_hidden").val();
    	console.log("bNo : "+ bNo);
    	var ttl = $("#board_title").val();
    	var ctt = $(".ck.ck-content").text();
    	console.log("ttl : " + ttl +", "+ "ctt : " + ctt);
    	var obj = { "board_no" : bNo, "board_title"  : ttl, "board_content" : ctt};
    	console.log("obj : " + obj)
    	$.ajax({
    		url : "<%= request.getContextPath() %>/board/update",
    		type : "post",
    		data : obj,
    		success : function(result){
    			$("#y_board_content").load("<%=request.getContextPath()%>/board/read?board_no="+bNo);
    			/* $("#y_board_content").html(result); */
    		}
    	})
    })
    </script>
    
  </body>
</html>