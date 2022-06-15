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
    <script>
    	UPLOADCARE_LOCALE = "ko"
	</script>
<meta charset="UTF-8">
<title>휴가신청서 양식</title>
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

	<span><a id="s_eap_app" href="#">결재요청 | </a></span>
	<span><a id="s_appLine_btn" href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">결재선 지정 | </a></span>
	<span><a id="s_cancel_btn" href="#">취소</a></span>

	<!-- 결재선 지정 Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width: 1200px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">결재선 지정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <ul class="nav nav-pills">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#" id="s_eap_appLine">결재선</a>
			  </li>
			</ul>
			<div id="s_modal_content">나는 결재선</div>
			<div id="s_btn_i" style="float: left;margin-left: 30px;display: flex;margin-top: 100px;align-content: center;flex-direction: column;">
				<span id="s_remove_appLine">
					<i style="font-size: 2em;cursor: pointer;" class="bi bi-arrow-left-square"></i>
				</span>
				<span id="s_add_appLine" style="margin: 50px 0;">
					<i style="font-size: 2em;cursor: pointer;" class="bi bi-arrow-right-square-fill"></i>
				</span>
				<span id="s_remove_appDept">
					<i style="font-size: 2em;cursor: pointer;" class="bi bi-arrow-left-square"></i>
				</span>
				</div>
			<div style="float: left;width: 400px;text-align: center; margin-left: 100px;">
				<div>
					<div style="font-size: 1.2em;font-weight: bold;">결재선 리스트</div>
						<div style="border-bottom: 1px solid lightgray; margin: 20px 0;"></div>
						<table class="table" style="text-align: center; width: 400px;">
						  <thead>
						    <tr>
						      <th scope="col">NO</th>
						      <th scope="col">이름</th>
						      <th scope="col">부서</th>
						      <th scope="col">직책</th>
						    </tr>
						  </thead>
						  <tbody class="s_appLine_tbody_cl" style="text-align: center;width: 400px;">
						  </tbody>
						</table>
				</div>
				
				<div style="margin-top: 50px;">	
					<div style="font-size: 1.2em;font-weight: bold;">참조처 리스트</div>
						<div style="border-bottom: 1px solid lightgray; margin: 20px 0;"></div>
						<table class="table" style="text-align: center; width: 400px;">
						  <thead>
						    <tr>
						      <th scope="col">NO</th>
						      <th scope="col">참조 부서명</th>
						    </tr>
						  </thead>
						  <tbody class="s_appDept_tbody_cl" style="text-align: center;width: 400px;">
						  </tbody>
						</table>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="s_add_appLine_list">확인</button>
	      </div>
	    </div>
	  </div>
	</div>


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
				<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : </div> 
				<input type="text" class="form-control" style="display: inline-block; width: 583px; margin-left: 5px;">
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
					<textarea class="form-control" style="resize: none;"></textarea>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">3. 신청기간</div>
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block;"> 부터
					<input type="datetime-local" class="form-control" style="width: 250px; display: inline-block; margin-left: 10px;"> 까지
					<div style="display: inline-block;">(총 0일)</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">4. 기타</div>
					<div>문의사항은 BAB 손은진(010-1234-5678)에게 연락바랍니다. 끝.</div>
				</div>
				
				<div style="padding: 10px 0;">
					<div class="s_frm_title">파일첨부</div>
					<!-- <input type="file" class="form-control"> -->
					<div id="s_file_upload">
						<input type="hidden"
						    role="uploadcare-uploader"
						    data-public-key="991bc66817ca4103d3ee"
						    data-tabs="file url"/>
				    </div>
					<input type="hidden" name="fileUrl" id="fileUrl">
				</div>
				
			
			</div>
		</div>
		
	<script>
	    // 결재선 클릭 시
	    $("#s_eap_appLine").click(function() {
	    	$("#s_modal_content").load("<%=request.getContextPath()%>/organ/selectList");
	    });
   	</script>
		
	<script>
        var cnt = 1;
        var deptCnt = 1;
           
        // 결재선에서 '->' 클릭 시
		$("#s_add_appLine").click(function() {
			console.log("추가");
               var text = $(".jstree-clicked").text();
               console.log("이 값 넣어야함 : " + text);
               var name = $('.jstree-clicked').text().substr(0,3);
               console.log("이름 : " + name);
               var job = $('.jstree-clicked').text().substr(4,2);
               console.log("직위 : " + job);
               var deptText = $('.jstree-clicked').parent().parent().parent().text().substr(0,3);
               console.log("부서 : " + deptText);
               var deptName = $(".jstree-clicked").text();
               
               
               for(var i = 0; i < $('.s_td_name').length; i++) {
            	   if($(".s_td_name").eq(i).text() == name) {
   						alert("결재선에 이미 선택되어 있습니다.");
   						return;
   					}
   				}
   				for(var i = 0; i < $('.s_td_deptName').length; i++) {
   					if($('.s_td_deptName').eq(i).text() == deptName) {
   						alert("참조처에 이미 선택되어 있습니다.");
   						return;
   					}
   				}
               
               if($('.jstree-clicked').text().length > 3) {
	               if($(".s_appLine_tbody_cl tr").length < 3) {
	               	$(".s_appLine_tbody_cl").append(
	   	               		'<tr>'
	   	               		+ '<td>' + cnt + '</td>'
	   	               		+ '<td class="s_td_name">' + name + '</td>'
	   	               		+ '<td>' + deptText + '</td>'
	   	               		+ '<td>' + job + '</td>'
	   	               		+ '</tr>'
	   	               	);
	   		           cnt++;
	               } else {
	               	alert("결재선은 최대 3명까지 추가가 가능합니다.");
	               }
               } else if($('.jstree-clicked').text().length <= 3) {
            	   if ($(".s_appDept_tbody_cl tr").length < 2) {
	            	  $('.s_appDept_tbody_cl').append(
	            			'<tr>'
	            			+ '<td>' + deptCnt + '</td>'
	            			+ '<td class="s_td_deptName">' + deptName + '</td>'
	            			+ '</tr>'
	            	  );
	            	  deptCnt++;
            	   } else {
            		   alert("참조처는 최대 2개 부서까지 추가가 가능합니다.");
            	   }
               }
			
		});
		
		$("#s_remove_appLine").click(function() {
			console.log("삭제");
			$(".s_appLine_tbody_cl").children().first().remove();
			if(cnt == 1) {
				return;
			}
			cnt--;
		});
		
		$("#s_remove_appDept").click(function() {
			$(".s_appDept_tbody_cl").children().first().remove();
			if(deptCnt == 1) {
				return;
			}
			deptCnt--;
		});
		
		$("#s_add_appLine_list").click(function() {
			console.log("확인");
			var arr = [];
			for(var i = 0; i < $('.s_td_name').length; i++) {
				var tdName = $('.s_td_name').eq(i).text();
				arr.push(tdName);
				console.log("이름 담긴 모습 : " + arr);
				console.log("길이 : " + arr.length);
			}
			var str1 = arr[0];
			var str2 = arr[1];
			var str3 = arr[2];
			console.log("첫번째 결재자 : " + str1);
			console.log("두번째 결재자 : " + str2);
			console.log("세번째 결재자 : " + str3);
			
			if(str1 == undefined) {
				alert("결재선에 1명 이상 선택해주세요.");
			}
			if(str2 == undefined) {
				str2 = null;
			} 
			if(str3 == undefined) {
				str3 = null;
			} 
			console.log("첫번째 결재자 결과 : " + str1);
			console.log("두번째 결재자 결과 : " + str2);
			console.log("세번째 결재자 결과 : " + str3);
			// str1 => eap_first_ap에 저장
			// str2 => eap_mid_ap에 저장
			// str3 => eap_final_ap에 저장
			
			var arrDept = [];
			for(var i = 0; i < $('.s_td_deptName').length; i++) {
				var tdDeptName = $('.s_td_deptName').eq(i).text();
				arrDept.push(tdDeptName);
				console.log("참조처 부서 담긴 모습 : " + arrDept);
				console.log("참조처 길이 : " + arrDept.length);
			}
			var deptStr1 = arrDept[0];
			var deptStr2 = arrDept[1];
			
			if(deptStr1 == undefined) {
				deptStr1 = null;
			}
			if(deptStr2 == undefined) {
				deptStr2 = null;
			}
			
			console.log("첫번째 부서 결과 : " + deptStr1);
			console.log("두번째 부서 결과 : " + deptStr2);
			// deptStr1 => eap_first_dept에 저장
			// deptStr2 => eap_final_dept에 저장
		});
		
		
	</script>
		
	<script>
	
	/* 이미지등록 */
	var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');

	singleWidget.onUploadComplete(function(info) {
		$("#fileUrl").val(info.cdnUrl);
	});
	
	// 파일 첨부 버튼 2개 생겨서 한 개 없앰..
	if(document.getElementsByClassName('uploadcare--widget__button uploadcare--widget__button_type_open') != document.getElementsByClassName('uploadcare--widget__button uploadcare--widget__button_type_open')[0]) {
		document.getElementsByClassName('uploadcare--widget__button uploadcare--widget__button_type_open')[0].style.display = 'none';
	}
	
	</script>

	<script>
	   	$("#s_appLine_btn").click(function() {
	   		console.log("holiday 결재선 지정 떠라");
	   		$("#s_modal_content").load("<%=request.getContextPath()%>/organ/selectList");
	   	});
   </script>
    
    
	

</body>
</html>