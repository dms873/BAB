<%@page import="kh.spring.bab.employee.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
</head>
<style>
	.y_insert_table {
    	width: 100%;
    	border-collapse: collapse;
    	text-align: center;
    	}
	.ck-editor__editable {
  		height: 400px;
  		}
  	.ck-content {
  		font-size: 12px;
  		}
</style>
<body>
<%-- 		<%
		String email = null;
		Employee vo = (Employee) request.getSession().getAttribute("login");
		
		email = vo.getEmp_email();
		%> --%>
	<div>
		<h1>메일 쓰기</h1>
		
		
		<!-- <form action="mail/insert" method="post"> -->
		<div>
		<!-- <input type="submit" value="→보내기" class="btn btn-secondary"> -->
		<button type="button" class="btn btn-secondary" id="y_btn_insertDo">→보내기</button>
		</div>
<!-- 		<input type="hidden" value="dvs0722@naver.com" id="y_send_sender" name="send_sender"> -->
		<div>
		<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td" style="width: 100px;">받는 사람</td>
    			<td class="y_insert_td"><input type="text" class="form-control" id="y_send_receiver" name="send_receiver" style="placeholder='상대방의 이메일을 입력해주세요.'"></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td" style="width: 100px;">제목</td>
				<td class="y_insert_td"><input type="text" class="form-control" id="y_send_title" name="send_title" style="placeholder='제목을 입력해주세요.'"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;"><input type="file"></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td colspan="2" class="y_insert_td"><textarea name="send_content" id="editor" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	</div>
    	<!-- </form> -->
	</div>
	
	<script>
      ClassicEditor.create( document.querySelector( '#editor' ), {
    	  removePlugins: [ 'Heading' ],
    	  language: { ui: 'ko' , content: 'ko' }
      });
    </script>
    
    <script>
    	$("#y_btn_insertDo").click(function(){
    		var rcv = $("#y_send_receiver").val();
    		/* var snd = $("#y_send_sender").val(); */
    		var ttl = $("#y_send_title").val();
    		var ctt = $('.ck.ck-content').html().replace(/<br data-cke-filler="true">/g, "&nbsp;");
			var obj = { "send_receiver" : rcv, "send_title" : ttl, "send_content" : ctt};
			
			
			console.log("rcv : " + rcv);
			console.log("ttl : " + ttl);
			console.log("ctt : " + ctt);
			console.log("obj : " + obj);
			
			
		$.ajax({
			url: "<%= request.getContextPath() %>/mail/insert",
			data : obj,
			type : "post",
			success : function(result){
				console.log(result);
 				$("#menu_mail").get(0).click();
			}
		})
    	});
    </script>
</body>
</html>