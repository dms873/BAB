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
 		<%
		String id = null;
 		String pwd = null;
		Employee vo = (Employee) request.getSession().getAttribute("login");
		
		id = vo.getEmp_id();
		pwd = vo.getEmp_pwd();
		%>
	<div>
		<h1>메일 쓰기</h1>
		
		
		<div>
		<button type="button" class="btn btn-secondary" id="y_btn_insertDo">→보내기</button>
		</div>
		
		
		<form>
 		<input type="hidden" value="<%=id %>" id="y_emp_id" name="y_emp_id">
 		<input type="hidden" value="<%=pwd %>" id="y_emp_pwd" name="y_emp_pwd">
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
				<td colspan="2" style="text-align: left;"><input type="file" class="custom-file-input" id="uploadfile" multiple="multiple"></td>
			</tr>
			<tr >   		
			<td colspan="2" id="y_fileList" style="text-align: left;">
				
			</td>
			</tr>
    		<tr class="y_insert_tr">
    			<td colspan="2" class="y_insert_td"><textarea name="send_content" id="editor" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	</div>
    	</form>
	</div>
	
	<script>
      ClassicEditor.create( document.querySelector( '#editor' ), {
    	  removePlugins: [ 'Heading' ],
    	  language: { ui: 'ko' , content: 'ko' }
      });
    </script>
    
    <script>
    
    	var files = []; // 파일이 저장될 배열
    	var filecount = 0;
    	$('[data-toggle="tooltip"]').tooltip();
    	
    	// 파일선택 시 발생하는 이벤트 처리(전송할 파일 목록에 등록)
    	$("#uploadfile").change(function(event){
    		files[filecount]=event.target.files[0];
    	
    		var printHTML = "<label class='custom-file-label'>첨부파일(" + (filecount+1) + ") " + event.target.files[0].name  + "</label><br>";
    		
    		$("#y_fileList").append(printHTML);
    		
    		filecount++;
    	});

    	
    	$("#y_btn_insertDo").click(function(){
    		var rcv = $("#y_send_receiver").val();
    		var id = $("#y_emp_id").val();
    		var pwd = $("#y_emp_pwd").val();
    		var ttl = $("#y_send_title").val();
    		var ctt = $('.ck.ck-content').html().replace(/<br data-cke-filler="true">/g, "&nbsp;");
			var arraycount = files.length;
			
				// 파일전송을 위한 FormData설정
				var formData = new FormData();
				
				formData.append("send_receiver", rcv);
				formData.append("emp_id", id);
				formData.append("emp_pwd", pwd);
				formData.append("send_title", ttl);
				formData.append("send_content", ctt);
				
				for(var i=0; i<arraycount; i++){
					formData.append("uploadfile", files[i]);
				}
				
				
				if($("#uploadfile").val()){
					$.ajax({
						url : "<%= request.getContextPath() %>/mail/insertFile",
						data : formData,
						processData : false,
						contentType : false,
						type : "post",
						beforeSend : function(){
							$(".warp-loading").removeClass("display-none");
						},
						complete : function(){
							$(".wrap-loading").addClass("display-none");
						},
						success : function(result){
							alert("전송 성공")
							
							$("#y_fileList").empty();
							filecount = 0;
			 			 	$("#menu_mail").get(0).click();
						}
					})	
				} else{
					$.ajax({
						url : "<%= request.getContextPath() %>/mail/insertText",
						data : formData,
						processData : false,
						contentType : false,
						type : "post",
						beforeSend : function(){
							$(".warp-loading").removeClass("display-none");
						},
						complete : function(){
							$(".wrap-loading").addClass("display-none");
						},
						success : function(result){
							alert("전송 성공")
							
			 			 	$("#menu_mail").get(0).click();
						}
					})
				}
	    	});
    </script>
</body>
</html>