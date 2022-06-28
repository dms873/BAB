<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>지출결의서 양식</title> -->
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
		<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">지출결의서</div>
		<div style="padding: 50px 10px 20px; clear: both;">
			<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : </div> 
			<input type="text" class="form-control" style="display: inline-block; width: 583px; margin-left: 5px;" readonly>
		</div>
		
		<div style="border: 1px solid lightgray; margin: 10px;"></div>
		<div style="margin: 0 10px;">
		
			<div style="padding: 10px 0;">
				<div class="s_frm_title">1. 지출 내용</div>
				<textarea class="form-control" style="resize: none;" readonly></textarea>
			</div>
			
			<div style="padding: 10px 0;">
				<div class="s_frm_title">2. 지출 내역</div>
				<table class="table" style="text-align: center;">
				  <thead>
				    <tr>
				      <th scope="col" style="width: 130px;">날짜</th>
				      <th scope="col" style="width: 300px;">내역</th>
				      <th scope="col" style="width: 70px;">수량</th>
				      <th scope="col" style="width: 150px;">금액</th>
				      <th scope="col" style="width: 130px;">결제수단</th>
				    </tr>
				  </thead>
				  <tbody id="s_default_tbody" class="s_default_tbody_cl">
				    <tr>
				      <th scope="row"><input type="date" class="form-control" name="sp_date" readonly></th>
				      <td><input type="text" class="form-control" name="sp_detail" readonly></td>
				      <td><input type="number" class="form-control" readonly></td>
				      <td><input type="text" class="form-control" readonly></td>
				      <td>
				      	<select class="form-select" aria-label="Default select example" disabled="disabled">
				      		<option value="c">신용카드</option>
				      		<option value="a">가상계좌</option>
				      	</select>
				      </td>
				    </tr>
				    
				    </tbody>
				    <tfoot>
				    <tr>
				    	<th colspan="3">합계</th>
				      	<td colspan="2">\ <span></span> (VAT 포함)</td>
				    </tr>
				    </tfoot>
				</table>
				<!-- <button id="s_add_sp_detail" class="btn btn-success" onclick="addTr()">내역 추가</button> -->
			</div>
			
			<div style="padding: 10px 0;">
				<div class="s_frm_title">3. 기타</div>
				<div>문의사항은 BAB 손은진(010-1234-5678)에게 연락바랍니다. 끝.</div>
			</div>
			
			<!-- <div style="padding: 10px 0;">
					<div class="s_frm_title">파일첨부</div>
					<input type="file" class="form-control">
			</div> -->
		
		</div>
	</div>
    <script>
    	function addTr() {
    		// console.log("클릭되냐고~");
    		$(".s_default_tbody_cl").prepend(
					'<tr>'
				      + '<th scope="row"><input type="date" class="form-control" name="sp_date"></th>'
				      + '<td><input type="text" class="form-control" name="sp_detail"></td>'
				      + '<td><input type="number" id="sp_count" class="form-control sp_count" name="sp_count"></td>'
				      + '<td><input type="text" class="form-control sp_amount" id="sp_amount" name="sp_amount" onkeyup="commas(this)" onblur="total()"></td>'
				      + '<td>'
				      + '<select class="form-select" aria-label="Default select example">'
				      		+ '<option value="c">신용카드</option>'
				      		+ '<option value="a">가상계좌</option>'
			      	  + '</select>'
				      + '</td>'
				    + '</tr>'	
				);
    	}
	</script>
	
	<script>
		/* function total() {
			// 두 번째 로드 시 값 안불러와지는 이유는 뭘까? ㅎㅎ
			console.log("sp_amount의 값 클래스 : " + $(".sp_amount").val());
			console.log("sp_amount의 값 클래스 name : " + $("input[name='sp_amount']").val());
			console.log("sp_amount의 값 클래스 도큐먼트 : " + document.getElementsByClassName('sp_amount')[0].value);
			console.log("sp_count의 값 클래스 : " + $(".sp_count").val());
			console.log("sp_amount의 값 아이디 : " + $("#sp_amount").val());
			console.log("sp_count의 값 아이디 : " + $("#sp_count").val());
			console.log("s_total_price의 text : " + $("#s_total_price").text());
			var sp_count = $(".sp_count").val();
			var sp_amount = $(".sp_amount").val();
			
			console.log("sp_count : " + sp_count);
			console.log("sp_amount : " + sp_amount);
			
			const number = sp_amount.replace(/,/g, "");
			
			$("#s_total_price").text(Number(sp_count * number));
			
			var total = $("#s_total_price").text();
			var total2 = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#s_total_price').text(total2);
		}; */
		
	</script>
	
	<script>
	function commas(t) {

		// 콤마 빼고 
		var x = t.value;			
		x = x.replace(/,/gi, '');

	    // 숫자 정규식 확인
		var regexp = /^[0-9]*$/;
		if(!regexp.test(x)){ 
			$(t).val(""); 
			alert("숫자만 입력 가능합니다.");
		} else {
			x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
			$(t).val(x);			
		}
	}
	</script>
	

</body>
</html>