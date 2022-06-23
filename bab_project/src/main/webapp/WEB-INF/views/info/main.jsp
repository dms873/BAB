<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정_메인</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- main.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/info/main.css">
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<section id="j_infom_section">
		<div id="j_infom_menu">내 정보 수정</div>
		<hr id="j_infom_line">
		<div id="j_infom_men1">비밀번호 재확인&#10071;</div>
		<div id="j_infom_men2">사원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
		</div>
		<c:if test="${info != null}">
			<form action="<%=request.getContextPath()%>/info/main" method="post">
				<table id="j_infom_table">
					<tbody id="j_infom_tbody">
						<tr>
							<td class="j_infom_title">사번</td>
							<td class="j_infom_content" colspan="2"><input type="text"
								id="emp_no" name="emp_no" class="j_infom_input"
								value="${info.emp_no}" readonly></td>
						</tr>
						<tr>
							<td class="j_infom_title">이름</td>
							<td class="j_infom_content" colspan="2"><input type="text"
								id="emp_name" name="emp_name" class="j_infom_input"
								value="${info.emp_name}" readonly></td>
						</tr>
						<tr>
							<td class="j_infom_title">아이디</td>
							<td class="j_infom_content" colspan="2"><input type="text"
								id="emp_id" name="emp_id" class="j_infom_input"
								value="${info.emp_id}" readonly></td>
						</tr>
						<tr>
							<td class="j_infom_title">비밀번호 <a id="j_infom_sym">*</a>
							</td>
							<td class="j_infom_content" colspan="2"><input
								type="password" id="emp_pwd" name="emp_pwd"
								class="j_infom_input"></td>
						</tr>
						<tr>
							<td colspan="2" class="j_infom_content"></td>
						</tr>
						<tr>
							<td colspan="2" class="j_infom_content">
								<button type="button" id="j_infom_submit">확인</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</c:if>
	</section>
	<script>
        //내정보수정_메인 확인 ajax
        $("#j_infom_submit").click(function() {
        	//비밀번호 공란 체크
        	if($("#emp_pwd").val()==""){
				swal({
                    title: "비밀번호는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_pwd").focus();
                return false;
			}
        	
            var param = {
            	"emp_no": $("#emp_no").val(),
            	"emp_name": $("#emp_name").val(),
                "emp_id": $("#emp_id").val(),
                "emp_pwd": $("#emp_pwd").val()
            }
            console.log(param);
            $.ajax({
                url: "<%=request.getContextPath()%>/info/main",
                data: param,
                type: "post",
                success: function(result) {
                    console.log(result.check);
                    if (result.check == 0) {
                        swal({
                            title: "입력하신 정보가 일치하지 않습니다.",
                            text: "확인 후 다시 입력 바랍니다.",
                            icon: "error",
                            closeOnClickOutside: false,
                            closeOnEsc: false
                        })
                    } else {
                        swal({
                            title: "정보확인 성공!!",
                            text: "내 정보 수정 페이지로 이동합니다.",
                            icon: "success",
                            closeOnClickOutside: false,
                            closeOnEsc: false
                        })
                        .then((willDelete) => {
  						  if (willDelete) {
  							$("#s_content_box").load("<%=request.getContextPath()%>/info/update");
  						  }
  						});
                    }
                }
            })
        });
	</script>
</body>
</html>