<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 업로드케어 CDN -->
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
    <script>UPLOADCARE_LOCALE = "ko"</script>
    <!-- datepicker CDN -->
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
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
<style>
	.s_div {
	    margin: 20px;
	}
	
	.s_span_fw {
		font-weight: bold;
	}
	
	#s_eap_content_box_right {
		width: 180px;
		float: left;
		margin-top: 20px;
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 10px;
		margin-left: 20px;
		height: 900px;
	}

	#s_eap_content_box_left {
		width: 900px;
		float: left;
		margin-top: 20px;
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 10px;
		height: 900px;
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
			<div id="s_modal_content">결재선을 선택해주세요.</div>
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

	<div id="s_eap_content_box_left">
		<div class="s_div_container" style="height: 800px;">
			<div style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">휴가신청서</div>
			
			<div style="float: left; width: 230px; margin: 0 30px;">
				<table border="1" id="s_eap_draft_info">
						<tr>
							<th>기안자</th>
							<td>${eap.emp_name }</td>
						</tr>
						<tr>
							<th>기안부서</th>
							<td>${eap.dept_name }</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td>${eap.eap_draft_date }</td>
						</tr>
						<tr>
							<th>문서번호</th>
							<td id="s_dfNo">${resultDoc.df_no }</td>
						</tr>
					</table>
			</div>
			
			<div style="float: left;width: 130px; margin-right: 10px;">
				<table border="1" id="s_eap_draft">
					<tr>
						<th rowspan="2">신청</th>
						<td>${eap.job_title }</td>
					</tr>
					<tr>
						<td>${eap.emp_name }</td>
					</tr>
				</table>
			</div>
			
			<c:forEach items="${info }" var="i">
				<div style="float: left;width: 130px; margin-right: 5px;">
					<table border="1" class="s_eap_draft_app">
						<tr>
							<th rowspan="3">승인</th>
							<td>${i.job_title }</td>
						</tr>
						<tr>
							<td>${i.emp_name }</td>
						</tr>
						<tr>
							<td>
								<c:if test="${empty i.df_no }">
									<img src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png" style="width: 50px;">
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			
			<div style="float: left;width: 130px; margin-right: 5px;" id="s_eap_final">
			</div>
		
				<div style="padding: 50px 10px 20px; clear: both;">
					<div style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목 : </div> 
					<input type="text" class="form-control" style="display: inline-block; width: 583px; margin-left: 5px;" id="s_ho_tt">
				</div>
				
				<div style="border: 1px solid lightgray; margin: 10px;"></div>
				<div style="margin: 0 10px;">
				
					<div style="padding: 10px 0;">
						<div class="s_frm_title">1. 종류</div>
						<div class="form-check" style="display: inline-block;">
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="A">
						  <label class="form-check-label" for="flexRadioDefault1">
						    연차
						  </label>
						</div>
						<div class="form-check" style="display: inline-block;">
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="H">
						  <label class="form-check-label" for="flexRadioDefault2">
						    반차
						  </label>
						</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">2. 내용</div>
						<textarea class="form-control" style="resize: none;" id="s_ho_co"></textarea>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">3. 신청기간</div>
						<div style="margin: 5px 0;">사용 가능한 휴가일수는 ${checkHo }일 입니다.</div>
						<div>
							<input type="text" placeholder="신청 시작 기간을 선택해주세요" class="form-control" style="width: 250px; display: inline-block;" id="s_ho_start">
							<input type="time" class="form-control" style="width: 150px; display: inline-block;" id="s_start_time" min="09:00:00" max="22:00:00"> 부터
						</div>
						<div>
							<input type="text" placeholder="신청 종료 기간을 선택해주세요" class="form-control" style="width: 250px; display: inline-block; margin-top: 10px;" id="s_ho_end">
							<input type="time" class="form-control" style="width: 150px; display: inline-block;" id="s_end_time" min="09:00:00" max="22:00:00"> 까지
							<div style="display: inline-block;">(총 <span id="s_date_cal">0</span>일)</div>
						</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">4. 기타</div>
						<div>문의사항은 BAB ${eap.emp_name }(${eap.emp_phone })에게 연락바랍니다. 끝.</div>
					</div>
					
					<div style="padding: 10px 0;">
						<div class="s_frm_title">파일첨부</div>
						<!-- <input type="file" class="form-control"> -->
						<div id="s_file_upload">
							<input type="hidden"
							    role="uploadcare-uploader"
							    data-public-key="991bc66817ca4103d3ee"
							    data-tabs="file url" id="eap_file_path"/>
					    </div>
						<input type="hidden" name="fileUrl" id="fileUrl">
					</div>
					
				
				</div>
			</div>
		</div>
		
		<div id="s_eap_content_box_right">
			<div style="padding: 10px; text-align: center;">
			<div style="font-size: 1.2em;font-weight: bold; margin-bottom: 20px;">결재선</div>
			<div style="padding-bottom: 20px; border-bottom: 1px solid lightgray;">
				<div>
					<span>${eap.dept_name }</span>
					<span>${eap.job_title }</span>
				</div>
				<div>
					<span>${eap.emp_name }</span>
					<span style="color: crimson;font-weight: bold;">기안</span>
				</div>
			</div>
			
			
			<c:forEach items="${info }" var="i">
				<div class="s_div">
					<div>
						<span>${i.dept_name }</span>
						<span>${i.job_title }</span>
					</div>
					<div>
						<span>${i.emp_name }</span>
						<span class="s_span_fw">대기</span>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	<script>
		/* 이미지등록 */
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	
		singleWidget.onUploadComplete(function(info) {
			$("#fileUrl").val(info.cdnUrl);
			console.log("파일URL : " + $("#fileUrl").val(info.cdnUrl));
			console.log(JSON.stringify($("#fileUrl").val(info.cdnUrl)));
		});
		
		
	</script>
	
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
		
	<script>
	    // 결재선 지정 클릭 시
	    $("#s_appLine_btn").click(function() {
	    	$("#s_modal_content").load("<%=request.getContextPath()%>/organ/selectList");
	    });
   	</script>
		
	<script>
        var deptCnt = 1;
        var arr = [];
        // 결재선에서 '->' 클릭 시
		$("#s_add_appLine").click(function() {
			console.log("추가");
			var empNo = $(".jstree-clicked").text().slice(-8, $(".jstree-clicked").text().length-1);
			var text = $(".jstree-clicked").text();
            console.log("이 값 넣어야함 : " + text);
            var name = $('.jstree-clicked').text().substr(0,3);
            console.log("이름 : " + name);
            var job = $('.jstree-clicked').text().substr(4,2); // 부사장 '부사'로 되어 수정
            var result = $('.jstree-clicked').text().substr(4,2).match("^부사") // 부사로 시작하지 않으면 null 리턴
            if(result != null) {
            	job = $('.jstree-clicked').text().substr(4,3);
            }
            
            console.log("직위 : " + job);
            var deptText = $('.jstree-clicked').parent().parent().parent().text().substr(0,3);
            // 임원 부서가 '임원이'로 되어 수정
            if($('.jstree-clicked').parent().parent().parent().text().substr(0,3).length <= 3) {
         	    deptText = $('.jstree-clicked').parent().parent().parent().text().substr(0,2);
         	}
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
			// 결재선 리스트 추가
             if($('.jstree-clicked').text().length > 3) {
              if($(".s_appLine_tbody_cl tr").length < 3) {
            	  console.log("결재선 추가")
            	  arr.push({"name":name,"deptText":deptText,"job":job,"empNo":empNo})
            	  console.log(arr);
	              fn_arr(arr);
            	  /* $(".s_appLine_tbody_cl").append(
  	               		 '<tr>'
  	               		+ '<td>' + cnt + '</td>'
  	               		+ '<td class="s_td_name">' + name + '</td>'
  	               		+ '<td>' + deptText + '</td>'
  	               		+ '<td class="s_td_job">' + job + '</td>'
  	               		+ '</tr>'
  	               		+ '<input type="hidden" name="emp_no" class="emp_no" value="' + empNo + '">'
  	               	); */
              } else {
              	alert("결재선은 최대 3명까지 추가가 가능합니다.");
              }
             } else if($('.jstree-clicked').text().length <= 3) {
            	// 참조처 리스트 추가
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
        
        // 직책 순으로 정렬하는 함수
		function fn_arr(arr){
        	console.log(arr);
        	var cnt = 1;
        	var aprvList ="";
        	$(".s_appLine_tbody_cl").empty();
        	var jobArr = ['사원','대리','과장','차장','부장','이사','부사장','사장'];
			var numArr = [];
			var nArr = arr.slice();
			
			console.log(nArr);
			
			for(var i = 0; i < nArr.length; i++) { // 부장, 차장, 대리 순이라면
				numArr.push(jobArr.indexOf(nArr[i].job)); // 4,3,1이 들어감
				console.log(numArr);
			}
			
			numArr.sort();  // 1,3,4
			for(var i=0; i<numArr.length; i++){
				console.log("i : " + i);
				for(var j=0; j<arr.length; j++){
					console.log("j : " + j);
					if(nArr[j].job==jobArr[numArr[i]]){
						console.log(nArr[j].job)
						console.log(numArr[i])
						aprvList += '<tr>'
  	               				 + '<td>' + cnt + '</td>'
  	               				 + '<td class="s_td_name">' + nArr[j].name + '</td>'
  	               			 	 + '<td>' + nArr[j].deptText + '</td>'
  	               			     + '<td class="s_td_job">' + nArr[j].job + '</td>'
  	               			     + '</tr>'
  	               				 + '<input type="hidden" name="emp_no" class="emp_no" value="' + nArr[j].empNo + '">'
  	               				 cnt++;
  	               				 // 직급이 같을 때 for문 여러번 도는 것 막기
  	               				 nArr.splice(j,1);
  	               				 break;
					}	
				}
			}
			$(".s_appLine_tbody_cl").append(aprvList);
        }
        
        function fn_remove(arr) {
        	arr.splice(0); // arr 모두 삭제
        	$(".s_appLine_tbody_cl").children().remove(); // 테이블에 생성된 자식들 모두 삭제
        	console.log(arr);
        }
		
        // 결재선 쪽 <- 눌렀을 때
		$("#s_remove_appLine").click(function() {
			console.log("삭제");
			fn_remove(arr);
			// $(".s_appLine_tbody_cl").children().last().remove();
			// if(cnt == 1) {
			// 	return;
			// }
			// cnt--;
		});
		
		// 참조처 쪽 <- 눌렀을 때
		$("#s_remove_appDept").click(function() {
			$(".s_appDept_tbody_cl").children().last().remove();
			if(deptCnt == 1) {
				return;
			}
			deptCnt--;
		});
		
		// 모달에서 확인 클릭 시 
		$("#s_add_appLine_list").click(function() {
			
			console.log("확인");
			
			
			var empNoArr = [];
			for(var i = 0; i < $(".emp_no").length; i++) {
				empNoArr.push($(".emp_no").eq(i).val());
			}
			console.log(empNoArr);
			
		var obj = {"emp_no" : empNoArr};

			// 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 띄우기(ajax)
			$.ajax({
				url : "<%=request.getContextPath()%>/organ/applinelist"
				, type: "post"
				, data: obj
				, success: function(result) {
					console.log("결재선리스트 result : " + result);
					$(".btn-close").trigger('click');
					$("#s_eap_content_box").html(result);
				}
			});
			
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
			
			// ajax에 보낼 obj
			var dataObj = {
					"eap_first_ap" : str1,
					"eap_mid_ap" : str2,
					"eap_final_ap" : str3,
					"eap_first_dept" : deptStr1,
					"eap_final_dept" : deptStr2
			}
			
			$.ajax({
				url : "<%=request.getContextPath()%>/eap/insertapp"
					, type: "post"
					, data: dataObj
					, success: function(result) {
						console.log("인서트 성공 result : " + result);
						alert(result);
						// $(".btn-close").trigger('click');
						// $("#s_eap_content_box").html(result);
					}
			});
			
			
		});
		
		 
	</script>
	
	<script>
	
		$("#s_eap_app").click(function() {
			console.log("결재요청 클릭");
			var eap_title = $('#s_ho_tt').val();
			var eap_content = $('#s_ho_co').val();
			var ho_code = $('input[type=radio]:checked').val();
			var ho_start = $('#s_ho_start').val() + " " + $('#s_start_time').val();
			var ho_end = $('#s_ho_end').val() + " " + $('#s_end_time').val();
			var ho_use_count = $('#s_date_cal').text();
			
			console.log(eap_title);
			console.log(eap_content);
			console.log(ho_code);
			console.log(ho_start);
			console.log(ho_end);
			console.log(ho_use_count);
		
			// ajax에 보낼 obj
			var dataObj = {
				"df_no" : $("#s_dfNo").text(),
				"eap_title" : eap_title,
				"eap_content" : eap_content,
				"ho_code" : ho_code,
				"ho_start" : ho_start,
				"ho_end" : ho_end,
				"ho_use_count" : ho_use_count
			}
		
			console.log(dataObj);
			
			$.ajax({
				url: "<%=request.getContextPath()%>/eap/inserteap"
				, type: "post"
				, data: dataObj
				, success: function(result) {
					console.log("문서기안 DB등록 성공");
					alert(result);
					$("#menu_eap").get(0).click();
				}
			})
		});
	</script>
		
	<script>
	
	/* 이미지등록 */
	var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');

	singleWidget.onUploadComplete(function(info) {
		$("#fileUrl").val(info.cdnUrl);
	});
	
	// 파일 첨부 버튼 2개 생겨서 한 개 없앰..
	/* if($('.uploadcare--widget.uploadcare--widget_status_ready').length > 2) {
    	$(".uploadcare--widget uploadcare--widget_status_ready").css('display','none');
	} */
	$(document).ready(function() {
		if($('.uploadcare--widget.uploadcare--widget_status_ready').length > 1) {
			console.log("들어왔니?  ?? ? ? ?? ");
			for(var i = 1; i < $('.uploadcare--widget.uploadcare--widget_status_ready').length; i++) {
				document.getElementsByClassName('uploadcare--widget_status_ready')[i].style.display = 'none';
			}
		}
	});
	
	</script>
	
	<script>
		// 제목 입력 시
		$('#s_ho_tt').keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('#s_ho_tt').val("");
			}
		});
		
		// 내용 입력 시
		$('#s_ho_co').keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('#s_ho_co').val("");
			}
		});
		
		$('#s_end_time').change(function() {
			// 날짜 계산
			var start = new Date($('#s_ho_start').val() + 'T' + $('#s_start_time').val());
			var end = new Date($('#s_ho_end').val() + 'T' + $('#s_end_time').val());
			// 일수 구하기
			var diffDay = (end.getTime() - start.getTime()) / (1000*60*60*24);
			// 시간 구하기(휴식시간 1시간 제외)
			var diffTime = (end.getTime() - start.getTime()) / (1000*60*60) -1;
			console.log(typeof(diffTime));
			
			if((0 < diffDay && diffDay < 1) && (0 < diffTime && diffTime < 8)) {
				console.log("날짜 계산 if문탔을까?");
				$('#s_date_cal').text('0.5'); // 반차
			} else if(diffTime >= 1 && diffTime >= 8) {
				console.log("날짜 계산 else if문탔을까?");
				
				// 평일 계산할 cnt 선언
				let cnt = 0;
				while(true) {
					let tmpDate = start;
					// 시작시간이 끝나는시간보다 크면
					if(tmpDate.getTime() > end.getTime()) {
						console.log("cnt : " + cnt);
						break;
					} else { // 아니면
						let tmp = tmpDate.getDay();
						// 주말일 때 
						if(tmp == 0 || tmp == 6) {
							console.log("주말이다");
						} else { // 평일일 때
							console.log("평일이다");
							// 평일 cnt 올려주기
							cnt++;
						}
						tmpDate.setDate(start.getDate() + 1);
					}
				}
				
				// 날짜 계산
				let diff = Math.abs(end.getTime() - start.getTime());
				diff = Math.ceil(diff / (1000 * 3600 * 24));
				
				console.log("diff : " + diff);
				console.log("diff 타입 : " + typeof(diff));
				
				// cnt string으로 변환하여 일수 나타내기
				var cntStr = String(cnt);
				$('#s_date_cal').text(cntStr);
				
				
				/* 
				console.log(diffDay);
				var diffDayStr = String(diffDay);
				console.log(typeof(diffDayStr));
				console.log(diffDayStr);
				if(diffDayStr >= '0.375' && diffDayStr < '1') {
					$('#s_date_cal').text('1');
				} else {
					if(diffDayStr.indexOf('.') == 1) { // 시간 소수점이 있으면
						// 소수점 기준 앞자리만 뽑아서 넣기
						var checkDay = diffDayStr.substring(0, diffDayStr.indexOf('.'));
						$('#s_date_cal').text(checkDay); // 연차 일수
					} else { // 없으면
						$('#s_date_cal').text(diffDayStr); // 그 숫자 그대로 넣기
					}
				} */
			} else {
				console.log("날짜 계산 else문탔을까?");
				$('#s_date_cal').text('0');
			}
		}) 
		
		
		
	</script>
	
	<script>
    	// datepicker위젯
		$(function() {
			$("#s_ho_start, #s_ho_end").datepicker({
				timepicker: true,
				changeMonth: true,
                changeYear: true,
                controlType: 'select',
                timeFormat: 'HH:mm',
                dateFormat: 'yy-mm-dd',
                yearRange: '1930:2024',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                //minDate: new Date(2018, 5 - 1, 14),
                //maxDate: new Date(2018, 8 - 1, 24)
                // minDate: new Date(2020, 4 - 1, 1),
                // maxDate: new Date(2023, 8 - 1, 31),
                beforeShowDay: disableAllTheseDays2
			});
			
			//초기값을 오늘 날짜로 설정해줘야 합니다.
		    // $('#s_ho_start').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		    // $('#s_ho_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		});
		
	   function disableAllTheseDays2(date) {
            var day = date.getDay();
            return [(day != 0 && day != 6)];
			// 0=일, 1=월, 2=화, 4=목, 6=토 => 안나오게 할 것 
        }
    </script>
	

</body>
</html>