<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>receive mail</title> -->
</head>
<style>
	.y_hover_event {
		cursor: pointer;
	}
 	#y_td_hover:hover {
		text-decoration: underline;
	}	
</style>
<body>
	<section>
       
        <article>

				<div>
					<h1>받은 메일함</h1>
					<div>
						<button type="button" class="btn btn-secondary">읽음</button>
						<button type="button" class="btn btn-secondary">삭제</button>
						<button type="button" class="btn btn-secondary">답장</button>
					</div>
					<div>
					<table class="table table-hover"
						style="vertical-align: middle; text-align: center;">
						<tr>
							<th scope="row"><input type="checkbox"></th>
							<td style="width: 200px; text-align: left;">Naver</td>
							<td id="y_td_hover" style="width: 400px; text-align: left;"><a href="javascript:void(0)" id="y_mail_view" class="y_mail_view">똑!소리나는 BAB 메일 가입을 환영합니다.</a></td>
							<td>2022/05/26</td>
							<td>15.2 KB</td>
						</tr>
						<tr>
							<th scope="row"><input type="checkbox"></th>
							<td style="width: 200px; text-align: left;">Naver</td>
							<td style="width: 400px; text-align: left;">회원가입을 환영합니다.</td>
							<td>2022/05/26</td>
							<td>18.3 KB</td>
						</tr>
					</table>
					</div>
				</div>
		</article>    
    </section>
    
    <script>
 	// 메일 리스트 [제목] 클릭 시 상세보기 페이지 진입
	$(".y_mail_view").click(function(){
		/* var bNo = $(this).parents("tr").children(".y_td_no").text();
		console.log("bNo :" + bNo); */
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/read");
	});
    </script>
</body>
</html>