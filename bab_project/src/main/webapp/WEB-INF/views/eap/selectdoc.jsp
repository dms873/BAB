<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<meta charset="UTF-8">
<title>전자결재 상세조회</title>
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
</head>
<body>

	<div>
		<span><a id="s_eap_app" href="#">결재회수 | </a></span>
		<span><a id="s_appLine_btn" href="#">문서 수정 | </a></span>
		<span><a id="s_opinion_btn" href="#">의견 | </a></span>
		<span><a id="s_list_btn" href="#">목록</a></span>
	</div>
	
	<div style="border: 1px solid lightgray;height: 900px;width: 900px;margin-top: 20px;margin-left: 2px;border-radius: 10px;padding: 20px; float: left;">
		<div class="s_div_container" style="height: 800px;">
		<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">휴가신청서</div>
		
		<div style="float: left; width: 230px; margin: 0 30px;">
			<table border="1" id="s_eap_draft_info">
					<tr>
						<th>기안자</th>
						<td>손은진</td>
					</tr>
					<tr>
						<th>기안부서</th>
						<td>회계팀</td>
					</tr>
					<tr>
						<th>기안일</th>
						<td>2022/05/26</td>
					</tr>
					<tr>
						<th>문서번호</th>
						<td>자동생성</td>
					</tr>
				</table>
		</div>
		
		<div style="float: left;width: 130px; margin-right: 10px;">
			<table border="1" id="s_eap_draft">
				<tr>
					<th rowspan="2">신청</th>
					<td>차장</td>
				</tr>
				<tr>
					<td>손은진</td>
				</tr>
			</table>
		</div>
		
		<div style="float: left;width: 130px; margin-right: 5px;">
			<table border="1" class="s_eap_draft_app">
				<tr>
					<th rowspan="3">승인</th>
					<td>차장</td>
				</tr>
				<tr>
					<td>박정환</td>
				</tr>
				<tr>
					<td><img src="https://media.discordapp.net/attachments/692994434526085184/984465393517199430/stamp_1.png" style="width: 50px;"></td>
				</tr>
			</table>
		</div>
		
		<div style="float: left;width: 130px; margin-right: 5px;">
			<table border="1" class="s_eap_draft_app">
				<tr>
					<th rowspan="3">승인</th>
					<td>부장</td>
				</tr>
				<tr>
					<td>서언주</td>
				</tr>
				<tr>
					<td><img src="https://media.discordapp.net/attachments/692994434526085184/984465393068421141/stamp_2.png" style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	
			<div style="padding: 50px 10px 20px; clear: both;">
				<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : <span>띄울예정</span></div> 
			</div>
			
			<div style="border: 1px solid lightgray; margin: 10px;"></div>
			
			<div style="margin: 0 10px;">
			
				<div style="padding: 10px 0;">
					<div class="s_frm_title">1. 종류</div>
					<div class="form-check" style="display: inline-block;">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked onclick="return false;">
					  <label class="form-check-label" for="flexRadioDefault1">
					    연차
					  </label>
					</div>
					<div class="form-check" style="display: inline-block;">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" onclick="return false;">
					  <label class="form-check-label" for="flexRadioDefault2">
					    반차
					  </label>
					</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">2. 내용</div>
					<textarea class="form-control" style="resize: none; cursor: default;" onclick="return false;">내용 띄울예정</textarea>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">3. 신청기간</div>
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block;" onclick="return false;" id="ho_start" value="2022-06-14T15:06"> 부터
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block; margin-left: 10px;" onclick="return false;" id="ho_end" value="2022-06-14T15:06"> 까지
					<div style="display: inline-block;">(총 0일)</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">4. 기타</div>
					<div>문의사항은 BAB 손은진(010-1234-5678)에게 연락바랍니다. 끝.</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">파일첨부</div>
					<!-- <input type="file" class="form-control"> -->
					<input type="hidden" name="fileUrl" id="fileUrl">
				</div>
				
			
			</div>
		</div>
	</div>
	<div id="s_dt_line" style="border: 1px solid lightgray;height: 900px;width: 185px;margin-top: 20px;margin-left: 20px;border-radius: 10px;padding: 10px;float: left;">
		
	</div>
	
	<script>
		$(document).ready(function() {
			$("#s_dt_line").load("<%=request.getContextPath()%>/eap/selectdetailline");
		}) ;
	</script>
</body>
</html>