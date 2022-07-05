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
	#s_chat_btn {
		width: 240px;
	}
	
	#s_emp_list {
		font-size: 1.1em;
		width: 120px;
		height: 45px;
		border: 1px solid;
	}
	
	#s_chat_list {
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
	
	.s_modal_menu_box {
		width: 400px;
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
	
	.s_chat_box {
		margin-bottom: 20px;
		border-bottom: 1px solid lightgray;
		padding-bottom: 20px;
		cursor: pointer;
	}
	
	.modal-body {
		margin: 0 auto;
	}
	
	#s_select_part {
	    text-align: center;
	    height: 200px;
	    overflow: auto;
	    border: 1px solid lightgray;
	    border-radius: 10px;
	    padding: 20px;
	    margin-bottom: 30px;
	    width: 400px;
	}
	
	.s_select_part_tt {
		font-size: 1.2em;
	    font-weight: bold;
	    text-align: center;
    	margin-bottom: 10px;
	}
	
	.s_invite_p {
		border: 1px solid;
	    width: 90px;
	    padding: 0 10px;
	    border-radius: 10px;
	    display: inline-block;
	    margin: 5px;
	}
	
	.btn-close {
		font-size: .7em;
		margin-left: 3px;
	}
	
	#s_select_part_cnt {
		margin-left: 5px;
	    color: gray;
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
	
	#s_chat_img {
	    display: flex;
	    align-content: stretch;
	    justify-content: center;
	    align-items: center;
	    flex-direction: row;
	    flex-wrap: wrap;
	    margin-top: 320px;
	}
	
	.s_room_tt {
		font-size: 1.2em;
	    font-weight: bold;
	}
</style>
</head>
<body>
	<section>
        <article style="float: left;">
            <div id="s_sub_menu_box">
                <button id="s_chat_btn" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#roomModal">방 만들기</button>

				<div id="s_sub_menu">
	                <button id="s_emp_list" class="btn btn-primary s_chat_menu">사원목록</button>
	                <button id="s_chat_list" class="btn btn-light s_chat_menu">채팅 리스트</button>
                </div>
                <div id="s_menu_box1" class="s_menu_box s_scroll">
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
                <div id="s_menu_box2" class="s_menu_box s_scroll">
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
            <div style="border: 1px solid lightgray;height: 1012px;width: 1050px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_chat_content_box">
            	<div id="s_chat_img">
           			<img src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png">
           		</div>
            </div>
        </article>    
    </section>
    
    
    <!-- 방 만들기 Modal -->
	<div class="modal fade" id="roomModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">방 만들기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
      			<div>
      				<div class="s_select_part_tt">방 제목</div>
      				<input type="text" class="form-control" style="margin-bottom: 10px;" placeholder="방 제목을 입력해주세요." required>
      			</div>
        		<div>
        			<div class="s_select_part_tt">대화상대 선택<span id="s_select_part_cnt"></span></div>
	        		<div id="s_select_part">
	        			<div style="margin-top: 65px;" id="s_invite_list">초대할 친구를 선택해주세요.</div>
        			</div>
       			</div>
		        <div class="s_modal_menu_box s_scroll">
                <div id="s_f_list">친구 리스트</div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두리</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두일</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두이</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두삼</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두사</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두오</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두육</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두칠</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두팔</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두구</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차두십</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차십일</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차십이</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
                <div class="s_emp_box">
                	<img class="s_img_style" src="https://media.discordapp.net/attachments/692994434526085184/993024953060429824/unknown.png">
                	<div class="s_dn_en">영업팀 - 차십삼</div>
                	<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
                </div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">초대하기</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>

<!-- 모달창 스크립트 -->
<script>
	// 체크박스 선택됐을 때 대화상대선택 박스에 넣기(TODO!!! 아직 잘못된 코드, 수정 예정)
	$("input[type='checkbox']").change(function() {
		var name = $(this).parent().siblings().text();
		name = name.split(' - ');
		if($("input[type='checkbox']").is(':checked')) {
			console.log("체크박스 체크됨");
			$("#s_invite_list").css('display', 'none');
			$("#s_select_part").append('<div class="s_invite_p">' + name[1] + '<button type="button" class="btn-close" onclick="remove()" aria-label="Close"></button></div>')
			$("#s_select_part_cnt").text($(".s_invite_p").length);
		} else {
			console.log("체크박스 해지됨");
			// $("input[type='checkbox'").prop('checked', false);
		}
		var offset = $("#s_select_part").children().last().offset();
		console.log(offset);
		$("#s_select_part").animate({scrollTop : 90000},0);
	})
	// s_invite_list
	
	// 대화상대 X 버튼 눌렀을 때 제거
	function remove() {
		console.log($('.btn-close').parent());
		$(this).remove();
	}
</script>

<!-- 서브메뉴 눌렀을 때 -->
<script>
	// 채팅 리스트 클릭했을 때
	$("#s_chat_list").click(function() {
		$("#s_menu_box2").css('display', 'block');
		$("#s_menu_box1").css('display', 'none');
		$("#s_chat_list").attr('class', 'btn btn-primary');
		$("#s_emp_list").attr('class', 'btn btn-light');
		$("#s_chat_list").css('border', '1px solid #0d6efd');
		$("#s_emp_list").css('border', '1px solid');
	});
	
	// 사원목록 클릭했을 때
	$("#s_emp_list").click(function() {
		$("#s_menu_box1").css('display', 'block');
		$("#s_menu_box2").css('display', 'none');
		$("#s_emp_list").attr('class', 'btn btn-primary');
		$("#s_chat_list").attr('class', 'btn btn-light');
		$("#s_emp_list").css('border', '1px solid #0d6efd');
		$("#s_chat_list").css('border', '1px solid');
	});
</script>

<!-- 채팅 리스트에서 방 눌렀을 떄 -->
<script>
	$(".s_chat_box").click(function() {
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/echo/selectroom");
	});
</script>
</html>