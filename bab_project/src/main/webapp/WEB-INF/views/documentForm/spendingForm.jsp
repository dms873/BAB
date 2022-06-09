<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>지출결의서 양식</title>
<style>
	.s_frm_title {
	    font-size: 1em;
	    font-weight: bold;
	    padding: 5px 0;
	}
</style>
</head>
<body>

	<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">지출결의서</div>

	<div style="padding: 20px 0;">
		<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : </div> 
		<input type="text" class="form-control" style="display: inline-block; width: 583px; margin-left: 5px;">
	</div>
	
	<div style="margin: 0 10px;">
	
		<div style="padding: 10px 0;">
			<div class="s_frm_title">1. 지출 내용</div>
			<textarea class="form-control" style="resize: none;"></textarea>
		</div>
		
		<div style="padding: 10px 0;">
			<div class="s_frm_title">2. 지출 내역</div>
			<table class="table" style="text-align: center;">
			  <thead>
			    <tr>
			      <th scope="col">날짜</th>
			      <th scope="col">내역</th>
			      <th scope="col">수량</th>
			      <th scope="col">금액</th>
			      <th scope="col">결제수단</th>
			    </tr>
			  </thead>
			  <tbody id="s_default_tbody" class="s_default_tbody_cl">
			    <tr>
			      <th scope="row"><input type="date" class="form-control" name="sp_date"></th>
			      <td><input type="text" class="form-control" name="sp_detail"></td>
			      <td><input type="text" id="sp_count" class="form-control" name="sp_count"></td>
			      <td><input type="text" class="form-control" name="sp_amount"></td>
			      <td>
			      	<select class="form-select" aria-label="Default select example">
			      		<option value="c">신용카드</option>
			      		<option value="a">가상계좌</option>
			      	</select>
			      </td>
			    </tr>
			    
			    </tbody>
			    <tfoot>
			    <tr>
			    	<th colspan="3">합계</th>
			      	<td colspan="2">\ 19,600 (VAT 포함)</td>
			    </tr>
			    </tfoot>
			</table>
			<button id="s_add_sp_detail" class="btn btn-success" onclick="addTr()">내역 추가</button>
		</div>
		
		<div style="padding: 10px 0;">
			<div class="s_frm_title">3. 기타</div>
			<div>문의사항은 BAB 손은진(010-1234-5678)에게 연락바랍니다. 끝.</div>
		</div>
	
	</div>
	
    <script>
    	function addTr() {
    		// console.log("클릭되냐고~");
    		$(".s_default_tbody_cl").prepend(
					'<tr>'
				      + '<th scope="row"><input type="date" class="form-control"></th>'
				      + '<td><input type="text" class="form-control"></td>'
				      + '<td><input type="text" id="sp_count" class="form-control"></td>'
				      + '<td><input type="text" class="form-control"></td>'
				      + '<td>'
				      + '<select class="form-select" aria-label="Default select example">'
				      		+ '<option>신용카드</option>'
				      		+ '<option>가상계좌</option>'
			      	  + '</select>'
				      + '</td>'
				    + '</tr>'	
				);
    	}
	</script>
	

</body>
</html>