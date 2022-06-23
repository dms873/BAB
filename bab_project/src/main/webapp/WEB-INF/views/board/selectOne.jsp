<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<meta charset="UTF-8">
    <title>공지사항 글쓰기</title>
    <!-- 테이블 -->
    <style>
    	.y_read_table {
    		width: 100%;
    		border-top: 1px solid lightgray;
    		border-collapse: collapse;
    		/* text-align: center; */
    	}
    	
    	.y_read_td, y_read_tr {
    		border-bottom: 1px solid lightgray;
    		border-left: 1px solid lightgray;
    		padding: 10px;
  		}
  		
  		.y_read_td:first-child {
   		 	border-left: none;
 		}
    	
    </style>
    
  </head>
  <body>
  
    <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">글읽기</h1>
		</div>
		
		<hr>
	</div>
    <button class="btn btn-secondary" id="y_btn_back" style="margin: 30px 20px 10px;">목록</button>
	
    <div style="padding: 20px;">
    	<table class="y_read_table">
    		<tr class="y_read_tr">
    			<td class="y_read_td" style="background: #ededed; width: 100px;">No</td>
    			<td class="y_read_td" id="y_read_no" >${readBoard.board_no }</td>
    			<td class="y_read_td" style="background: #ededed; width: 100px;">작성자</td>
				<td class="y_read_td">이대표</td>
    			
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_read_td" style="background: #ededed; width: 100px;">제목</td>
    			<td class="y_read_td">${readBoard.board_title }</td>
				<td class="y_read_td" style="background: #ededed; width: 100px;">작성일</td>
				<td class="y_read_td">${readBoard.board_date }</td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td colspan=4 class="y_read_td">
				<input id="y_hid_title" name="y_hid_title" type="hidden" value="${readBoard.board_title }">
				<input id="y_hid_content" name="y_hid_content" type="hidden" value="${readBoard.board_content }">
    				<div id=y_read_content>
    					<script>
    						var content = $("#y_hid_content").val();
    						console.log("content : "+ content);
    						var tmpStr = content;
    						tmpStr = tmpStr.replaceAll("&lt;","<");
    						tmpStr = tmpStr.replaceAll("&lt;",">");
    						tmpStr = tmpStr.replaceAll("&amp;lt;","<");
    						tmpStr = tmpStr.replaceAll("&amp;gt;",">");
    						tmpStr = tmpStr.replaceAll("&amp;nbsp;"," ");
    						tmpStr = tmpStr.replaceAll("&amp;amp;","&");
    						document.getElementById('y_read_content').innerHTML=tmpStr;
    					</script>
    				</div>
    			</td>
    		</tr>
    	</table>
    	<button class="btn btn-primary" id="y_btn_update" style="margin-top: 10px;">수정</button>
    </div>
    
    <script>
    // 게시글 목록으로 이동
    $("#y_btn_back").click(function(){
    	$("#menu_board").get(0).click();
    });
    
    // 게시글 수정 페이지 이동
    $("#y_btn_update").click(function() {
    	var bNo = $("#y_read_no").text();
       $("#y_board_content").load("<%=request.getContextPath()%>/board/update?board_no="+bNo);
    });
    
    </script>
    
  </body>
</html>