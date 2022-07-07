<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		height: 740px;
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
	    height: 100px;
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
	    border-radius: 10px;
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
<!-- SweetAlert -->
<style>
	/*모달창  */
	.swal-modal {
		background-color: white;
		border: 3px solid white;
	}
	/*ok버튼  */
	.swal-button--danger {
		background-color: #0583F2;
		color: white;
	}
	/*cancel버튼  */
	.swal-button--cancel {
		background-color: red;
		color: white;
	}
	/*ok버튼  */
	.swal-button--confirm {
		background-color: #0583F2;
		color: white;
	}
	/*아이콘 테두리  */
	.swal-icon--info {
		border-color: #0583F2;
	}
	/*아이콘 i 윗부분  */
	.swal-icon--info:after {
		background-color: #0583F2;
	}
	/*아이콘 i 아랫부분  */
	.swal-icon--info:before {
		background-color: #0583F2;
	}
	/*타이틀  */
	.swal-title {
		font-size: 20px;
		color: black;
	}
	/*텍스트  */
	.swal-text {
		color: black;
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
	                	<div class="s_dn_en">${selectOne.dept_name } - ${selectOne.emp_name }</div>
	                </div>
	                <div id="s_f_list">친구 리스트</div>
	                <c:forEach items="${selectEmpList }" var="i">
		                <div class="s_emp_box">
		                	<img class="s_img_style" src="${i.emp_file_path }">
		                	<div class="s_dn_en">${i.dept_name } - ${i.emp_name }</div>
	                	</div>
	                </c:forEach>
                </div>
                <div id="s_menu_box2" class="s_menu_box s_scroll">
                	<c:forEach items="${selectRoom }" var="i">
	                	<div class="s_chat_box">
	                		<input type="hidden" id="${i.room_no }" value="${i.room_no }">
		                	<div class="s_room_tt">${i.room_title }</div>
		                	<div>마지막 대화 내용 뜰곳</div>
	                	</div>
                	</c:forEach>
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
	    <div class="modal-content" style="height: 1200px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">방 만들기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
      			<div>
      				<div class="s_select_part_tt">방 제목</div>
      				<input type="text" class="form-control" style="margin-bottom: 30px;" id="s_room_title" name="room_title" placeholder="방 제목을 입력해주세요." required>
      			</div>
        		<div>
        			<div class="s_select_part_tt">대화상대 선택<span id="s_select_part_cnt"></span></div>
	        		<div id="s_select_part" class="s_scroll">
	        			<div style="margin-top: 17px;" id="s_invite_list">초대할 친구를 선택해주세요.</div>
        			</div>
       			</div>
		        <div class="s_modal_menu_box s_scroll">
                <div id="s_f_list">친구 리스트</div>
                <c:forEach items="${selectEmpList }" var="i">
	                <div class="s_emp_box">
	                	<img class="s_img_style" src="${i.emp_file_path }">
	                	<div class="s_dn_en">${i.dept_name } - ${i.emp_name }</div>
	                	<div class="form-check">
						  <input class="form-check-input" name="${i.emp_name }" type="checkbox" value="">
						</div>
	                </div>
                </c:forEach>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="s_create_room">방만들기</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>

<!-- 모달창 스크립트 -->
<script>
	// 체크박스 선택됐을 때 대화상대선택 박스에 넣기
	
	$("input[type='checkbox']").change(function() {
		var name = $(this).parent().siblings().text();
		name = name.split(' - '); // 배열 형식으로 가져옴  ex) name[0] 영업팀 name[1] 차두리
		if($("input:checkbox[name=" + name[1] + "]").is(':checked')) {
			$("#s_invite_list").css('display', 'none');
			$("#s_select_part").append('<div class="s_invite_p" >' + name[1] + '<button type="button" class="btn-close" onclick="remove(this)" aria-label="Close"></button></div>')
			cplength();
		} else {
			for(var i=0; i<$(".s_invite_p").length; i++){
				if($(".s_invite_p").eq(i).text() == name[1]) {
					$(".s_invite_p").eq(i).remove();
					break;
				}
			}
			cplength();
		}
		var offset = $("#s_select_part").children().last().offset();
		$("#s_select_part").animate({scrollTop : 90000},0);
	})
	
	// 대화상대선택 옆 띄울 숫자
	function cplength() {
		if($(".s_invite_p").length == 0) {
			$("#s_select_part_cnt").text("");
		} else {
			$("#s_select_part_cnt").text($(".s_invite_p").length);
		}
	}
	
	// 대화상대 X 버튼 눌렀을 때 제거
	function remove(e) {
		var name = $(e).parent("div").text();
		$("input:checkbox[name=" + name + "]").prop("checked", false);
		$(e).parent().remove();
		cplength();
	}
	
	// 방만들기 버튼 클릭 시 대화상대 선택에 있는 사람들 DB에 저장
	$("#s_create_room").click(function() {
		
		
		var arr = [];
		for(var i = 0; i < $(".s_invite_p").length; i++) {
			arr.push($(".s_invite_p").eq(i).text());
		}
		
		arr.push("${selectOne.emp_name}");
		console.log(arr);
		
		var obj = {
					"emp_name" : arr,
					"room_title" : $("#s_room_title").val()
				};
		
		// 방 제목 미입력 시
		if($("#s_room_title").val() == "") {
			swal({
                title: "",
                text: "방 제목을 입력해주세요",
                icon: "error",
                closeOnClickOutside: false,
                closeOnEsc: false
            });
		} else {
			$.ajax({
				url : "<%=request.getContextPath()%>/echo/insertmember"
					, type: "post"
					, data: obj
					, success: function(result) {
						console.log(result);
						$(".btn-close").trigger('click');
						swal({
		                    title: "",
		                    text: result,
		                    icon: "success",
		                    closeOnClickOutside: false,
		                    closeOnEsc: false
		                });
						$("#menu_chat").get(0).click();
					}
			});
		}
		
	});
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
	
	// 채팅 리스트에 있는 대화방 리스트 클릭했을 때
	$(".s_chat_box").click(function() {
		$(".s_chat_box").css('color', 'black');
		$(this).css('color', 'rgb(13, 110, 253)');
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
		var roomNo = $(this).children().val();
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/echo/selectroom?room_no=" + roomNo);
	});
</script>
</html>