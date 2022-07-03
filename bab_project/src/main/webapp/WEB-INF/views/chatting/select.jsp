<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- sockjs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<!-- stompjs -->
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.umd.min.js"></script>
<meta charset="UTF-8">
<!-- <title>채팅</title> -->
<style>
	.s_receive_chat {
		background-color: lightblue;
		margin-bottom: 5px;
		border-radius: 10px;
		width: 300px;
		font-size: 1.2em;
		margin-right: 70%;
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
		margin-left: 70%;
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
	
	#s_eap_btn {
		width: 240px;
	}
	
	#s_emp_list {
		font-size: 1.1em;
		width: 120px;
		height: 45px;
	}
	
	#s_chat_list {
		color: rgb(1, 3, 38);
		font-size: 1.1em;
		border: 1px solid;
	}
	
	#s_sub_menu {
		display: flex;
		margin-top: 5px;
	}
	
	.s_menu_box {
		width: 242px;
		height: 910px;
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 20px;
		overflow: auto;
	}
	
	.s_emp_box {
		display: flex;
		align-items: center;
		justify-content: space-evenly;
		border-bottom: 1px solid lightgray;
		padding: 10px 0;
	}
	
	.s_img_style {
		width: 50px;
		height: 50px;
		border-radius: 25px;
	}
	
	#s_f_list {
		font-size: 1.2em;
		padding: 10px 0;
		font-weight: bold;
		color: #0d6efd;
		text-align: center;
		margin-top: 5px;
	}
	
	.s_dn_en {
		display: inline-block;
	}
	
	#s_sub_menu_box {
		width: 250px; 
		height: 1000px; 
		margin-top: 25px;
		margin-left: 10px;
	}
	
	#s_menu_box2 {
		display: none;
	}
	
	.s_room_tt {
		font-size: 1.2em;
	    font-weight: bold;
	}
	
	.s_chat_box {
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<section>
        <article style="float: left;">
            <div id="s_sub_menu_box">
                <button id="s_eap_btn" class="btn btn-success btn-lg">방 만들기</button>

				<div id="s_sub_menu">
	                <button id="s_emp_list" class="btn btn-primary s_chat_menu">사원목록</button>
	                <button id="s_chat_list" class="btn btn-light s_chat_menu">채팅 리스트</button>
                </div>
                <div id="s_menu_box1" class="s_menu_box">
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993019719303036938/712e025f48a9e7c0.PNG">
	                	<div class="s_dn_en">회계팀 - 손은진</div>
	                </div>
	                <div id="s_f_list">친구 리스트</div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
	                	<div class="s_dn_en">영업팀 - 차두리</div>
	                </div>
                </div>
                <div id="s_menu_box2" class="s_menu_box">
                	<div class="s_chat_box">
	                	<div class="s_room_tt">BAB 모여라(5)</div>
	                	<div>배고파 죽겠다</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">장혜미</div>
	                	<div>오늘도 야근이에요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                	<div class="s_chat_box">
	                	<div class="s_room_tt">윤영원</div>
	                	<div>오늘 회의 참석하셨어요? 무슨 얘기 했어요?</div>
                	</div>
                </div>
            </div>
        </article>  
        <article style="float: left;">
            <div style="border: 1px solid lightgray;height: 1012px;width: 1050px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_eap_content_box">
            	
                <div class="s_chat_home">
                	<div>BAB 모여라 (5)</div>
                	<div>손은진, 장혜미, 윤영원, 이해람, 서지훈</div>
                	<div style="border: 1px solid lightgray; margin-bottom: 10px;"></div>
                	<div id="messageArea" style="height: 700px; overflow: auto;"></div>
                	<div style="margin-top: 10px;display: flex;justify-content: center;">
	                	<input style="width: 900px; height: 50px; display: inline-block;" type="text" placeholder="채팅 입력" id="message" onkeyup="fn_enter(event)" class="form-control" />
						<button id="sendBtn" style="height: 50px; width: 80px; margin-left: 10px;" class="btn btn-success">전송</button>
					</div>
				</div>
					
	            </div>
        </article>    
    </section>

</body>

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
	// 채팅 연결할 주소
	let sock = new SockJS("http://localhost:8090/bab/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send(emp_name + ',' + $("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var name = data.substring(0,data.indexOf(","));
		var message = data.substring(data.indexOf(",")+1);
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
		
		// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
		var offset = $("#messageArea").children().last().offset();
		console.log(offset);
		$("#messageArea").animate({scrollTop : 90000},0);
	
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append(emp_name + "님이 대화를 종료하셨습니다.");

	}
</script>
</html>