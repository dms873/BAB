<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- findid.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/employee/findid.css">
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="j_findid_body">
	<section id="j_findid_section">
		<div id="j_findid_wrap">
			<article id="j_findid_article">
				<form action="<%=request.getContextPath()%>/employee/findid"
					method="post">
					<table>
						<tr>
							<td><img
								src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png"
								style="width: 230px;"
								onclick = "location.href='<%=request.getContextPath()%>/employee/login'"
								id="j_findid_logo"></td>
						</tr>
						<tr>
							<td class="j_findid_table" id="j_findid_table1">아이디 찾기</td>
						</tr>
						<tr>
							<td class="j_findid_table"></td>
						</tr>
						<tr>
							<td class="j_findid_title">사번</td>
						</tr>
						<tr>
							<td class="j_findid_table"><input type="text" name="emp_no"
								placeholder="사번을 입력해 주세요." class="j_findid_input" required>
							</td>
						</tr>
						<tr>
							<td class="j_findid_title" id="j_findid_title1">이름</td>
						</tr>
						<tr>
							<td class="j_findid_table"><input type="text"
								name="emp_name" placeholder="이름을 입력해 주세요."
								class="j_findid_input" required></td>
						</tr>
						<tr>
							<td class="j_findid_table"></td>
						</tr>
						<tr>
							<td class="j_findid_table">
								<button type="submit" id="j_findid_submit">아이디 찾기</button>
							</td>
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
						  title: "${findid.emp_name} 님의 아이디는 '${findid.emp_id}' 입니다.",
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
						    location.href="<%=request.getContextPath()%>/employee/findid"
						  }
						});
					</script>
				</c:if>
			</article>
		</div>
	</section>
</body>
</html>