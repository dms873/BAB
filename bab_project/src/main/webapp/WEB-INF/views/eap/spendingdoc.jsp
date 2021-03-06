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
<meta charset="UTF-8">
<!-- <title>전자결재(지출결의서)상세조회</title> -->
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
<!-- datepicker css -->
<style>
	.ui-widget-header {
		border: 0px solid #dddddd;
		background: #fff;
	}
	
	.ui-datepicker-calendar>thead>tr>th {
		font-size: 14px !important;
	}
	
	.ui-datepicker .ui-datepicker-header {
		position: relative;
		padding: 10px 0;
	}
	
	.ui-state-default, .ui-widget-content .ui-state-default,
		.ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover,
		html .ui-button.ui-state-disabled:active {
		border: 0px solid #c5c5c5;
		background-color: transparent;
		font-weight: normal;
		color: #454545;
		text-align: center;
	}
	
	.ui-datepicker .ui-datepicker-title {
		margin: 0 0em;
		line-height: 16px;
		text-align: center;
		font-size: 14px;
		padding: 0px;
		font-weight: bold;
	}
	
	.ui-datepicker {
		display: none;
		background-color: #fff;
		border-radius: 4px;
		margin-top: 10px;
		margin-left: 0px;
		margin-right: 0px;
		padding: 20px;
		padding-bottom: 10px;
		width: 300px;
		box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1);
	}
	
	.ui-widget.ui-widget-content {
		border: 1px solid #eee;
	}
	
	#datepicker:focus>.ui-datepicker {
		display: block;
	}
	
	.ui-datepicker-prev, .ui-datepicker-next {
		cursor: pointer;
	}
	
	.ui-datepicker-next {
		float: right;
	}
	
	.ui-state-disabled {
		cursor: auto;
		color: hsla(0, 0%, 80%, 1);
	}
	
	.ui-datepicker-title {
		text-align: center;
		padding: 10px;
		font-weight: 100;
		font-size: 20px;
	}
	
	.ui-datepicker-calendar {
		width: 100%;
	}
	
	.ui-datepicker-calendar>thead>tr>th {
		padding: 5px;
		font-size: 20px;
		font-weight: 400;
	}
	
	.ui-datepicker-calendar>tbody>tr>td>a {
		color: #000;
		font-size: 12px !important;
		font-weight: bold !important;
		text-decoration: none;
	}
	
	.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
		cursor: auto;
		background-color: #fff;
	}
	
	.ui-datepicker-calendar>tbody>tr>td {
		border-radius: 100%;
		width: 44px;
		height: 30px;
		cursor: pointer;
		padding: 5px;
		font-weight: 100;
		text-align: center;
		font-size: 12px;
	}
	
	.ui-datepicker-calendar>tbody>tr>td:hover {
		background-color: transparent;
		opacity: 0.6;
	}
	
	.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover,
		.ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus,
		.ui-button:hover, .ui-button:focus {
		border: 0px solid #cccccc;
		background-color: transparent;
		font-weight: normal;
		color: #2b2b2b;
	}
	
	.ui-widget-header .ui-icon {
		background-image: url('https://media.discordapp.net/attachments/692994434526085184/995979886768439306/btns.png');
	}
	
	.ui-icon-circle-triangle-e {
		background-position: -20px 0px;
		background-size: 36px;
	}
	
	.ui-icon-circle-triangle-w {
		background-position: -0px -0px;
		background-size: 36px;
	}
	
	.ui-datepicker-calendar>tbody>tr>td:first-child a {
		color: red !important;
	}
	
	.ui-datepicker-calendar>tbody>tr>td:last-child a {
		color: #0099ff !important;
	}
	
	.ui-datepicker-calendar>thead>tr>th:first-child {
		color: red !important;
	}
	
	.ui-datepicker-calendar>thead>tr>th:last-child {
		color: #0099ff !important;
	}
	
	.ui-state-highlight, .ui-widget-content .ui-state-highlight,
		.ui-widget-header .ui-state-highlight {
		border: 0px;
		background: #f1f1f1;
		border-radius: 50%;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.inp {
		padding: 10px 10px;
		background-color: #f1f1f1;
		border-radius: 4px;
		border: 0px;
	}
	
	.inp:focus {
		outline: none;
		background-color: #eee;
	}
	
	select.ui-datepicker-month {
		border-radius: 5px;
    	padding: 5px;
    	width: 80px !important;
	}
	
	select.ui-datepicker-year {
		border-radius: 5px;
	    padding: 5px;
	    margin-left: 10px !important;
    	width: 80px !important;
	}
	
	.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
	    top: 9px !important;
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
	<c:set var="check" value="${readSpDoc.emp_no }"/>
	<!-- 결재상태 체크 변수 선언 -->
	<c:set var="eapStaCheck" value="${readSpDoc.eap_sta_code }"></c:set>
	<!-- 기안자 이름 체크 변수 선언 -->
	<c:set var="eapNameCheck" value="${readSpDoc.emp_name }"></c:set>
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
			<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">지출결의서</div>
			
			<div style="float: left; width: 230px; margin: 0 30px;">
				<table border="1" id="s_eap_draft_info">
						<tr>
							<th>기안자</th>
							<td>${readSpDoc.emp_name }</td>
						</tr>
						<tr>
							<th>기안부서</th>
							<td>${readSpDoc.dept_name }</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td>
								<!-- 기안일 timestamp라서 년월일만 출력 -->
								<c:set var="eap_draft_date" value="${readSpDoc.eap_draft_date }"/>
								${fn:substring(eap_draft_date,0,10) }
							</td>
						</tr>
						<tr>
							<th>문서번호</th>
							<td id="s_dfNo">${readSpDoc.df_no }</td>
						</tr>
					</table>
			</div>
			
			<div style="float: left;width: 130px; margin-right: 10px;">
				<table border="1" id="s_eap_draft">
					<tr>
						<th rowspan="2">신청</th>
						<td>${readSpDoc.job_title }</td>
					</tr>
					<tr>
						<td>${readSpDoc.emp_name }</td>
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
								<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1 이상이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
								<c:if test="${readSpDoc.eap_step >= 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2 이상이고 결재 상태 코드가 반려일 때(승인상태) -->
								<c:if test="${readSpDoc.eap_step >= 2 && readSpDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'R'}">
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
								<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2이고 결재 상태 코드가 진행중이거나 결재완료일 때(대기상태) -->
								<c:if test="${readSpDoc.eap_step == 2 && readSpDoc.eap_sta_code eq 'O' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
								<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'R' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
								<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(승인상태) -->
								<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readSpDoc.eap_step == 2 && readSpDoc.eap_sta_code eq 'R'}">
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
								<c:if test="${readSpDoc.eap_step >= 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 2보다 작고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
								<c:if test="${readSpDoc.eap_step <= 2 && readSpDoc.eap_sta_code eq 'R' }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3이고 결재 상태 코드가 결재완료일 때(승인상태) -->
								<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'F'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792589799026709/stamp_5.png" style="width: 50px;">
								</c:if>
								<!-- 결재선 단계가 3 이고 결재 상태 코드가 반려일 때(반려상태) -->
								<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'R'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/992095931640057866/stamp_7.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</c:if>
			</div>
			
		
				<div style="padding: 50px 10px 20px; clear: both;">
					<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : <span id="s_sp_tt">${readSpDoc.eap_title }</span></div> 
				</div>
				
				<div style="border: 1px solid lightgray; margin: 10px;"></div>
				<div style="margin: 0 10px;">
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">1. 지출 내용</div>
						<div id="s_eap_content">${readSpDoc.eap_content }</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">2. 지출내역</div>
						<table class="table" style="text-align: center;">
								<thead>
									<tr>
										<th scope="col" style="width: 130px;">날짜</th>
										<th scope="col" style="width: 450px;">내역</th>
										<th scope="col" style="width: 70px;">수량</th>
										<th scope="col" style="width: 150px;">금액</th>
										<th scope="col" style="width: 130px;">결제수단</th>
									</tr>
								</thead>
								<tbody id="s_default_tbody" class="s_default_tbody_cl">
									<tr>
										<td scope="row">
											<div id="s_sp_date">
											<!-- 지출날짜 timestamp라서 년월일만 출력 -->
											<c:set var="sp_date" value="${spInfo.sp_date }"/>
											${fn:substring(sp_date,0,10) }
											</div>
										</td>
										<td><div id="s_sp_detail">${spInfo.sp_detail }</div></td>
										<td><div id="num1">${spInfo.sp_count }</div></td>
										<td><div id="num2">${spInfo.sp_amount }</div></td>
										<td>
											<div id="s_select">
												<c:if test="${spInfo.sp_pay_code eq 'C'}">신용카드</c:if>
												<c:if test="${spInfo.sp_pay_code eq 'A'}">가상계좌</c:if>
											</div>
										</td>
									</tr>

								</tbody>
								<tfoot>
									<tr>
										<th colspan="3">합계</th>
										<td colspan="2">\ <span id="s_total_price"></span> (VAT포함)
										</td>
									</tr>
								</tfoot>
							</table>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">3. 기타</div>
						<div>문의사항은 BAB ${readSpDoc.emp_name }(${readSpDoc.emp_phone })에게 연락바랍니다. 끝.</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">파일첨부</div>
						<c:if test="${not empty readSpDoc.eap_file_path }">
							<img style="width: 450px;" id="s_img" src="${readSpDoc.eap_file_path }">
							<div style="color: dimgray; font-size: .9em;">* 다운로드를 희망하시면 마우스 오른쪽을 클릭 후 이미지를 저장해주세요.</div>
						</c:if>
						<c:if test="${empty readSpDoc.eap_file_path }">
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
					<span>${readSpDoc.dept_name }</span>
					<span>${readSpDoc.job_title }</span>
				</div>
				<div>
					<span>${readSpDoc.emp_name }</span>
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
						<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 1이상이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
						<c:if test="${readSpDoc.eap_step >= 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 2이상이고 결재 상태 코드가 반려일 때(승인상태) -->
						<c:if test="${readSpDoc.eap_step >= 2 && readSpDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'R' }">
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
						<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 2이고 결재 상태 코드가 진행중이거나 결재완료일 때(대기상태) -->
						<c:if test="${readSpDoc.eap_step == 2 && readSpDoc.eap_sta_code eq 'O' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 1이고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
						<c:if test="${readSpDoc.eap_step == 1 && readSpDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 진행중이거나 결재완료일 때(승인상태) -->
						<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(승인상태) -->
						<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 2이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readSpDoc.eap_step == 2 && readSpDoc.eap_sta_code eq 'R' }">
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
						<c:if test="${readSpDoc.eap_step >= 1 && readSpDoc.eap_sta_code eq 'O' || readSpDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 2보다 작고 결재 상태 코드가 반려일 때(앞에서 이미 반려상태) -->
						<c:if test="${readSpDoc.eap_step <= 2 && readSpDoc.eap_sta_code eq 'R' }">
							<span class="s_span_fw">대기</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 결재완료일 때(승인상태) -->
						<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'F' }">
							<span class="s_span_fw">결재</span>
						</c:if>
						<!-- 결재선 단계가 3이고 결재 상태 코드가 반려일 때(반려상태) -->
						<c:if test="${readSpDoc.eap_step == 3 && readSpDoc.eap_sta_code eq 'R' }">
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
		
		// 줄바꿈을 기준으로 split을 사용해 하나의 배열로 변환하고 그 배열을 \r\n으로 구분자를 통해 연결함.
		function content() {
			// 안녕<br/>하세요<br/>반가워요
			var eapContent = $("#s_sp_co").val(); 
			// ['안녕', '하세요', '반가워요'] 로 되어있는 배열을 연결하는데 ','대신 '\r\n'으로 연결해줌
			// join에 매개인자가 없으면 '안녕,하세요,반가워요'로 연결됨
			eapContent = eapContent.split("<br/>").join("\r\n");
			$("#s_sp_co").val(eapContent);
		};
		
		// 문서 수정 클릭 시
		$("#s_eap_update").click(function() {
			// 제목
			$('#s_sp_tt').replaceWith('<input type="text" style="display: inline-block; width: 583px; margin-left: 5px;" class="form-control" value="${readSpDoc.eap_title }" id="s_sp_tt">');
			// 내용
			$('#s_eap_content').replaceWith('<textarea class="form-control s_scroll" style="resize: none; height: 150px;" id="s_sp_co">${readSpDoc.eap_content }</textarea>')
			content();
			var date = "${spInfo.sp_date }";
			// 년월일만 출력
			date = date.substr(0,10);
			// 날짜
			$('#s_sp_date').replaceWith('<input type="text" class="form-control s_sp_date" id="s_sp_date" name="sp_date" placeholder="날짜 선택" value="${spInfo.sp_detail }" style="cursor: context-menu; width: 135px;">');
			$("#s_sp_date").attr('value', date);
			// 내역
			$('#s_sp_detail').replaceWith('<input type="text" class="form-control s_sp_detail" name="sp_detail" value="${spInfo.sp_detail }">');
			// 수량
			$('#num1').replaceWith('<input type="number" id="num1" class="form-control s_sp_count" name="sp_count" style="width: 50px;" value="${spInfo.sp_count }">');
			// 금액
			// 콤마제거
			var num2 = "${spInfo.sp_amount}";
			num2 = num2.replace(",", "");
			$('#num2').replaceWith('<input type="number" id="num2" class="form-control sp_amount" onblur="total()" name="sp_amount">');
			$("#num2").attr('value', num2);
			// 결제방식
			$('#s_select').replaceWith('<select class="form-select s_select" aria-label="Default select example" style="width: 115px;"><option value="C">신용카드</option><option value="A">가상계좌</option></select>')
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
			
			$("#s_sp_date").datepicker({
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
	            beforeShow: function() {
	                setTimeout(function(){
	                    $('.ui-datepicker').css('z-index', 99999999999999);
	                }, 0);
	            }
			});
		});
	</script>
	
	<script>
		// 문서 수정 클릭 시
		function update() {
			
			var eap_content = $('#s_sp_co').val();
			// textarea에 \r \n같은 문자를 <br>로 바꿔주기
			eap_content = eap_content.replace(/(?:\r\n|\r|\n)/g,'<br/>');
			
			
			dataObj = {
					"sp_date" : $('.s_sp_date').val(),
					"sp_detail" : $('.s_sp_detail').val(),
					"sp_count" : $('#num1').val(),
					"sp_amount" : $('#num2').val(),
					"sp_pay_code" : $('.s_select').val(),
					"df_no" : $('#s_dfNo').text(),
					"eap_title" : $('#s_sp_tt').val(),
					"eap_content" : eap_content,
					"eap_file_path": $("#fileUrl").val(),
					"s_img": $("#s_img").attr("src")
			}
			
			
			// 문서 수정 클릭 시 DB다녀올 ajax
			$.ajax({
				url : "<%=request.getContextPath()%>/eap/updatesp"
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
			var rejectMsg = "${readSpDoc.eap_reject}";
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
		// 수정 시 합계 함수
		function total() {
			const num1 = $("#num1").val();
			const numberStr = $("#num2").val();
			// 콤마 제거
			const num2 = numberStr.replace(",", "");
			const multi = num1 * num2; 
			const total = multi.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#s_total_price").text(total);
		}
		
		// 로드 시 합계
		$(function() {
			const num1 = $("#num1").text();
			const numberStr = $("#num2").text();
			// 콤마 제거
			const num2 = numberStr.replace(",", "");
			const multi = num1 * num2; 
			const total = multi.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#s_total_price").text(total);
		});
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
						"eap_sta_code" : 'R',
						"eap_res_code" : 'R',
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