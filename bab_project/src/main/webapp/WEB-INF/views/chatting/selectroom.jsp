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
		<!-- 채팅방 제목과 대화방 참여자 수가 2명 이상이면 띄워줌 (1:1대화는 띄워주지 않음) -->
       	<div class="s_room_tt">${readRoom.room_title } <c:if test="${memberCnt > 2}">(${memberCnt })</c:if></div>
       	<div class="s_room_part">
       		<!-- 채팅방 참여자 개수 만큼 -->
       		<c:forEach items="${readMember }" var="i">
       			<!-- 채팅방 참여자 이름 표시 -->
       			<span>${i.emp_name } </span>
       		</c:forEach>
       	</div>
       	<div style="border: 1px solid lightgray; margin-bottom: 10px;"></div>
       	<div id="messageArea" class="s_scroll" style="height: 830px; overflow: auto;">
       		<!-- 채팅 DB 저장한 것 뿌리기(로그인한 사람 이름과 채팅한 사람 이름이 다르면 수신/같으면 발신 -->
			<c:forEach items="${selectChatting }" var="i" varStatus="status">
  				<c:choose>
  					<%-- 채팅 작성자와 로그인한 사람과 같으면(발신) --%>
   					<c:when test="${empName eq i.emp_name}">
   						<!-- 이전 index와 비교하려고 index 1 이상부터 -->
	  					<c:if test="${status.index != 0}">
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 같으면 -->
	  						<c:if test="${selectChatting[status.index-1].emp_name eq selectChatting[status.index].emp_name}">
	  							<!-- 채팅 내용만 띄우기 -->
	  							<div class="s_sender_chat">${i.ch_content }</div>
	  						</c:if>
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 다르면 -->
	  						<c:if test="${selectChatting[status.index-1].emp_name ne selectChatting[status.index].emp_name}">
	  							<!-- 이름이랑 채팅 내용 띄우기 -->
	  							<div class="s_sender">${i.emp_name }</div>
			      				<div class="s_sender_chat">${i.ch_content }</div>
	  						</c:if>
		      			</c:if>
		      			<!-- 현재 index가 0이면 -->
		      			<c:if test="${status.index == 0 }">
		      				<!-- 이름이랑 채팅 내용 띄우기 -->
		      				<div class="s_sender">${i.emp_name }</div>
		      				<div class="s_sender_chat">${i.ch_content }</div>
		      			</c:if>
   					</c:when>
   					<%-- 채팅 작성자와 로그인한 사람과 다르면(수신) --%>
					<c:otherwise>
						<!-- 이전 index와 비교하려고 index 1 이상부터 -->
						<c:if test="${status.index != 0}">
							<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 같으면 -->
	  						<c:if test="${selectChatting[status.index-1].emp_name eq selectChatting[status.index].emp_name}">
	  							<!-- 채팅 내용만 띄우기 -->
	  							<div class="s_receive_chat">${i.ch_content }</div>
	  						</c:if>
	  						<!-- 이전 index의 이름이랑 현재 index의 이름이랑 비교해서 다르면 -->
	  						<c:if test="${selectChatting[status.index-1].emp_name ne selectChatting[status.index].emp_name}">
	  							<!-- 이름이랑 채팅 내용 띄우기 -->
	  							<div class="s_receive">${i.emp_name }</div>
			      				<div class="s_receive_chat">${i.ch_content }</div>
	  						</c:if>
		      			</c:if>
		      			<!-- 현재 index가 0이면 -->
		      			<c:if test="${status.index == 0 }">
		      				<!-- 이름이랑 채팅 내용 띄우기 -->
		      				<div class="s_receive">${i.emp_name }</div>
	       					<div class="s_receive_chat">${i.ch_content }</div>
		      			</c:if>
   					</c:otherwise>
  				</c:choose>
   			</c:forEach>
       	</div>
       	<div style="margin-top: 10px;display: flex;justify-content: center;">
         	<input style="width: 900px; height: 50px; display: inline-block;" type="text" placeholder="채팅 입력" id="message" onkeyup="fn_enter(event)" class="form-control" />
			<button id="sendBtn" style="height: 50px; width: 80px; margin-left: 10px;" class="btn btn-success">전송</button>
		</div>
	</div>

<!-- 채팅 -->
<script>
	// 전송 버튼 눌렀을 때
	$("#sendBtn").click(function() {
		// 메세지 전송함수 실행
		sendMessage();
		// 입력한 input value 비워주기
		$('#message').val('');
	});
	
	// 엔터키 눌렀을 때
	function fn_enter(e){
		if(e.keyCode == 13){
			// 메세지 전송함수 실행
			sendMessage();
			// 입력한 input value 비워주기
			$('#message').val('');
		}
	}

	// 컨트롤러에서 가져온 로그인한 사람 이름을 emp_name 변수에 담아줌
	var emp_name = "${empName}";
	// 컨트롤러에서 가져온 방 번호를 roomNum 변수에 담아줌
	var roomNum = "${roomNo}";
	// 채팅 연결할 주소(컨트롤러의 주소)
	var sock = new SockJS("/bab/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		// 전송 시 DB에 저장하기 위해 이름, 채팅내용, 방번호 컨트롤러에 넘겨줌 
		sock.send(emp_name + ',' + $("#message").val() + ',' + roomNum);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		// 전송했을 때 보낸 이름, 채팅내용, 방번호를 data변수에 담아줌
		var data = msg.data;
		// substring을 이용하여 0부터 구분자(",")까지 잘라 이름을 name변수에 담아줌
		var name = data.substring(0,data.indexOf(","));
		// substring을 이용하여 첫번째 구분자부터 마지막구분자까지 잘라 채팅내용을 message변수에 담아줌
		var message = data.substring(data.indexOf(",")+1,data.lastIndexOf(","));
		// substring을 이용하여 마지막 구분자부터 나오는 방번호를 roomNo변수에 담아줌
		var roomNo = data.substring(data.lastIndexOf(",")+1);
		// 기존 소켓을 끊지 못하는 이슈로(수정 못함 ㅠ) 전에 똑같은 메시지 있으면 한번만 출력 및 방 번호 체크
		if($("#messageArea").children().last().text() != message && roomNum == roomNo) {
			// 보낸사람/받는사람 구분은 로그인한 이름과 비교
			if(name == emp_name){ // 보낸 사람의 경우
				// 보낸 사람이 채팅 여러개 보냈을 때 말풍선만 띄워줌
				if($("#messageArea").children().last().hasClass("s_sender_chat")) {
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				} else { // 하나만 보냈을 경우에는 이름+말풍선 띄워줌
					$("#messageArea").append('<div class="s_sender">' + name + '</div>');
					$("#messageArea").append('<div class="s_sender_chat">' + message + '</div>');
				}
			} else { // 받는 사람의 경우
				if(name != $(".s_receive").last().text()) { // 받는 사람 name과 받는사람 div의 마지막 text가 다를 경우 이름+말풍선 띄워줌
					$("#messageArea").append('<div class="s_receive">' + name + '</div>');
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				} else if($("#messageArea").children().last().hasClass("s_receive_chat")) { // 받는사람 동일인이 여러개 보냈을 때 말풍선만 띄워줌
					$("#messageArea").append('<div class="s_receive_chat">' + message + '</div>');
				} else { // 그 외에 이름+말풍선 띄워줌
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
	
	// 채팅 조회 시 스크롤바 생겼다면 자동으로 가장 하단으로 가기
	$(document).ready(function() {
		var offset = $("#messageArea").children().last().offset();
		$("#messageArea").animate({scrollTop : 90000},0);
	});
</script>
</body>
</html>