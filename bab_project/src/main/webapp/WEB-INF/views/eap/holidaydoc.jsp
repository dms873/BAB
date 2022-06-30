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
</head>
<body>

	<%
		// 로그인 한 정보
		String empNo = null;
		Employee vo = (Employee) request.getSession().getAttribute("login"); 
		empNo = vo.getEmp_no();
	%>
	<!-- check라는 변수명에 el태그를 값으로 넣어 -->
	<c:set var="check" value="${readHoDoc.emp_no }"/>
	
	<div id="s_btn">
		<!-- pageContext.getAttribute(변수명).toString()으로 꺼내서 사용 -->
		<% if(empNo.equals(pageContext.getAttribute("check").toString()) == true) { %>
			<span><a id="s_eap_cancle" href="#">결재회수 | </a></span>
			<span><a id="s_eap_update" href="#">문서 수정 | </a></span>
			<span><a id="s_opinion_btn" href="#" onclick="opinion()">의견 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="belist()">목록</a></span>
		<% } else { %>
			<span><a id="s_approval_btn" href="#">결재 승인 | </a></span>
			<span><a id="s_reject_btn" href="#">결재 반려 | </a></span>
			<span><a id="s_list_btn" href="#" onclick="relist()">목록</a></span>
		<% } %>
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
			
			/* "ho_start" : $('#s_start').text(),
			"ho_end" : $('#s_end').text(), */
			
			// 시작날짜, 시간 추출
			var start = $('#s_start').text();
			var startTime = start.substr(11);
			start = start.substr(0,10);
			
			// 종료 날짜, 시간 추출
			var end = $('#s_end').text();
			var endTime = end.substr(11);
			end = end.substr(0,10);
			console.log(startTime);
			console.log(endTime);
			
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
				console.log("파일URL : " + $("#fileUrl").val(info.cdnUrl));
				console.log(JSON.stringify($("#fileUrl").val(info.cdnUrl)));
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
	                //minDate: new Date(2018, 5 - 1, 14),
	                //maxDate: new Date(2018, 8 - 1, 24)
	                // minDate: new Date(2020, 4 - 1, 1),
	                // maxDate: new Date(2023, 8 - 1, 31),
	                beforeShowDay: disableAllTheseDays2
				});
				
				//초기값을 오늘 날짜로 설정해줘야 합니다.
			    // $('#s_ho_start').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			    // $('#s_ho_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			});
			
		   function disableAllTheseDays2(date) {
	            var day = date.getDay();
	            return [(day != 0 && day != 6)];
				// 0=일, 1=월, 2=화, 4=목, 6=토 => 안나오게 할 것 
	        }
		   
		   function checkDate() {
			// 날짜 계산
				var start = new Date($('#s_ho_start').val() + 'T' + $('#s_start_time').val());
				var end = new Date($('#s_ho_end').val() + 'T' + $('#s_end_time').val());
				// 일수 구하기
				var diffDay = (end.getTime() - start.getTime()) / (1000*60*60*24);
				// 시간 구하기(휴식시간 1시간 제외)
				var diffTime = (end.getTime() - start.getTime()) / (1000*60*60) -1;
				console.log(typeof(diffTime));
				
				if((0 < diffDay && diffDay < 1) && (0 < diffTime && diffTime < 8)) {
					console.log("날짜 계산 if문탔을까?");
					$('#s_date_cal').text('0.5'); // 반차
				} else if(diffTime >= 1 && diffTime >= 8) {
					console.log("날짜 계산 else if문탔을까?");
					
					// 평일 계산할 cnt 선언
					let cnt = 0;
					while(true) {
						let tmpDate = start;
						// 시작시간이 끝나는시간보다 크면
						if(tmpDate.getTime() > end.getTime()) {
							console.log("cnt : " + cnt);
							break;
						} else { // 아니면
							let tmp = tmpDate.getDay();
							// 주말일 때 
							if(tmp == 0 || tmp == 6) {
								console.log("주말이다");
							} else { // 평일일 때
								console.log("평일이다");
								// 평일 cnt 올려주기
								cnt++;
							}
							tmpDate.setDate(start.getDate() + 1);
						}
					}
					
					// 날짜 계산
					let diff = Math.abs(end.getTime() - start.getTime());
					diff = Math.ceil(diff / (1000 * 3600 * 24));
					
					console.log("diff : " + diff);
					console.log("diff 타입 : " + typeof(diff));
					
					// cnt string으로 변환하여 일수 나타내기
					var cntStr = String(cnt);
					$('#s_date_cal').text(cntStr);
				} else {
					console.log("날짜 계산 else문탔을까?");
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
			console.log("클릭 안되니? 독업데이트야?");
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
					console.log("성공");
					alert(result);
					$("#s_before_doc").trigger("click");
				}
			});
		}
		
		// 의견 클릭 시
		function opinion() {
			var rejectMsg = "${readHoDoc.eap_reject}";
			console.log(rejectMsg);
			if(rejectMsg == null || rejectMsg == "") {
				alert("반려 사유가 없습니다.");
			} else {
				alert(rejectMsg);
			}
		}
	
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
		function belist() {
			$('#s_before_doc').trigger('click');
		}
		
		// 결재 수신 문서 메뉴 클릭(목록으로)
		function relist() {
			$('#s_receipt_doc').trigger('click');
		}
	</script>
</body>
</html>