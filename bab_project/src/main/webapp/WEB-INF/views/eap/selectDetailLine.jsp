<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>결재선 지정(상세)</title> -->
<style>
	.s_div {
	    margin: 20px;
	}
	
	.s_span_fw {
		font-weight: bold;
	}
</style>
</head>
<body>
	
	<div style="padding: 10px; text-align: center;">
		
		<div style="font-size: 1.2em;font-weight: bold; margin-bottom: 20px;">결재선</div>
		<div style="padding-bottom: 20px; border-bottom: 1px solid lightgray;">
			<div>
				<span>회계팀</span>
				<span>차장</span>
			</div>
			<div>
				<span>손은진</span>
				<span style="color: crimson;font-weight: bold;">기안</span>
			</div>
		</div>
		
		<div class="s_div">
			<div>
				<span>인사팀</span>
				<span>차장</span>
			</div>
			<div>
				<span>박정환</span>
				<span class="s_span_fw">결재</span>
			</div>
		</div>
		
		<div class="s_div">
			<div>
				<span>인사팀</span>
				<span>부장</span>
			</div>
			<div>
				<span>서언주</span>
				<span class="s_span_fw">결재</span>
			</div>
		</div>
		
		<div class="s_div">
			<div>
				<span>인사팀</span>
				<span>이사</span>
			</div>
			<div>
				<span>박자민</span>
				<span class="s_span_fw">대기</span>
			</div>
		</div>
		
	</div>
	
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
	
</body>
</html>