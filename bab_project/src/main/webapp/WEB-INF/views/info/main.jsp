<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정_메인</title>
<!-- main.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/info/main.css">
</head>
<body>
	<section id="j_infom_section">
		<div id="j_infom_menu">내 정보 수정</div>
		<hr id="j_infom_line">
		<div id="j_infom_men1">비밀번호 재확인&#10071;</div>
		<div id="j_infom_men2">사원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
		</div>
		<c:if test="${info != null}">
		<form>
			<table id="j_infom_table">
				<tbody id="j_infom_tbody">
					<tr>
						<td class="j_infom_title">사번</td>
						<td class="j_infom_content" colspan="2"><input type="text"
							name="emp_no" class="j_infom_input" value=" ${info.emp_no}" readonly></td>
					</tr>
					<tr>
						<td class="j_infom_title">이름</td>
						<td class="j_infom_content" colspan="2"><input type="text"
							name="emp_name" class="j_infom_input" value=" ${info.emp_name}" readonly></td>
					</tr>
					<tr>
						<td class="j_infom_title">아이디</td>
						<td class="j_infom_content" colspan="2"><input type="text"
							name="emp_id" class="j_infom_input" value=" ${info.emp_id}" readonly></td>
					</tr>
					<tr>
						<td class="j_infom_title">비밀번호 <a id="j_infom_sym">*</a>
						</td>
						<td class="j_infom_content" colspan="2"><input
							type="password" name="emp_pwd" class="j_infom_input" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="j_infom_content"></td>
					</tr>
					<tr>
						<td colspan="2" class="j_infom_content">
							<button type="submit" id="j_infom_submit">확인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</c:if>
	</section>
</body>
</html>