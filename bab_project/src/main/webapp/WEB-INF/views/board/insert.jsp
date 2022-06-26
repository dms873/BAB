<%@page import="kh.spring.bab.employee.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <title>공지사항 글쓰기</title> -->
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
 		
  		.ck-editor__editable {
  			height: 400px;
  		}
  		.ck-content {
  			font-size: 12px;
  		}
 		
    	
    </style>
    
  </head>
  <body>
  
		<%
		// 현재 세션 값 담기
		String id = null;
		String name = null;
		
		Employee vo = (Employee) request.getSession().getAttribute("login");
		
		name = vo.getEmp_name();
	
		%>
  
  
    <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">글쓰기</h1>
		</div>
		
		<hr>
	</div>
    <button class="btn btn-secondary" id="y_btn_back" style="margin: 30px 20px 10px;">목록</button>
	
    <div style="margin-left: 20px;">
    <%-- <form id="y_board_insert" action="<%=request.getContextPath()%>/board/insert" method="POST"> --%>
    	<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">제목</td>
    			<td class="y_insert_td"><input type="text" class="form-control" id="board_title" name="board_title"></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td">작성자</td>
				<td class="y_insert_td"><input type="text" class="form-control" value="<%=name %>" id="board_writer" name="board_writer" readonly></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">내용</td>
    			<td class="y_insert_td"><textarea name="board_content" id="editor" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	<button type="button" class="btn btn-primary btnChk" id="y_btn_insertDo" style="margin-top: 10px;">확인</button>
    <!-- </form> -->
    </div>
    
    
    <script>
      ClassicEditor.create( document.querySelector( '#editor' ), {
    	  removePlugins: [ 'Heading' ],
    	  language: { ui: 'ko' , content: 'ko' }
      });
    </script>
    <script>
	    $("#y_btn_back").click(function(){
	    	$("#menu_board").get(0).click();
	    });
    	
    	$("#y_btn_insertDo").click(function() {
    		var ttl = $("#board_title").val();
    		var wrt = $("#board_writer").val();
    		var ctt = $('.ck.ck-content').html().replace(/<br data-cke-filler="true">/g, "&nbsp;");
    		var obj = { "board_title" : ttl, "board_writer" : wrt, "board_content" : ctt};
    		console.log("obj : "+obj);
    		
    	$.ajax({
    		url: "<%= request.getContextPath() %>/board/insert",
    		data : obj,
    		type : "post",
    		success : function(result){
    			console.log(result);
    			$("#menu_board").get(0).click();
    		}
    	})
    });
    
    </script>
    
  </body>
</html>