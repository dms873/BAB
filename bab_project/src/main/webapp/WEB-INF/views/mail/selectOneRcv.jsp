<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<div>
	<button id="y_btn_back" class="btn btn-secondary" type="button">목록</button>
</div>
    <div style="padding: 20px;">
    	<hr>
    	<h4>${readMail.rec_title }</h4>
    	<div>
    		<span style="font-weight: bold;">보낸사람 : </span><span>${readMail.rec_sender }</span>
    	</div>
    	<div>
    		<span style="font-weight: bold;">받는사람 : </span><span>${readMail.rec_receiver }</span>
    	</div>
    	<hr>
 	
 		
 		<div>
 			${readMail.rec_content }
 		</div>
    </div>
    
    <script>
 	// 게시글 목록으로 이동
    $("#y_btn_back").click(function(){
     	$("#y_rcv_mail").get(0).click();
    });
    
    </script>
</body>
</html>