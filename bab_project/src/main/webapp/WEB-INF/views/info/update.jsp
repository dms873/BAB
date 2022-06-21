<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정_상세보기</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- kakao(daum) 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- update.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/info/update.css">
</head>
<body>
	<section id="j_infod_section">
		<div id="j_infod_menu">내 정보 수정</div>
		<hr id="j_infod_line">
		<form>
			<table id="j_infod_table">
				<tbody id="j_infod_tbody">
					<tr>
						<td class="j_infod_title">프로필 사진</td>
						<td class="j_infod_content"><img
							src="https://via.placeholder.com/60x60" id="j_infod_img"></td>
						<td class="j_infod_content"><input type="file"
							class="j_infod_btn"></td>
					</tr>
					<tr>
						<td class="j_infod_title">사번</td>
						<td class="j_infod_content" colspan="2"><input type="text"
							name="emp_no" class="j_infod_input" readonly></td>
					</tr>
					<tr>
						<td class="j_infod_title">아이디</td>
						<td class="j_infod_content" colspan="2"><input type="text"
							name="emp_id" class="j_infod_input" readonly></td>
					</tr>
					<tr>
						<td class="j_infod_title">새 비밀번호 <a class="j_infod_sym">*</a>
						</td>
						<td class="j_infod_content" colspan="2"><input
							type="password" name="emp_pwd" class="j_infod_input"
							placeholder=" 15자 미만(영어+숫자+특수문자)" required></td>
					</tr>
					<tr>
						<td class="j_infod_title">비밀번호 확인 <a class="j_infod_sym">*</a>
						</td>
						<td class="j_infod_content" colspan="2"><input
							type="password" name="emp_pwdck" class="j_infod_input"
							placeholder=" 새 비밀번호를 다시 입력해주세요." required></td>
					</tr>
					<tr>
						<td class="j_infod_title">이름</td>
						<td class="j_infod_content" colspan="2"><input type="text"
							name="emp_name" class="j_infod_input" readonly></td>
					</tr>
					<tr>
						<td class="j_infod_title">이메일 <a class="j_infod_sym">*</a>
						</td>
						<td class="j_infod_content" colspan="2"><input type="email"
							name="emp_email" class="j_infod_input" required></td>
					</tr>
					<tr>
						<td class="j_infod_title">휴대폰 <a class="j_infod_sym">*</a>
						</td>
						<td class="j_infod_content" colspan="2"><input type="text"
							name="emp_phone" class="j_infod_input" required></td>
					</tr>
					<tr>
						<td class="j_infod_addtitle"></td>
						<td class="j_infod_addcontent"><input type="text" name=""
							id="j_infod_zipcode" placeholder=" 우편번호" required></td>
						<td class="j_infod_addcontent">
							<!-- button onclick 시 kakaopost()메소드 호출 -->
							<button type="button" id="j_infod_zipbtn" class="j_infod_btn" onclick="kakaopost()">우편번호
								찾기</button>
						</td>
					</tr>
					<tr>
						<td class="j_infod_addtitle">주소 <a class="j_infod_sym">*</a>
						</td>
						<td class="j_infod_addcontent" colspan="2"><input type="text"
							name="" class="j_infod_input" placeholder=" 주소" id="j_infod_addr"
							required></td>
					</tr>
					<tr>
						<td class="j_infod_addtitle"></td>
						<td class="j_infod_addcontent" colspan="2"><input type="text"
							name="" class="j_infod_input" placeholder=" 상세주소" required>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="j_infod_content"></td>
					</tr>
					<tr>
						<td colspan="3" class="j_infod_content">
							<button type="submit" id="j_infod_submit">수정</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
	<script>
        //kakao(daum) 주소 API
        function kakaopost(){
        new daum.Postcode({
            //data는 주소 정보를 담고 있는 객체
            oncomplete: function(data) {
                //#j_infod_zipcode에 data.zonecode(우편번호) 값 저장
                document.querySelector("#j_infod_zipcode").value = data.zonecode;
                //#j_infod_zipcode에 data.address(기본주소) 값 저장
                document.querySelector("#j_infod_addr").value = data.address;
            }
        }).open();
    }
    </script>
</body>
</html>