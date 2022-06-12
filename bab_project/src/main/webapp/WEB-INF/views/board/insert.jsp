<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="utf-8">
    <title>CKEditor</title>
  </head>
  <body>
    <h1>글쓰기</h1>
    <form action="" method="POST">
    	<div>제목 : <input type="text" ></div>
      <textarea name="text" id="editor"></textarea>
    <p><input type="submit" value="전송"></p>
    </form>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
  </body>
</html>