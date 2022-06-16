<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>사원 상세정보</title>
</head>
<body>

	<c:if test="${empty selectInfo }">
		<div style="color: grey;text-align: center;line-height: 800px;">조직도에서 사원을 선택하시면 상세조회가 가능합니다.</div>
	</c:if>
	<c:if test="${!empty selectInfo }">
	<img src="https://media.discordapp.net/attachments/692994434526085184/981215903570092132/unknown.png">
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