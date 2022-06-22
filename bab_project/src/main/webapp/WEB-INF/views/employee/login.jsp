<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="j_login_body">
	<section id="j_login_section">
		<div id="j_login_wrap">
			<article id="j_login_article">
				<form action="<%=request.getContextPath()%>/employee/login"
					method="post">
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
								name="emp_no" placeholder="사번" class="j_login_input"
								id="emp_no" required></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><input type="text"
								name="emp_id" placeholder="아이디" class="j_login_input"
								id="emp_id" required></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><input type="password"
								name="emp_pwd" placeholder="비밀번호" class="j_login_input"
								required></td>
						</tr>
						<tr>
							<td colspan="3" id="j_login_check"><input type="checkbox"
								id="checkbox"> 계정 저장</td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"></td>
						</tr>
						<tr>
							<td class="j_login_table"><button type="button"
									class="j_login_btn"
									onclick="location.href='<%=request.getContextPath()%>/employee/findid'">아이디
									찾기</button></td>
							<td>|</td>
							<td class="j_login_table"><button type="button"
									class="j_login_btn"
									onclick="location.href='<%=request.getContextPath()%>/employee/findpwd'">비밀번호
									찾기</button></td>
						</tr>
						<tr>
							<td colspan="3" class="j_login_table"><button type="submit"
									id="j_login_submit" onclick="loginProcess();">로그인</button></td>
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
						  title: "로그인 성공!!",
						  text: "그룹웨어 메인페이지로 이동합니다.",
						  icon: "success",
						  closeOnClickOutside: false,
						  closeOnEsc: false
						})
						.then((willDelete) => {
						  if (willDelete) {
						    location.href="<%=request.getContextPath()%>/main/"
						  }
						});
					</script>
				</c:if>
			</article>
		</div>
	</section>
	<script>
		//사원번호, 아이디 세션 저장
		//쿠키값 읽어오기
		$(function(){
			var no = getCookie("Cookie_no");
			var id = getCookie("Cookie_id");
			//쿠키가 있으면 체크박스를 체크해준 상태로 페이지 로드
		  	if(no){
				$("#emp_no").val(no);
				$("#emp_id").val(id);
				$("#checkbox").attr("checked", true);
		  	}
		});
		//로그인 버튼 클릭 시 실행될 메소드
	 	function loginProcess(){
			var no = $("#emp_no").val();
		 	var id = $("#emp_id").val();
		 	var check = $("#checkbox").is(":checked");//체크박스가 체크되어있는지 true/false로 담김
		 
		 	//check가 true이면
		 	if(check){
		 		setCookie("Cookie_no", no, 7);	//Cookie_no에 no를 7일 저장
			 	setCookie("Cookie_id", id, 7);	//Cookie_id에 id를 7일 저장
		 	//check가 false이면
		 	}else{
			 	deleteCookie("Cookie_no");	//Cookie_no 쿠키 지우기
			 	deleteCookie("Cookie_id"); //Cookie_id 쿠키 지우기
		 	}
	 	};
	 	//쿠키값 저장
		function setCookie(cookieName, value, exdays){
		  	var exdate = new Date();
		  	exdate.setDate(exdate.getDate() + exdays);
		  	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		 	document.cookie = cookieName + "=" + cookieValue;
		}
			 
	    //쿠키값 조회
		function getCookie(cookieName) {
		  	cookieName = cookieName + '=';
		  	var cookieData = document.cookie;
		  	var start = cookieData.indexOf(cookieName);
		  	var cookieValue = '';
		  
		  	if(start != -1){
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
		  		if(end == -1)end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
		  	}
		  	return unescape(cookieValue);
		}
		
		//쿠키값 지우기
		function deleteCookie(cookieName){
		  	var expireDate = new Date();
		  	expireDate.setDate(expireDate.getDate() - 1);
		  	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
</script>
</body>
</html>