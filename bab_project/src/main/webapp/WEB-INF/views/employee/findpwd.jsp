<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- findpwd.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/employee/findpwd.css">
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="j_findpwd_body">
	<section id="j_findpwd_section">
		<div id="j_findpwd_wrap">
			<article id="j_findpwd_article">
				<form action="<%=request.getContextPath()%>/employee/findpwd"
					method="post">
					<table>
						<tr>
							<td><img
								src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png"
								style="width: 230px;"
								onclick = "location.href='<%=request.getContextPath()%>/employee/login'"
								id="j_findpwd_logo"></td>
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
								placeholder="사번을 입력해 주세요." class="j_findpwd_input" required></td>
						</tr>
						<tr>
							<td class="j_findpwd_title j_findpwd_title1">이름</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><input type="text"
								name="emp_name" placeholder="이름을 입력해 주세요."
								class="j_findpwd_input" required></td>
						</tr>
						<tr>
							<td class="j_findpwd_title j_findpwd_title1">아이디</td>
						</tr>
						<tr>
							<td class="j_findpwd_table"><input type="text" name="emp_id"
								placeholder="아이디를 입력해 주세요." class="j_findpwd_input" required></td>
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
				<!-- 결과값 sweetalert창으로 뿌리기  -->
				<c:if test="${check == 0}">
					<script>
					swal({
						  title: "입력하신 정보가 일치하지 않습니다.",
						  text: "확인 후 다시 입력 바랍니다.",
						  icon: "error",
						  closeOnClickOutside: false,
						  closeOnEsc: false
						})
					</script>
				</c:if>
				<c:if test="${check == 1}">
					<script>
					swal({
						  title: "${findpwd.emp_name} 님의 비밀번호는 '${findpwd.emp_pwd}' 입니다.",
						  text: "로그인 페이지로 이동하시겠습니까?",
						  icon: "info",
						  buttons: true,
						  dangerMode: false,
						  closeOnClickOutside: false,
						  closeOnEsc: false
						})
						.then((willDelete) => {
						  if (willDelete) {
						    location.href="<%=request.getContextPath()%>/employee/login"
						  } else {
						    location.href="<%=request.getContextPath()%>/employee/findpwd"
						  }
						});
					</script>
				</c:if>
			</article>
		</div>
	</section>
</body>
</html>