<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>채팅-방</title> -->
<style>
	.s_receive_chat {
		background-color: lightblue;
		margin-bottom: 5px;
		border-radius: 10px;
		width: 300px;
		font-size: 1.2em;
		margin-right: 67%;
		float: left;
		height: auto;
		padding: 20px;
		position: relative;
		margin-left: 20px;
		word-break: break-all;
	}
	
	.s_receive_chat:after {
		border-top: 15px solid lightblue;
		border-left: 15px solid transparent;
		border-right: 0px solid transparent;
		border-bottom: 0px solid transparent;
		content: "";
		position: absolute;
		top: 10px;
		left: -15px;
	}
	
	.s_sender_chat {
		float: right;
		margin-left: 67%;
		background-color: antiquewhite;
		margin-bottom: 5px;
		border-radius: 10px;
		width: 300px;
		font-size: 1.2em;
		height: auto;
		padding: 20px;
		position: relative;
		margin-right: 20px;
		word-break: break-all;
	}
	
	.s_sender_chat:after {
		border-top: 15px solid antiquewhite;
		border-left: 0px solid transparent;
		border-right: 15px solid transparent;
		border-bottom: 0px solid transparent;
		content: "";
		position: absolute;
		top: 10px;
		right: -15px;
	}
	
	.s_receive {
		background: none;
		font-weight: bold;
		float: left;
		margin-right: 70%;
		height: 55px;
		line-height: 70px;
		margin-left: 20px;
	}
	
	.s_sender {
		background: none;
		font-weight: bold;
		float: right;
		margin-left: 70%;
		height: 55px;
		line-height: 70px;
		margin-right: 20px;
	}
	
	.s_room_tt {
		font-size: 1.2em;
	    font-weight: bold;
	}
	
	.s_room_part {
	    margin: 5px 0 10px;
	}
	
	/* 스크롤바 디자인 */
	.s_scroll::-webkit-scrollbar {
    	width: 10px;  /* 스크롤바의 너비 */
    	height: 10px;  /* 스크롤바의 너비 */
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

	<div class="s_chat_home">
       	<div class="s_room_tt">${readRoom.room_title } <c:if test="${memberCnt > 2}">(${memberCnt })</c:if></div>
       	<div class="s_room_part">
       		<c:forEach items="${readMember }" var="i">
       			<span>${i.emp_name } </span>
       		</c:forEach>
       	</div>
       	<div style="border: 1px solid lightgray; margin-bottom: 10px;"></div>
       	<div id="messageArea" class="s_scroll" style="height: 830px; overflow: auto;"></div>
       	<div style="margin-top: 10px;display: flex;justify-content: center;">
         	<input style="width: 900px; height: 50px; display: inline-block;" type="text" placeholder="채팅 입력" id="message" onkeyup="fn_enter(event)" class="form-control" />
			<button id="sendBtn" style="height: 50px; width: 80px; margin-left: 10px;" class="btn btn-success">전송</button>
		</div>
	</div>

<!-- 채팅 -->
<script>
	// 전송 버튼 눌렀을 때
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	// 엔터키 눌렀을 때
	function fn_enter(e){
		if(e.keyCode == 13){
			sendMessage();
			$('#message').val('');
		}
	}

	// 로그인한 사람 이름
	var emp_name = "${empName}";
	var roomNum = "${roomNo}";
	// 채팅 연결할 주소
	var sock = new SockJS("/bab/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send(emp_name + ',' + $("#message").val() + ',' + roomNum);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var name = data.substring(0,data.indexOf(","));
		var message = data.substring(data.indexOf(",")+1,data.lastIndexOf(","));
		var roomNo = data.substring(data.lastIndexOf(",")+1);
		// 기존 소켓을 끊지 못하는 이슈로(수정 못함 ㅠ) 전에 똑같은 메시지 있으면 한번만 출력 및 방 번호 체크
		if($("#messageArea").children().last().text() != message && roomNum == roomNo) {
			// 보낸사람/받는사람 구분은 로그인한 이름과 비교
			if(name == emp_name){ // 보낸 사람의 경우
				// 채팅 여러개 보내면 이름 안뜨게 하기
				if($("#messageArea").children().last().hasClass("s_sender_chat")) {
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				} else { // 하나면 이름 매번 뜨기
					$("#messageArea").append('<div class="s_sender">' + name + '</div>');
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				}
			} else { // 받는 사람의 경우
				if($("#messageArea").children().last().hasClass("s_receive_chat")) {
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				} else {
					$("#messageArea").append('<div class="s_receive">' + name + '</div>');
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				}
			}
		}
		
		// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
		var offset = $("#messageArea").children().last().offset();
		$("#messageArea").animate({scrollTop : 90000},0);
	
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		// $("#messageArea").append(emp_name + "님이 대화를 종료하셨습니다.");
		console.log("종료");
	}
</script>
</body>
</html>