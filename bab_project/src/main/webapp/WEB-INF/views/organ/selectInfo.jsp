<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>사원 상세정보</title> -->
</head>
<body>

	<c:if test="${empty selectInfo }">
		<div style="color: grey;text-align: center;line-height: 800px;">조직도에서 사원을 선택하시면 상세조회가 가능합니다.</div>
	</c:if>
	<c:if test="${not empty selectInfo }">
		<c:if test="${empty selectInfo.emp_file_path }">
			<img src="https://media.discordapp.net/attachments/692994434526085184/981215903570092132/unknown.png">
	    </c:if>
		<c:if test="${not empty selectInfo.emp_file_path }">
			<img style="border-radius: 50%; width: 180px; height: 180px;" src="${selectInfo.emp_file_path }">
		</c:if>
	    <table id="s_organ_table">
	        <tr>
	            <th>이름</th>
	            <td class="s_organ_td">${selectInfo.emp_name }</td>
	            <td><button class="btn btn-outline-primary">쪽지 보내기</button></td>
	            <td><button class="btn btn-outline-primary">메신저 연결</button></td>
	        </tr>
	        <tr>
	            <th>핸드폰</th>
	            <td class="s_organ_td" colspan="3">${selectInfo.emp_phone }</td>
	        </tr>
	        <tr>
	            <th>이메일</th>
	            <td class="s_organ_td">${selectInfo.emp_email }</td>
	            <td colspan="2"><button class="btn btn-outline-primary">메일쓰기</button></td>
	        </tr>
	        <tr>
	            <th>부서</th>
	            <td class="s_organ_td" colspan="3">${selectInfo.dept_name }</td>
	        </tr>
	        <tr>
	            <th>직책</th>
	            <td class="s_organ_td" colspan="3">${selectInfo.job_title }</td>
	        </tr>
	        <tr>
	            <th>내선번호</th>
	            <td class="s_organ_td" colspan="3">${selectInfo.emp_phone }</td>
	        </tr>
	    </table>
    </c:if>

</body>
</html>