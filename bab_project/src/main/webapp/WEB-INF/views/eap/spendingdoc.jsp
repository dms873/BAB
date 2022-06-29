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
</head>
<body>

	<div id="s_btn">
		<span><a id="s_eap_cancle" href="#">결재회수 | </a></span>
		<span><a id="s_eap_update" href="#">문서 수정 | </a></span>
		<span><a id="s_opinion_btn" href="#" onclick="opinion()">의견 | </a></span>
		<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>
	</div>
	
	<div id="s_eap_content_box_left">
		<div class="s_div_container" style="height: 800px;">
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
								<c:if test="${readSpDoc.eap_sta_code eq 'S'}">
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
								<c:if test="${readSpDoc.eap_sta_code eq 'S'}">
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
								<c:if test="${readSpDoc.eap_sta_code eq 'S'}">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
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
						<c:if test="${readSpDoc.eap_step eq 1 && readSpDoc.eap_sta_code eq 'S' }">
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
						<c:if test="${(readSpDoc.eap_step eq 1 || readSpDoc.eap_step eq 2) && readSpDoc.eap_sta_code eq 'S' }">
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
						<c:if test="${(readSpDoc.eap_step eq 1 || readSpDoc.eap_step eq 2 || readSpDoc.eap_step eq 3) && readSpDoc.eap_sta_code eq 'S' }">
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
			$('#s_sp_tt').replaceWith('<input type="text" style="display: inline-block; width: 583px; margin-left: 5px;" class="form-control" value="${readSpDoc.eap_title }" id="s_sp_tt">');
			// 내용
			$('#s_eap_content').replaceWith('<textarea class="form-control" style="resize: none;" id="s_sp_co">${readSpDoc.eap_content }</textarea>')
			var date = "${spInfo.sp_date }";
			// 년월일만 출력
			date = date.substr(0,10);
			console.log(date);
			// 날짜
			$('#s_sp_date').replaceWith('<input type="date" class="form-control s_sp_date" id="s_sp_date" name="sp_date" style="width: 135px;">');
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
			$("#s_btn").append('<span><a id="s_doc_update" href="#" onclick="update()">문서 수정 | </a></span>');
			$("#s_btn").append('<span><a id="s_list_btn" href="#" onclick="list()">목록</a></span>');
			
			/* 이미지등록 */
			var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
		
			singleWidget.onUploadComplete(function(info) {
				$("#fileUrl").val(info.cdnUrl);
				console.log("파일URL : " + $("#fileUrl").val(info.cdnUrl));
				console.log(JSON.stringify($("#fileUrl").val(info.cdnUrl)));
			});
		});
	</script>
	
	<script>
		// 문서 수정 클릭 시
		function update() {
			console.log("클릭 안되니? 독업데이트야?");
			dataObj = {
					"sp_date" : $('.s_sp_date').val(),
					"sp_detail" : $('.s_sp_detail').val(),
					"sp_count" : $('#num1').val(),
					"sp_amount" : $('#num2').val(),
					"sp_pay_code" : $('.s_select').val(),
					"df_no" : $('#s_dfNo').text(),
					"eap_title" : $('#s_sp_tt').val(),
					"eap_content" : $('#s_sp_co').val(),
					"eap_file_path": $("#fileUrl").val(),
					"s_img": $("#s_img").attr("src")
			}
			
			
			// 문서 수정 클릭 시 DB다녀올 ajax
			$.ajax({
				url : "<%=request.getContextPath()%>/eap/updatesp"
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
			var rejectMsg = "${readSpDoc.eap_reject}";
			console.log(rejectMsg);
			if(rejectMsg == null || rejectMsg == "") {
				alert("반려 사유가 없습니다.");
			} else {
				alert(rejectMsg);
			}
		}
	
	</script>
	
	
	<script>
		// 수정 시 합계 함수
		function total() {
			console.log("탔나용 ? ? ?");
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
			console.log("탔나용 ? ? ?");
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