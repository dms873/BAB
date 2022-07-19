<%@page import="kh.spring.bab.employee.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 업로드케어 CDN -->
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
    <script>UPLOADCARE_LOCALE = "ko"</script>
    <!-- datepicker CDN -->
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<!-- <title>전자결재(휴가신청서)상세조회</title> -->
<style>
	.s_frm_title {
	    font-size: 1em;
	    font-weight: bold;
	    padding: 5px 0;
	}
	
	.s_div_container {
		overflow: auto;
	}
	
	#s_eap_draft_info tr th {
		width: 100px;
	}
	
	#s_eap_draft_info tr th, #s_eap_draft_info tr td,
	#s_eap_draft tr th, #s_eap_draft tr td,
	.s_eap_draft_app tr th, .s_eap_draft_app tr td
	 {
		padding: 5px;
		border: 1px solid;
		font-size: .9em;
	}
	
	#s_eap_draft td, .s_eap_draft_app td {
		width: 100px;
		text-align: center;
	}
	
	#s_eap_draft_info tr th,
	#s_eap_draft tr th,
	.s_eap_draft_app tr th {
		background-color: gainsboro;
		text-align: center;
		
	}
	
	#s_eap_draft tr th,
	.s_eap_draft_app tr th {
		width: 50px;
	}
</style>
<style>
	.s_div {
	    margin: 20px;
	}
	
	.s_span_fw {
		font-weight: bold;
	}
	
	#s_eap_content_box_right {
		width: 180px;
		float: left;
		margin-top: 20px;
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 10px;
		margin-left: 20px;
		height: 900px;
	}

	#s_eap_content_box_left {
		width: 900px;
		float: left;
		margin-top: 20px;
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 10px;
		height: 900px;
	}
</style>
<!-- SweetAlert -->
<style>
	/*모달창  */
	.swal-modal {
		background-color: white;
		border: 3px solid white;
	}
	/*ok버튼  */
	.swal-button--danger {
		background-color: #0583F2;
		color: white;
	}
	/*cancel버튼  */
	.swal-button--cancel {
		background-color: red;
		color: white;
	}
	/*ok버튼  */
	.swal-button--confirm {
		background-color: #0583F2;
		color: white;
	}
	/*아이콘 테두리  */
	.swal-icon--info {
		border-color: #0583F2;
	}
	/*아이콘 i 윗부분  */
	.swal-icon--info:after {
		background-color: #0583F2;
	}
	/*아이콘 i 아랫부분  */
	.swal-icon--info:before {
		background-color: #0583F2;
	}
	/*타이틀  */
	.swal-title {
		font-size: 20px;
		color: black;
	}
	/*텍스트  */
	.swal-text {
		color: black;
	}
	
	/* 스크롤바 디자인 */
	.s_scroll::-webkit-scrollbar {
    	width: 10px;  /* 스크롤바의 너비 */
	}
	
	.s_scroll::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #34343482; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	.s_scroll::-webkit-scrollbar-track{
	    background: #4747471a;  /*스크롤바 뒷 배경 색상*/
	}
</style>
</head>
<body>

	<%
		// 로그인 한 정보
		String empNo = null;
		String empName = null;
		Employee vo = (Employee) request.getSession().getAttribute("login"); 
		empNo = vo.getEmp_no();
		empName = vo.getEmp_name();
		
	%>
	<!-- check라는 변수명에 el태그를 값으로 넣어 -->
	<c:set var="check" value="${readHoDoc.emp_no }"/>
	<!-- 결재상태 체크 변수 선언 -->
	<c:set var="eapStaCheck" value="${readHoDoc.eap_sta_code }"></c:set>
	<!-- 기안자 이름 체크 변수 선언 -->
	<c:set var="eapNameCheck" value="${readHoDoc.emp_name }"></c:set>
	
	<% 
		// 메뉴 if문에 들어갈 변수 선언
		boolean emp_name = empName.equals(pageContext.getAttribute("eapNameCheck").toString());
		String eap_sta_check = pageContext.getAttribute("eapStaCheck").toString();
	%>
	<div id="s_btn">
		<!-- pageContext.getAttribute(변수명).toString()으로 꺼내서 사용 가능 -->
		<!-- 기안자와 로그인한 사람의 이름이 같고 반려상태일 때 -->
		<% if(emp_name == true && eap_sta_check.equals("R")) { %>
			<span><a id="s_opinion_btn" href="#" onclick="opinion()">반려 사유 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
			<!-- 기안자와 로그인한 사람의 이름이 같고 결재완료 또는 진행중일 때 -->
		<% } else if(emp_name == true && (eap_sta_check.equals("F") || eap_sta_check.equals("O"))) { %>
			<span><a id="s_list_btn" href="#" onclick="list()">| 목록 |</a></span>
			<!-- 기안자와 로그인한 사람의 이름이 다르고 반려일 때 -->
		<% } else if(emp_name == false && eap_sta_check.equals("R")) { %>
			<span><a id="s_opinion_btn" href="#" onclick="opinion()">반려 사유 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
			<!-- 기안자와 로그인한 사람의 이름이 다르고 결재완료일 때 -->
		<% } else if(emp_name == false && eap_sta_check.equals("F")) { %>
			<span><a id="s_list_btn" href="#" onclick="list()">| 목록 |</a></span>
			<!-- 로그인한 사람의 사번과 결재자의 사번이 같을 때 -->
		<% } else if(empNo.equals(pageContext.getAttribute("check").toString()) == true) { %>
			<span><a id="s_eap_cancle" href="#">결재회수 | </a></span>
			<span><a id="s_eap_update" href="#">문서 수정 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
		<% } else { %>
			<span><a id="s_approval_btn" href="#" onclick="approval()">결재 승인 | </a></span>
			<span><a id="s_reject_btn" href="#" data-bs-toggle="modal" data-bs-target="#Modal">결재 반려 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
		<% } %>
	</div>
	
	<div id="s_eap_content_box_left">
		<div class="s_div_container s_scroll" style="height: 800px;">
			<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">휴가신청서</div>
			
			<div style="float: left; width: 230px; margin: 0 30px;">
				<table border="1" id="s_eap_draft_info">
						<tr>
							<th>기안자</th>
							<td>${readHoDoc.emp_name }</td>
						</tr>
						<tr>
							<th>기안부서</th>
							<td>${readHoDoc.dept_name }</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td>
								<!-- 기안일 timestamp라서 년월일만 출력 -->
								<c:set var="eap_draft_date" value="${readHoDoc.eap_draft_date }"/>
								${fn:substring(eap_draft_date,0,10) }
							</td>
						</tr>
						<tr>
							<th>문서번호</th>
							<td id="s_dfNo">${readHoDoc.df_no }</td>
						</tr>
					</table>
			</div>
			
			<div style="float: left;width: 130px; margin-right: 10px;">
				<table border="1" id="s_eap_draft">
					<tr>
						<th rowspan="2">신청</th>
						<td>${readHoDoc.job_title }</td>
					</tr>
					<tr>
						<td>${readHoDoc.emp_name }</td>
					</tr>
				</table>
			</div>
			
			<div style="float: left;width: 130px; margin-right: 5px;">
				<!-- 첫번째 승인자 정보 -->
				<c:if test="${not empty firstAp }">
					<table border="1" class="s_eap_draft_app">
						<tr>
							<th rowspan="3">승인</th>
							<td>${firstAp.job_title }</td>
						</tr>
						<tr>
							<td>${firstAp.emp_name }</td>
						</tr>
						<tr>
							<td>
								<!-- 결재선 단계가 1이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
								<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1 이상이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
								<c:if test="${readHoDoc.eap_step >= 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2 이상이고 결재 상태 코드가 반려일 때(승인상태) -->
								<c:if test="${readHoDoc.eap_step >= 2 && readHoDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/992095931640057866/stamp_7.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</c:if>
			</div>
			<div style="float: left;width: 130px; margin-right: 5px;">
				<!-- 두번째 승인자 정보 -->
				<c:if test="${not empty midAp }">
					<table border="1" class="s_eap_draft_app">
						<tr>
							<th rowspan="3">승인</th>
							<td>${midAp.job_title }</td>
						</tr>
						<tr>
							<td>${midAp.emp_name }</td>
						</tr>
						<tr>
							<td>
								<!-- 결재선 단계가 1이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
								<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2이고 결재 상태 코드가 진행중이거나 결재완료일 때(대기상태) -->
								<c:if test="${readHoDoc.eap_step == 2 && readHoDoc.eap_sta_code eq 'O' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
								<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'R' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
								<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(승인상태) -->
								<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readHoDoc.eap_step == 2 && readHoDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/992095931640057866/stamp_7.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</c:if>
			</div>
			<div style="float: left;width: 130px; margin-right: 5px;">
				<!-- 세번째 승인자 정보 -->
				<c:if test="${not empty finalAp }">
					<table border="1" class="s_eap_draft_app">
						<tr>
							<th rowspan="3">승인</th>
							<td>${finalAp.job_title }</td>
						</tr>
						<tr>
							<td>${finalAp.emp_name }</td>
						</tr>
						<tr>
							<td>
								<!-- 결재선 단계가 1이상이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
								<c:if test="${readHoDoc.eap_step >= 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2보다 작고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
								<c:if test="${readHoDoc.eap_step <= 2 && readHoDoc.eap_sta_code eq 'R' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 결재완료일 때(승인상태) -->
								<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/992095931640057866/stamp_7.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</c:if>
			</div>
			
		
				<div style="padding: 50px 10px 20px; clear: both;">
					<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : <span id="s_ho_tt">${readHoDoc.eap_title }</span></div> 
				</div>
				
				<div style="border: 1px solid lightgray; margin: 10px;"></div>
				<div style="margin: 0 10px;">
				
					<div style="padding: 10px 0;">
						<div class="s_frm_title">1. 종류</div>
						<div id="s_kind">
							<div class="form-check" style="display: inline-block;">
							  <c:if test="${hoInfo.ho_code eq 'A' }">
								  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="A">
								  <label class="form-check-label" for="flexRadioDefault1">
								    연차
								  </label>
							  </c:if>
							</div>
							<div class="form-check" style="display: inline-block;">
							  <c:if test="${hoInfo.ho_code eq 'H' }">
								  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked value="H">
								  <label class="form-check-label" for="flexRadioDefault2">
								    반차
								  </label>
							  </c:if>
							</div>
						</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">2. 내용</div>
						<div id="s_eap_content">${readHoDoc.eap_content }</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">3. 신청기간</div>
						<div id="s_ho_dt">
							<div style="display: inline-block;">
								<!-- 신청기간 timestamp라서 년월일 시분만 출력 -->
								<c:set var="ho_start" value="${hoInfo.ho_start }"/>
								<span id="s_start">${fn:substring(ho_start,0,16) }</span>부터 
							</div>
							<div style="display: inline-block;">
								<!-- 신청기간 timestamp라서 년월일 시분만 출력 -->
								<c:set var="ho_end" value="${hoInfo.ho_end }"/>
								<span id="s_end">${fn:substring(ho_end,0,16) }</span>까지 
							</div>
							<div style="display: inline-block;">(총 <span id="s_date_cal">${hoInfo.ho_use_count }</span>일)</div>
						</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">4. 기타</div>
						<div>문의사항은 BAB ${readHoDoc.emp_name }(${readHoDoc.emp_phone })에게 연락바랍니다. 끝.</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">파일첨부</div>
						<c:if test="${not empty readHoDoc.eap_file_path }">
							<img style="width: 450px;" id="s_img"  src="${readHoDoc.eap_file_path }">
							<div style="color: dimgray; font-size: .9em;">* 다운로드를 희망하시면 마우스 오른쪽을 클릭 후 이미지를 저장해주세요.</div>
						</c:if>
						<c:if test="${empty readHoDoc.eap_file_path }">
							<div>- 無</div>
						</c:if>
						<div id="s_file_upload" style="margin-top: 5px;"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="s_eap_content_box_right">
			<div style="padding: 10px; text-align: center;">
			<div style="font-size: 1.2em;font-weight: bold; margin-bottom: 20px;">결재선</div>
			<div style="padding-bottom: 20px; border-bottom: 1px solid lightgray;">
				<div>
					<span>${readHoDoc.dept_name }</span>
					<span>${readHoDoc.job_title }</span>
				</div>
				<div>
					<span>${readHoDoc.emp_name }</span>
					<span style="color: crimson;font-weight: bold;">기안</span>
				</div>
			</div>
			
			<!-- 첫번째 승인자가 null이 아니면 -->
			<c:if test="${not empty firstAp }">
				<div class="s_div">
					<div>
						<span>${firstAp.dept_name }</span>
						<span>${firstAp.job_title }</span>
					</div>
					<div>
						<span>${firstAp.emp_name }</span>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
						<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 1이상이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
						<c:if test="${readHoDoc.eap_step >= 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 2이상이고 결재 상태 코드가 반려일 때(승인상태) -->
						<c:if test="${readHoDoc.eap_step >= 2 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">반려</span>
						</c:if>
					</div>
				</div>
			</c:if>
			<!-- 두번째 승인자가 null이 아니면 -->
			<c:if test="${not empty midAp }">
				<div class="s_div">
					<div>
						<span>${midAp.dept_name }</span>
						<span>${midAp.job_title }</span>
					</div>
					<div>
						<span>${midAp.emp_name }</span>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
						<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 2이고 결재 상태 코드가 진행중일 때(대기상태) -->
						<c:if test="${readHoDoc.eap_step == 2 && readHoDoc.eap_sta_code eq 'O' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
						<c:if test="${readHoDoc.eap_step == 1 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
						<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(승인상태) -->
						<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 2이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readHoDoc.eap_step == 2 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">반려</span>
						</c:if>
					</div>
				</div>
			</c:if>
			<!-- 세번째 승인자가 null이 아니면 -->
			<c:if test="${not empty finalAp }">
				<div class="s_div">
					<div>
						<span>${finalAp.dept_name }</span>
						<span>${finalAp.job_title }</span>
					</div>
					<div>
						<span>${finalAp.emp_name }</span>
						<!-- 결재선 단계가 1이상이고 결재 상태 코드가 진행중이거나 대기중일 때(대기상태) -->
						<c:if test="${readHoDoc.eap_step >= 1 && readHoDoc.eap_sta_code eq 'O' || readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 2보다 작고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
						<c:if test="${readHoDoc.eap_step <= 2 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 결재완료일 때(승인상태) -->
						<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readHoDoc.eap_step == 3 && readHoDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">반려</span>
						</c:if>
					</div>
				</div>
			</c:if>
			
		</div>
	</div>
	
	<!-- 결재 반려 Modal -->
	<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="left: 200px;width: 700px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">결재 반려</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div style="font-size:1.1em; font-weight: bold; color: darkblue; margin-bottom: 10px;">반려 사유를 입력해주세요.</div>
	        <input type="text" name="eap_reject" class="form-control" required id="s_reject_val">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="reject()">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		// 결재 회수 ajax
		$("#s_eap_cancle").click(function() {
			swal({
				title: "결재 회수",
                text: "회수하시겠습니까?",
                icon: "warning",
                confirmButtonClass : "btn-danger",
                buttons: ["취소", "확인"],
                closeOnClickOutside: false,
                closeOnEsc: false
			}).then((확인) => {
				if(확인) {
					$.ajax({
						url: "<%=request.getContextPath()%>/eap/canceldoc",
						type: "post",
						data: {"df_no": $("#s_dfNo").text()},
						success: function(result) {
							if(result.includes('실패')) {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "error",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$("#menu_eap").get(0).click();
				                })
							} else {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "success",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$("#menu_eap").get(0).click();
				                })
							}
						}
					});
				} else {
					swal({
                        title: "",
                        text: "취소되었습니다.",
                        icon: "success",
                        closeOnClickOutside: false,
                        closeOnEsc: false
                    });
				}
			})
		});
		
		// 문서 수정 클릭 시
		$("#s_eap_update").click(function() {
			// 제목
			$("#s_ho_tt").replaceWith('<input type="text" class="form-control" value="${readHoDoc.eap_title }" style="display: inline-block; width: 583px; margin-left: 5px;" id="s_ho_tt">');
			// 종류
			$("#s_kind").replaceWith('<div class="form-check" style="display: inline-block;">'
					+ '<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="A">'
					+ '<label class="form-check-label" for="flexRadioDefault1">연차</label></div>'
					+ '<div class="form-check" style="display: inline-block; margin-left: 10px;">'
					+ '<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="H">'
					+ '<label class="form-check-label" for="flexRadioDefault2">반차</label></div>');
			// 내용
			$("#s_eap_content").replaceWith('<textarea class="form-control" style="resize: none;" id="s_ho_co">${readHoDoc.eap_content }</textarea>');
			
			// 시작날짜, 시간 추출
			var start = $('#s_start').text();
			var startTime = start.substr(11);
			start = start.substr(0,10);
			
			// 종료 날짜, 시간 추출
			var end = $('#s_end').text();
			var endTime = end.substr(11);
			end = end.substr(0,10);
			
			// 신청기간
			$("#s_ho_dt").replaceWith('<div>'
					+ '<input type="text" placeholder="신청 시작 기간을 선택해주세요" class="form-control" style="width: 250px; display: inline-block;" id="s_ho_start">'
					+ '<input type="time" class="form-control" style="width: 150px; margin-left: 5px; display: inline-block;" id="s_start_time" min="09:00:00" max="22:00:00"> 부터'
				+ '</div>'
				+ '<div>'
					+ '<input type="text" placeholder="신청 종료 기간을 선택해주세요" class="form-control" style="width: 250px; display: inline-block; margin-top: 10px;" id="s_ho_end">'
					+ '<input type="time" class="form-control" style="width: 150px; margin-left: 5px; display: inline-block;" id="s_end_time" min="09:00:00" max="22:00:00"> 까지'
					+ '<div style="display: inline-block;">(총 <span id="s_date_cal">0</span>일)</div>'
				+ '</div>');
			$("#s_ho_start").attr('value', start);
			document.getElementById('s_start_time').value = startTime;
			$("#s_ho_end").attr('value', end);
			document.getElementById('s_end_time').value = endTime;
			// 파일첨부
			$('#s_file_upload').append('<input type="hidden" role="uploadcare-uploader" data-public-key="991bc66817ca4103d3ee" data-tabs="file url" id="eap_file_path"/>');
			$('#s_file_upload').after('<input type="hidden" name="fileUrl" id="fileUrl">');
			$("#s_btn").empty();
			$("#s_btn").append('<span><a id="s_doc_update" href="#" onclick="update()">수정 완료 | </a></span>');
			$("#s_btn").append('<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>');
			
			/* 이미지등록 */
			var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
		
			singleWidget.onUploadComplete(function(info) {
				$("#fileUrl").val(info.cdnUrl);
			});
			
			// datepicker위젯
			$(function() {
				$("#s_ho_start, #s_ho_end").datepicker({
					timepicker: true,
					changeMonth: true,
	                changeYear: true,
	                controlType: 'select',
	                timeFormat: 'HH:mm',
	                dateFormat: 'yy-mm-dd',
	                yearRange: '1930:2024',
	                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	                monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	                beforeShowDay: disableAllTheseDays2
				});
			});
			
		   function disableAllTheseDays2(date) {
	            var day = date.getDay();
	            return [(day != 0 && day != 6)];
				// 0=일, 6=토 => 안나오게 할 것 
	        }
		   
		   function checkDate() {
			// 날짜 계산
				var start = new Date($('#s_ho_start').val() + 'T' + $('#s_start_time').val());
				var end = new Date($('#s_ho_end').val() + 'T' + $('#s_end_time').val());
				// 일수 구하기
				var diffDay = (end.getTime() - start.getTime()) / (1000*60*60*24);
				// 시간 구하기(휴식시간 1시간 제외)
				var diffTime = (end.getTime() - start.getTime()) / (1000*60*60) -1;
				
				if((0 < diffDay && diffDay < 1) && (0 < diffTime && diffTime < 8)) {
					$('#s_date_cal').text('0.5'); // 반차
				} else if(diffTime >= 1 && diffTime >= 8) {
					
					// 평일 계산할 cnt 선언
					let cnt = 0;
					while(true) {
						let tmpDate = start;
						// 시작시간이 끝나는시간보다 크면
						if(tmpDate.getTime() > end.getTime()) {
							break;
						} else { // 아니면
							let tmp = tmpDate.getDay();
							// 평일일 때 
							if(tmp != 0 && tmp != 6) {
								cnt++;
							} 
							tmpDate.setDate(start.getDate() + 1);
						}
					}
					
					// 날짜 계산
					let diff = Math.abs(end.getTime() - start.getTime());
					diff = Math.ceil(diff / (1000 * 3600 * 24));
					
					// cnt string으로 변환하여 일수 나타내기
					var cntStr = String(cnt);
					$('#s_date_cal').text(cntStr);
				} else {
					$('#s_date_cal').text('0');
				}
		   }
		   
	   // 로드 시 날짜 계산
	   $(function() {
		   checkDate();
  	   });
	   
	   // 수정 시 날짜 계산
	   $("#s_end_time").change(function() {
		   checkDate();
	   });
	});
	</script>
	
	<script>
		// 문서 수정 클릭 시
		function update() {
			dataObj = {
					"df_no" : $("#s_dfNo").text(),
					"eap_title" : $('#s_ho_tt').val(),
					"eap_content" : $('#s_ho_co').val(),
					"ho_code" : $('input[type=radio]:checked').val(),
					//"ho_start" : $('#s_start').text(),
					"ho_start" : $('#s_ho_start').val() + " " + $('#s_start_time').val(),
					"ho_end" : $('#s_ho_end').val() + " " + $('#s_end_time').val(),
					//"ho_end" : $('#s_end').text(),
					"ho_use_count" : $('#s_date_cal').text(),
					"eap_file_path": $("#fileUrl").val(),
					"s_img": $("#s_img").attr("src")
			}
			
			
			// 문서 수정 클릭 시 DB다녀올 ajax
			$.ajax({
				url : "<%=request.getContextPath()%>/eap/updateho"
				, type : "post"
				, data : dataObj
				, success : function(result) {
					if(result.includes('실패')) {
						swal({
		                    title: "",
		                    text: result,
		                    icon: "error",
		                    closeOnClickOutside: false,
		                    closeOnEsc: false
		                })
		                .then((ok) => {
							$("#s_before_doc").trigger("click");
		                })
					} else {
						swal({
		                    title: "",
		                    text: result,
		                    icon: "success",
		                    closeOnClickOutside: false,
		                    closeOnEsc: false
		                })
		                .then((ok) => {
							$("#s_before_doc").trigger("click");
		                })
					}
				}
			});
		}
		
		// 의견 클릭 시
		function opinion() {
			var rejectMsg = "${readHoDoc.eap_reject}";
			if(rejectMsg == null || rejectMsg == "") {
				swal({
                    title: "반려 사유",
                    text: "반려 사유가 없습니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                });
			} else {
				swal({
                    title: "반려 사유",
                    text: rejectMsg,
                    icon: "info",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
			}
		}
	
	</script>
	
	<script>
		// 결재선 지정 시 결재상태에 따라 글씨색 변경
		for(var i = 0; i < 3; i++) {
			if($(".s_span_fw").eq(i).text() == '결재') {
				$(".s_span_fw").eq(i).css('color', 'rgb(5, 131, 242)');
			} else if($(".s_span_fw").eq(i).text() == '대기') {
				$(".s_span_fw").eq(i).css('color', 'gray');
			} else if($(".s_span_fw").eq(i).text() == '반려') {
				$(".s_span_fw").eq(i).css('color', 'green');
			}
		}
	</script>
	
	<script>
		// 결재 반려
		function reject() {
			var objdata = {};
			// 결재자 몇 명인지 구하기
			var apPerson = $('.s_div').length;
			
			// 결재자가 1명일 때
			if(apPerson == 1) {
				objdata = {
						"eap_step" : 1,
						"eap_sta_code" : 'F',
						"eap_res_code" : 'A',
						"eap_reject" : $("#s_reject_val").val(),
						"df_no" : $('#s_dfNo').text()
				}
				
				$.ajax({
					url : "<%=request.getContextPath()%>/eap/updateonerej"
					, type : "post"
					, data : objdata
					, success : function(result) {
						if(result.includes('실패')) {
							swal({
			                    title: "",
			                    text: result,
			                    icon: "error",
			                    closeOnClickOutside: false,
			                    closeOnEsc: false
			                })
			                .then((ok) => {
			                	$(".btn-close").trigger('click');
								$("#menu_eap").get(0).click();
		                	})
						} else {
							swal({
			                    title: "",
			                    text: result,
			                    icon: "success",
			                    closeOnClickOutside: false,
			                    closeOnEsc: false
			                })
			                .then((ok) => {
			                	$(".btn-close").trigger('click');
								$("#menu_eap").get(0).click();
		                	})
						}
					}
				});
			}
			
			// 결재자가 2명일 때
			if(apPerson == 2) {
				// 결재선에 있는 사원 이름
				var lineName = "";
				// 로그인 한 사람의 이름
				var checkName = "<%=empName%>";
				// 몇 번째 결재자인지 확인하는 변수
				var line = 0;
				// 결재자 길이만큼 for문 실행
				for(var i = 0; i < apPerson; i++) {
					// 결재선에 있는 사원 이름 변수에 담기
					lineName = $('.s_div').eq(i).children().last().children().first().text();
					// 결재선에 있는 이름과 로그인 한 사람의 이름이 같다면
					if(lineName == checkName) {
						// 몇 번째 결재자인지 담아주고 반복문 빠져나오기
						line = i+1;
						break;
					}
				}
				
				// 첫 번째 결재자라면
				if(line == 1) {
					objdata = {
							"eap_step" : 1,
							"eap_reject" : $("#s_reject_val").val(),
							"df_no" : $('#s_dfNo').text()
					}
					// 두 번째 결재자라면
				} else if(line == 2) {
					objdata = {
							"eap_step" : 2,
							"eap_reject" : $("#s_reject_val").val(),
							"df_no" : $('#s_dfNo').text()
					}
				}
				
				$.ajax({
					url : "<%=request.getContextPath()%>/eap/updateeaprej"
						, type : "post"
						, data : objdata
						, success : function(result) {
							if(result.includes('실패')) {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "error",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$(".btn-close").trigger('click');
									$("#menu_eap").get(0).click();
		                		})
							} else {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "success",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$(".btn-close").trigger('click');
									$("#menu_eap").get(0).click();
		                		})
							}
					}
				});
			}
			
			// 결재자가 3명일 때
			if(apPerson == 3) {
				// 결재선에 있는 사원 이름
				var lineName = "";
				// 로그인 한 사람의 이름
				var checkName = "<%=empName%>";
				// 몇 번째 결재자인지 확인하는 변수
				var line = 0;
				// 결재자 길이만큼 for문 실행
				for(var i = 0; i < apPerson; i++) {
					// 결재선에 있는 사원 이름 변수에 담기
					lineName = $('.s_div').eq(i).children().last().children().first().text();
					// 결재선에 있는 이름과 로그인 한 사람의 이름이 같다면
					if(lineName == checkName) {
						// 몇 번째 결재자인지 담아주고 반복문 빠져나오기
						line = i+1;
						break;
					}
				}
				
				// 첫 번째 결재자라면
				if(line == 1) {
					objdata = {
							"eap_step" : 1,
							"eap_reject" : $("#s_reject_val").val(),
							"df_no" : $('#s_dfNo').text()
					}
					// 두 번째 결재자라면
				} else if(line == 2) {
					objdata = {
							"eap_step" : 2,
							"eap_reject" : $("#s_reject_val").val(),
							"df_no" : $('#s_dfNo').text()
					}
					// 세 번째 결재자라면
				} else if(line == 3) {
					objdata = {
							"eap_step" : 3,
							"eap_reject" : $("#s_reject_val").val(),
							"df_no" : $('#s_dfNo').text()
					}
				}
				
				$.ajax({
					url : "<%=request.getContextPath()%>/eap/updateeaprej"
						, type : "post"
						, data : objdata
						, success : function(result) {
							if(result.includes('실패')) {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "error",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$(".btn-close").trigger('click');
									$("#menu_eap").get(0).click();
		                		})
							} else {
								swal({
				                    title: "",
				                    text: result,
				                    icon: "success",
				                    closeOnClickOutside: false,
				                    closeOnEsc: false
				                })
				                .then((ok) => {
									$(".btn-close").trigger('click');
									$("#menu_eap").get(0).click();
		                		})
							}
					}
				});
			}
			
		}
		
		// 결재 승인 메뉴 클릭
		function approval() {
			swal({
                title: "결재 승인",
                text: "승인하시겠습니까?",
                icon: "warning",
                confirmButtonClass : "btn-danger",
                buttons: ["취소", "확인"],
                closeOnClickOutside: false,
                closeOnEsc: false
            }).then((확인) => {
            	if(확인) {
	            	var objdata = {};
					// 결재자 몇 명인지 구하기
					var apPerson = $('.s_div').length;
					
					// 결재자가 1명일 때
					if(apPerson == 1) {
						objdata = {
								"eap_step" : 1,
								"eap_sta_code" : 'F',
								"eap_res_code" : 'A',
								"df_no" : $('#s_dfNo').text()
						}
						
						$.ajax({
							url : "<%=request.getContextPath()%>/eap/updateoneapp"
								, type : "post"
								, data : objdata
								, success : function(result) {
									if(result.includes('실패')) {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "error",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
											$(".btn-close").trigger('click');
											$("#menu_eap").get(0).click();
					                	})
									} else {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "success",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
							                $(".btn-close").trigger('click');
											$("#menu_eap").get(0).click();
					                	})
									}
							}
						});
					}
					
					// 결재자가 2명 일 때
					if(apPerson == 2) {
						// 결재선에 있는 사원 이름
						var lineName = "";
						// 로그인 한 사람의 이름
						var checkName = "<%=empName%>";
						// 몇 번째 결재자인지 확인하는 변수
						var line = 0;
						// 결재자 길이만큼 for문 실행
						for(var i = 0; i < apPerson; i++) {
							// 결재선에 있는 사원 이름 변수에 담기
							lineName = $('.s_div').eq(i).children().last().children().first().text();
							// 결재선에 있는 이름과 로그인 한 사람의 이름이 같다면
							if(lineName == checkName) {
								// 몇 번째 결재자인지 담아주고 반복문 빠져나오기
								line = i+1;
								break;
							}
						}
						
						// 첫 번째 결재자라면
						if(line == 1) {
							objdata = {
									"eap_step" : 2,
									"eap_sta_code" : 'O',
									"df_no" : $('#s_dfNo').text()
							}
							
							// 두 번째 결재자라면
						} else if(line == 2) {
							objdata = {
									"eap_step" : 2,
									"eap_sta_code" : 'F',
									"eap_res_code" : 'A',
									"df_no" : $('#s_dfNo').text()
							}
						}
						
						$.ajax({
							url : "<%=request.getContextPath()%>/eap/updateeapapp"
								, type : "post"
								, data : objdata
								, success : function(result) {
									if(result.includes('실패')) {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "error",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
											$("#menu_eap").get(0).click();
					                	})
									} else {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "success",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
											$("#menu_eap").get(0).click();
					                	})
									}
							}
						});
					}
					
					// 결재자가 3명 일 때
					if(apPerson == 3) {
						// 결재선에 있는 사원 이름
						var lineName = "";
						// 로그인 한 사람의 이름
						var checkName = "<%=empName%>";
						// 몇 번째 결재자인지 확인하는 변수
						var line = 0;
						// 결재자 길이만큼 for문 실행
						for(var i = 0; i < apPerson; i++) {
							// 결재선에 있는 사원 이름 변수에 담기
							lineName = $('.s_div').eq(i).children().last().children().first().text();
							// 결재선에 있는 이름과 로그인 한 사람의 이름이 같다면
							if(lineName == checkName) {
								// 몇 번째 결재자인지 담아주고 반복문 빠져나오기
								line = i+1;
								break;
							}
						}
						
						// 첫 번째 결재자라면
						if(line == 1) {
							objdata = {
									"eap_step" : 2,
									"eap_sta_code" : 'O',
									"df_no" : $('#s_dfNo').text()
							}
							
							// 두 번째 결재자라면
						} else if(line == 2) {
							objdata = {
									"eap_step" : 3,
									"eap_sta_code" : 'O',
									"df_no" : $('#s_dfNo').text()
							}
							// 세 번째 결재자라면
						} else if(line == 3) {
							objdata = {
									"eap_step" : 3,
									"eap_sta_code" : 'F',
									"eap_res_code" : 'A',
									"df_no" : $('#s_dfNo').text()
							}
						}
						
						$.ajax({
							url : "<%=request.getContextPath()%>/eap/updateeapapp"
								, type : "post"
								, data : objdata
								, success : function(result) {
									if(result.includes('실패')) {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "error",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
											$("#menu_eap").get(0).click();
					                	})
									} else {
										swal({
						                    title: "",
						                    text: result,
						                    icon: "success",
						                    closeOnClickOutside: false,
						                    closeOnEsc: false
						                })
						                .then((ok) => {
											$("#menu_eap").get(0).click();
					                	})
									}
							}
						});
					}
            	} else {
            		swal({
                        title: "",
                        text: "취소되었습니다.",
                        icon: "success",
                        closeOnClickOutside: false,
                        closeOnEsc: false
                    });
            	}
            });
		}
	</script>
	
	<script>
		// 선택된 메뉴 클릭(목록으로)
		function list() {
			// 기안 문서함
			if($("#s_insert_doc").css("color") == 'rgb(5, 131, 242)'){
				$('#s_insert_doc').trigger('click');
				// 결재 문서함
			} else if($("#s_result_doc").css("color") == 'rgb(5, 131, 242)') {
				$('#s_result_doc').trigger('click');
				// 참조 문서함
			} else if($("#s_reference_doc").css("color") == 'rgb(5, 131, 242)') {
				$('#s_reference_doc').trigger('click');
				// 결재 대기 문서
			} else if($("#s_before_doc").css("color") == 'rgb(5, 131, 242)') {
				$('#s_before_doc').trigger('click');
				// 결재 수신 문서
			} else if($("#s_receipt_doc").css("color") == 'rgb(5, 131, 242)') {
				$('#s_receipt_doc').trigger('click');
			}
		}
	</script>
</body>
</html>