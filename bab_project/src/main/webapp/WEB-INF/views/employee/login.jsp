<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- login.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/employee/login.css">
</head>
<body id="j_login_body">
	<section id="j_login_section">
		<div id="j_login_wrap">
			<article id="j_login_article">
				<form action="">
					<table>
						<tr>
							<td colspan="3"><img
								src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png"
								style="width: 230px;"></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><input type="text"
								name="emp_no" placeholder=" 사번" class="j_login_input" required></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><input type="text"
								name="emp_id" placeholder=" 아이디" class="j_login_input" required></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><input type="text"
								name="emp_pwd" placeholder=" 비밀번호" class="j_login_input"
								required></td>
						</tr>
						<tr>
							<td colspan="3" id="j_login_check"><input type="checkbox">
								계정 저장</td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"></td>
						</tr>
						<tr>
							<td class="j_login_table"><button type="button"
									class="j_login_btn">아이디 찾기</button></td>
							<td>|</td>
							<td class="j_login_table"><button type="button"
									class="j_login_btn">비밀번호 찾기</button></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><button type="submit"
									id="j_login_submit">로그인</button></td>
						</tr>
					</table>
				</form>
			</article>
		</div>
	</section>
</body>
</html>