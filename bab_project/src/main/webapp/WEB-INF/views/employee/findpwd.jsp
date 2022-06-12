<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- findpwd.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/employee/findpwd.css">
</head>
<body id="j_findpwd_body">
	<section id="j_findpwd_section">
		<div id="j_findpwd_wrap">
			<article id="j_findpwd_article">
				<form action="">
					<table>
						<tr>
							<td><img
								src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png"
								style="width: 230px;"></td>
						</tr>
						<tr>
							<td class="j_findpwd_table" id="j_findpwd_table1">비밀번호 찾기</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"></td>
						</tr>
						<tr>
							<td class="j_findpwd_title">사번</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><input type="text" name="emp_no"
								placeholder=" 사번을 입력해 주세요." class="j_findpwd_input" required></td>
						</tr>
						<tr>
							<td class="j_findpwd_title j_findpwd_title1">이름</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><input type="text"
								name="emp_name" placeholder=" 이름을 입력해 주세요."
								class="j_findpwd_input" required></td>
						</tr>
						<tr>
							<td class="j_findpwd_title j_findpwd_title1">아이디</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><input type="text" name="emp_id"
								placeholder=" 아이디를 입력해 주세요." class="j_findpwd_input" required></td>
						</tr>
						<tr>
							<td class="j_findpwd_table"></td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><button type="submit"
									id="j_findpwd_submit">비밀번호 찾기</button></td>
						</tr>
					</table>
				</form>
			</article>
		</div>
	</section>
</body>
</html>