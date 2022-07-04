<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div>
		<h1>메일 쓰기</h1>
		
		<div>
		<button type="button" class="btn btn-secondary">→보내기</button>
		</div>
		
		<div>
		<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td" style="width: 100px;">받는 사람</td>
    			<td class="y_insert_td"><input type="text" class="form-control" id="board_title" name="board_title"></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td" style="width: 100px;">제목</td>
				<td class="y_insert_td"><input type="text" class="form-control" id="board_writer" name="board_writer"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;"><input type="file"></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<!-- <td class="y_insert_td"></td> -->
    			<td colspan="2" class="y_insert_td"><textarea name="board_content" id="editor" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	</div>
	</div>
	
	<script>
      ClassicEditor.create( document.querySelector( '#editor' ), {
    	  removePlugins: [ 'Heading' ],
    	  language: { ui: 'ko' , content: 'ko' }
      });
    </script>
</body>
</html>