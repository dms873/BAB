<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>정보 수정_상세보기</title> -->
<!-- update.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/info/update.css">
</head>
<body>
	<section id="j_infod_section">
		<div id="j_infod_menu">내 정보 수정</div>
		<hr id="j_infod_line">
		<c:if test="${update != null}">
			<form action="<%=request.getContextPath()%>/info/update"
				method="post">
				<table id="j_infod_table">
					<tbody id="j_infod_tbody">
						<tr>
							<td class="j_infod_title">프로필 사진<a class="j_infod_sym">*</a></td>
							<td class="j_infod_content"><img
								src="https://via.placeholder.com/60x60" id="j_infod_img" name="emp_file_path"></td>
							<td class="j_infod_content">
							<input type="hidden"
								role="uploadcare-uploader"
   								data-public-key="318e0db7c626903e59e3"
    							data-tabs="file camera url"
								id="emp_file_path">
							</td>
						</tr>
						<tr>
							<td class="j_infod_title">사번</td>
							<td class="j_infod_content" colspan="2"><input type="text"
								id="emp_no" name="emp_no" class="j_infod_input"
								value="${update.emp_no}" readonly></td>
						</tr>
						<tr>
							<td class="j_infod_title">아이디</td>
							<td class="j_infod_content" colspan="2"><input type="text"
								id="emp_id" name="emp_id" class="j_infod_input"
								value="${update.emp_id}" readonly></td>
						</tr>
						<tr>
							<td class="j_infod_title">새 비밀번호 <a class="j_infod_sym">*</a>
							</td>
							<td class="j_infod_content" colspan="2"><input
								type="password" id="emp_pwd" name="emp_pwd"
								class="j_infod_input" placeholder="15자 미만(영어+숫자+특수문자)"></td>
						</tr>
						<tr>
							<td class="j_infod_title">비밀번호 확인 <a class="j_infod_sym">*</a>
							</td>
							<td class="j_infod_content" colspan="2"><input
								type="password" id="emp_repwd" name="emp_repwd"
								class="j_infod_input" placeholder="새 비밀번호를 다시 입력해주세요."></td>
						</tr>
						<tr>
							<td class="j_infod_title">이름</td>
							<td class="j_infod_content" colspan="2"><input type="text"
								id="emp_name" name="emp_name" class="j_infod_input"
								value="${update.emp_name}" readonly></td>
						</tr>
						<tr>
							<td class="j_infod_title">이메일 <a class="j_infod_sym">*</a>
							</td>
							<td class="j_infod_content" colspan="2"><input type="email"
								id="emp_email" name="emp_email" class="j_infod_input"
								value="${update.emp_email}"></td>
						</tr>
						<tr>
							<td class="j_infod_title">휴대폰 <a class="j_infod_sym">*</a>
							</td>
							<td class="j_infod_content" colspan="2"><input type="text"
								id="emp_phone" name="emp_phone" class="j_infod_input"
								placeholder="010-XXXX-XXXX 형식으로 입력해주세요." value="${update.emp_phone}"></td>
						</tr>
						<tr>
							<td class="j_infod_addtitle"></td>
							<td class="j_infod_addcontent" style="width:68px"><input type="text"
								id="emp_zipcode" name="emp_zipcode" class="j_infod_zipcode"
								placeholder="우편번호" value="${update.emp_zipcode}"></td>
							<td class="j_infod_addcontent">
								<!-- button onclick 시 kakaopost()메소드 호출 -->
								<button type="button" id="j_infod_zipbtn" class="j_infod_btn"
									onclick="kakaopost()">우편번호 찾기</button>
							</td>
						</tr>
						<tr>
							<td class="j_infod_addtitle">주소 <a class="j_infod_sym">*</a>
							</td>
							<td class="j_infod_addcontent" colspan="2"><input
								type="text" id="emp_address" name="emp_address"
								class="j_infod_input" placeholder="주소"
								value="${update.emp_address}"></td>
						</tr>
						<tr>
							<td class="j_infod_addtitle"></td>
							<td class="j_infod_addcontent" colspan="2"><input
								type="text" id="emp_daddress" name="emp_daddress"
								class="j_infod_input" placeholder="상세주소"
								value="${update.emp_daddress}"></td>
						</tr>
						<tr>
							<td colspan="3" class="j_infod_content"></td>
						</tr>
						<tr>
							<td colspan="3" class="j_infod_content">
								<button type="button" id="j_infod_submit">수정</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</c:if>
	</section>
	<script>
        //내정보수정_업데이트 ajax
        $("#j_infod_submit").click(function() {
        	
        	var pwdCk = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{3,15}$/;
        	var repwdCk = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{3,15}$/;
        	var phoneCk = /^01([0])-([0-9]{4})-([0-9]{4})$/;
        	
        	/* //프로필사진 공란 체크
        	if($("#emp_profile").val()==""){
				swal({
                    title: "비밀번호는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_pwd").focus();
                return false;
			} */
        	
        	//새 비밀번호 공란 체크
        	if($("#emp_pwd").val()==""){
				swal({
                    title: "비밀번호는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_pwd").focus();
                return false;
			}
			
        	//새 비밀번호 유효성 체크
        	//.test():찾는 문자열이 들어있는지 아닌지를 알려줌(boolean)
        	if(!pwdCk.test($("#emp_pwd").val())){
				swal({
                    title: "새 비밀번호 형식 불일치!!",
                    text: "15자 미만(영어+숫자+특수문자) 형식으로 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_pwd").focus();
                return false;
			}
        	
        	//비밀번호 확인 공란 체크
        	if($("#emp_repwd").val()==""){
				swal({
                    title: "비밀번호 확인은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_pwdck").focus();
                return false;
			}
        	
        	//배밀번호 확인 유효성 체크
        	if(!pwdCk.test($("#emp_repwd").val())){
				swal({
                    title: "비밀번호 형식 불일치!!",
                    text: "15자 미만(영어+숫자+특수문자) 형식으로 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_repwd").focus();
                return false;
			}
        	
        	//이메일 공란 체크
        	if($("#emp_email").val()==""){
				swal({
                    title: "이메일은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_email").focus();
                return false;
			}
        	
        	//휴대폰 공란 체크
        	if($("#emp_phone").val()==""){
				swal({
                    title: "휴대폰 번호는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_phone").focus();
                return false;
			}
        	
        	//휴대폰 번호 유효성 체크
        	if(!phoneCk.test($("#emp_phone").val())){
				swal({
                    title: "휴대폰 번호 형식 불일치!!",
                    text: "010-XXXX-XXXX 형식으로 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_phone").focus();
                return false;
			}
        	
        	//우편번호 공란 체크
        	if($("#emp_zipcode").val()==""){
				swal({
                    title: "우편번호는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_zipcode").focus();
                return false;
			}
        	
        	//주소 공란 체크
        	if($("#emp_address").val()==""){
				swal({
                    title: "주소는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_address").focus();
                return false;
			}
        	
        	//상세주소 공란 체크
        	if($("#emp_daddress").val()==""){
				swal({
                    title: "상세주소는 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#emp_daddress").focus();
                return false;
			}
        	
        	if($("#emp_pwd").val() == $("#emp_repwd").val()){
            var param = {
            	"emp_no": $("#emp_no").val(),
                "emp_pwd": $("#emp_pwd").val(),
                "emp_email": $("#emp_email").val(),
                "emp_phone": $("#emp_phone").val(),
                "emp_zipcode": $("#emp_zipcode").val(),
                "emp_address": $("#emp_address").val(),
                "emp_daddress": $("#emp_daddress").val()    
            }
            console.log(param);
            $.ajax({
                url: "<%=request.getContextPath()%>/info/update",
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
                            title: "내 정보 수정 완료!!",
                            text: "그룹웨어 메인페이지로 이동합니다.",
                            icon: "success",
                            closeOnClickOutside: false,
                            closeOnEsc: false
                        })
                        .then((willDelete) => {
  						  if (willDelete) {
  							//뒤로가기 시 내정보수정 페이지로 바로 진입 못하게 하려고 replace로 덮어쓰기함
  						    location.replace("<%=request.getContextPath()%>/main")
  						  }
  						})
                    }
                }
            //새 비밀번호와 비밀번호 확인 일치하지 않음
            })}else{
            	 swal({
                     title: "새 비밀번호와 확인이 일치하지 않습니다. ",
                     text: "확인 후 다시 입력 바랍니다.",
                     icon: "error",
                     closeOnClickOutside: false,
                     closeOnEsc: false
                 })
            }
        });
	</script>
	<script>
		//kakao(daum) 주소 API
		function kakaopost() {
			new daum.Postcode({
						//data는 주소 정보를 담고 있는 객체
						oncomplete : function(data) {
							//#j_infod_zipcode에 data.zonecode(우편번호) 값 저장
							document.querySelector("#emp_zipcode").value = data.zonecode;
							//#j_infod_zipcode에 data.address(기본주소) 값 저장
							document.querySelector("#emp_address").value = data.address;
						}
					}).open();
		}
	</script>
	<script>
	//uploadcare url불러오기
	//role의 값이 uploadcare-uploader인 태그를 업로드 위젯으로 만들기
	 const widget = uploadcare.Widget('[role=uploadcare-uploader]');
	//그 위젯을 통해서 업로드가 끝났을 때 url 불러오기
	 widget.onUploadComplete(info => {
		 console.log(info.cdnUrl);
	 });
	</script>
</body>
</html>