<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>휴가신청서 양식</title> -->
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

	<div class="s_div_container" style="height: 800px;">
		<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">휴가신청서</div>
			<div style="padding: 50px 10px 20px; clear: both;">
				<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : </div> 
				<input type="text" class="form-control" style="display: inline-block; width: 583px; margin-left: 5px;" readonly>
			</div>
			
			<div style="border: 1px solid lightgray; margin: 10px;"></div>
			
			<div style="margin: 0 10px;">
			
				<div style="padding: 10px 0;">
					<div class="s_frm_title">1. 종류</div>
					<div class="form-check" style="display: inline-block;">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    연차
					  </label>
					</div>
					<div class="form-check" style="display: inline-block;">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
					  <label class="form-check-label" for="flexRadioDefault2">
					    반차
					  </label>
					</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">2. 내용</div>
					<textarea class="form-control" style="resize: none;" readonly></textarea>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">3. 신청기간</div>
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block;" readonly> 부터
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block; margin-left: 10px;" readonly> 까지
					<div style="display: inline-block;">(총 0일)</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">4. 기타</div>
					<div>문의사항은 BAB 손은진(010-1234-5678)에게 연락바랍니다. 끝.</div>
				</div>
			</div>
		</div>
</body>
</html>