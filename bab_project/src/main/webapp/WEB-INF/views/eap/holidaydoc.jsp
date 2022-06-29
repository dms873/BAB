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
</head>
<body>

	<div>
		<span><a id="s_eap_cancle" href="#">결재회수 | </a></span>
		<span><a id="s_eap_update" href="#">문서 수정 | </a></span>
		<span><a id="s_opinion_btn" href="#">의견 | </a></span>
		<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
	</div>
	
	<div id="s_eap_content_box_left">
		<div class="s_div_container" style="height: 800px;">
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
								<c:if test="${readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
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
								<c:if test="${readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
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
								<c:if test="${readHoDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</c:if>
			</div>
			
		
				<div style="padding: 50px 10px 20px; clear: both;">
					<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : <span>${readHoDoc.eap_title }</span></div> 
				</div>
				
				<div style="border: 1px solid lightgray; margin: 10px;"></div>
				<div style="margin: 0 10px;">
				
					<div style="padding: 10px 0;">
						<div class="s_frm_title">1. 종류</div>
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
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">2. 내용</div>
						<div>${readHoDoc.eap_content }</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">3. 신청기간</div>
						<div>
							<div style="display: inline-block;">
								<!-- 신청기간 timestamp라서 년월일 시분만 출력 -->
								<c:set var="ho_start" value="${hoInfo.ho_start }"/>
								<span>${fn:substring(ho_start,0,16) }</span>부터 
							</div>
							<div style="display: inline-block;">
								<!-- 신청기간 timestamp라서 년월일 시분만 출력 -->
								<c:set var="ho_end" value="${hoInfo.ho_end }"/>
								<span>${fn:substring(ho_end,0,16) }</span>까지 
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
							<img style="width: 450px;" src="${readHoDoc.eap_file_path }">
							<div style="color: dimgray; font-size: .9em;">* 다운로드를 희망하시면 마우스 오른쪽을 클릭 후 이미지를 저장해주세요.</div>
						</c:if>
						<c:if test="${empty readHoDoc.eap_file_path }">
							<div>- 無</div>
						</c:if>
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
						<c:if test="${readHoDoc.eap_step eq 1 && readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
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
						<c:if test="${(readHoDoc.eap_step eq 1 || readHoDoc.eap_step eq 2) && readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
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
						<c:if test="${(readHoDoc.eap_step eq 1 || readHoDoc.eap_step eq 2 || readHoDoc.eap_step eq 3) && readHoDoc.eap_sta_code eq 'S' }">
							<span class="s_span_fw">대기</span>
						</c:if>
					</div>
				</div>
			</c:if>
			
		</div>
	</div>
	
	<script>
		// 결재 회수 ajax
		$("#s_eap_cancle").click(function() {
			$.ajax({
				url: "<%=request.getContextPath()%>/eap/canceldoc",
				type: "post",
				data: {"df_no": $("#s_dfNo").text()},
				success: function(result) {
					alert(result);
					$('#s_before_doc').trigger('click');
				}
			});
		});
	</script>
	
	<script>
		// 결재선 지정 시 결재상태에 따라 글씨색 변경
		for(var i = 0; i < 3; i++) {
			console.log("eq(" + i + ")번째 값 : " + $(".s_span_fw").eq(i).text());
			if($(".s_span_fw").eq(i).text() == '결재') {
				console.log("반복문 if문 탔니?");
				$(".s_span_fw").eq(i).css('color', 'green');
			} else {
				console.log("반복문 else문 탔니?");
				$(".s_span_fw").eq(i).css('color', 'gray');
			}
		}
	</script>
	
	<script>
		// 결재 대기 문서 메뉴 클릭(목록으로)
		function list() {
			$('#s_before_doc').trigger('click');
		}
	</script>
</body>
</html>