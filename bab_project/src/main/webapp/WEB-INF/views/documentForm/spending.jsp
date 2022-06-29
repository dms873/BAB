<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 업로드케어 CDN -->
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
    <script>UPLOADCARE_LOCALE = "ko"</script>
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
			<div
				style="text-align: center; font-size: 2em; font-weight: bold; padding: 20px;">지출결의서</div>

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

			<div style="float: left; width: 130px; margin-right: 10px;">
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
				<div style="float: left; width: 130px; margin-right: 5px;">
					<table border="1" class="s_eap_draft_app">
						<tr>
							<th rowspan="3">승인</th>
							<td>${i.job_title }</td>
						</tr>
						<tr>
							<td>${i.emp_name }</td>
						</tr>
						<tr>
							<td><c:if test="${empty i.df_no }">
									<img
										src="https://media.discordapp.net/attachments/692994434526085184/988792844099678208/stamp_6.png"
										style="width: 50px;">
								</c:if></td>
						</tr>
					</table>
				</div>
			</c:forEach>

			<div id="s_eap_final">
				<div>

					<div style="padding: 50px 10px 20px; clear: both;">
						<div
							style="display: inline-block; font-size: 1.2em; font-weight: bold;">제목
							:</div>
						<input type="text" class="form-control"
							style="display: inline-block; width: 583px; margin-left: 5px;"
							id="s_sp_tt">
					</div>

					<div style="border: 1px solid lightgray; margin: 10px;"></div>
					<div style="margin: 0 10px;">

						<div style="padding: 10px 0;">
							<div class="s_frm_title">1. 지출 내용</div>
							<textarea class="form-control" style="resize: none;" id="s_sp_co"></textarea>
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
										<th scope="row">
											<input type="date" class="form-control s_sp_date" id="s_sp_date" name="sp_date">
										</th>
										<td><input type="text" class="form-control s_sp_detail" name="sp_detail"></td>
										<td><input type="number" id="sp_count" class="form-control s_sp_count" name="sp_count" onblur="total()"></td>
										<td><input type="text" class="form-control s_sp_amount" id="sp_amount" name="sp_amount" onkeyup="commas(this)" onblur="total()"></td>
										<td><select class="form-select s_select" aria-label="Default select example">
												<option value="C">신용카드</option>
												<option value="A">가상계좌</option>
											</select>
										</td>
									</tr>

								</tbody>
								<tfoot>
									<tr>
										<th colspan="3">합계</th>
										<td colspan="2">\ <span id="s_total_price"></span> (VAT포함)
										</td>
									</tr>
								</tfoot>
							</table>
							<!-- <button id="s_add_sp_detail" class="btn btn-success" onclick="addTr()">내역 추가</button> -->
						</div>

						<div style="padding: 10px 0;">
							<div class="s_frm_title">3. 기타</div>
							<div>문의사항은 BAB ${eap.emp_name }(${eap.emp_phone })에게 연락바랍니다. 끝.</div>
						</div>

						<div style="padding: 10px 0;">
							<div class="s_frm_title">파일첨부</div>
							<!-- <input type="file" class="form-control"> -->
							<div id="s_file_upload">
								<input type="hidden" role="uploadcare-uploader"
									data-public-key="991bc66817ca4103d3ee" data-tabs="file url" />
							</div>
							<input type="hidden" name="fileUrl" id="fileUrl">
						</div>
					</div>

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
    	function addTr() {
    		// console.log("클릭되냐고~");
    		$(".s_default_tbody_cl").append(
					'<tr>'
				      + '<th scope="row"><input type="date" class="form-control s_sp_date" id="s_sp_date" name="sp_date"></th>'
				      + '<td><input type="text" class="form-control s_sp_detail" name="sp_detail"></td>'
				      + '<td><input type="number" id="sp_count" class="form-control s_sp_count" name="sp_count" onblur="total()"></td>'
				      + '<td><input type="text" class="form-control s_sp_amount" id="sp_amount" name="sp_amount" onkeyup="commas(this)" onblur="total()"></td>'
				      + '<td>'
				      + '<select class="form-select s_select" aria-label="Default select example">'
				      		+ '<option value="C">신용카드</option>'
				      		+ '<option value="A">가상계좌</option>'
			      	  + '</select>'
				      + '</td>'
				    + '</tr>'	
				);
    	}
	</script>
	
	<script>
		// 합계 구하기
		function total() {
			var spCnt = 0;
			var spAmount = 0;
			var total = 0;
			var sum = 0;
			// const number;
			for(var i = 0; i < $('.s_sp_count').length; i++) {
				spCnt = $(".s_sp_count").eq(i).val();
				console.log(spCnt);
				spAmount = $(".s_sp_amount").eq(i).val();
				console.log(spAmount);
				
				spAmount = spAmount.replace(/,/g, "");
				total = Number(spCnt * spAmount);
				console.log(total);
				
				sum += total;
			}
			
			console.log(sum);
			
			// const number = sp_amount.replace(/,/g, "");
			
			// $("#s_total_price").text(Number(sp_count * number));
			$("#s_total_price").text(sum);
			
			var total1 = $("#s_total_price").text();
			var total2 = total1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#s_total_price').text(total2);
		};
		
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
				url : "<%=request.getContextPath()%>/organ/applinelistsp"
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
				url : "<%=request.getContextPath()%>/eap/insertappsp"
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
			var sp_date = "";
			var sp_detail = "";
			var sp_count = 0;
			var sp_amount = 0;
			var sp_pay_code = "";
			var df_no = "";
			var dataArr = [];
			/* if($('.s_sp_count').length != 1) {
				for(var i = 1; i < $('.s_sp_amount').length; i++) {
					sp_date = $('.s_sp_date').eq(i).val();
					console.log(sp_date);
					sp_detail = $('.s_sp_detail').eq(i).val();
					console.log(sp_detail);
					sp_count = $('.s_sp_count').eq(i).val();
					console.log(sp_count);
					sp_amount = $('.s_sp_amount').eq(i).val();
					console.log(sp_amount);
					sp_pay_code = $('.s_select').eq(i).val();
					console.log(sp_pay_code);
					// var obj = {"sp_date":sp_date, "sp_detail":sp_detail, "sp_count":sp_count, "sp_amount":sp_amount, "sp_pay_code":sp_pay_code}
					var arr = [];
					arr.push(sp_date, sp_detail, sp_count, sp_amount, sp_pay_code)
					dataArr.push(arr);
					// dataArr.push(sp_date, sp_detail, sp_count, sp_amount, sp_pay_code);
					var obj = {"sp_date":dataArr[0][0], "sp_detail":dataArr[0][1]}
					console.log(obj);
				}
				console.log(dataArr);
				// 배열 벗기기
				// dataArr.flat();
			} else {
				sp_date = $('.s_sp_date').val();
				console.log(sp_date);
				sp_detail = $('.s_sp_detail').val();
				console.log(sp_detail);
				sp_count = $('.s_sp_count').val();
				console.log(sp_count);
				sp_amount = $('.s_sp_amount').val();
				console.log(sp_amount);
				sp_pay_code = $('.s_select').val();
				console.log(sp_pay_code);
				dataArr.push(sp_date, sp_detail, sp_count, sp_amount, sp_pay_code);
				console.log(dataArr);
			} */
			
			dataObj = {
					"sp_date" : $('.s_sp_date').val(),
					"sp_detail" : $('.s_sp_detail').val(),
					"sp_count" : $('.s_sp_count').val(),
					"sp_amount" : $('.s_sp_amount').val(),
					"sp_pay_code" : $('.s_select').val(),
					"df_no" : $('#s_dfNo').text(),
					"eap_title" : $('#s_sp_tt').val(),
					"eap_content" : $('#s_sp_co').val(),
			}
			
			
			// 결재요청 클릭 시 DB다녀올 ajax
			$.ajax({
				url : "<%=request.getContextPath()%>/eap/insertsp"
				, type : "post"
				, data : dataObj
				, success : function(result) {
					console.log("성공");
					alert(result);
					$("#menu_eap").get(0).click();
				}
			});
		});
		
		
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
	<script>
		// 제목 입력 시
		$('#s_sp_tt').keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('#s_sp_tt').val("");
			}
		});
		
		// 내용 입력 시
		$('#s_sp_co').keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('#s_sp_co').val("");
			}
		});
		
		// 지출내역 입력 시
		$(".s_sp_detail").keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('.s_sp_detail').val("");
			}
		})
		
		// 수량 입력 시
		$(".s_sp_count").keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('.s_sp_count').val("");
			}
		})
		
		// 금액 입력 시
		$(".s_sp_amount").keyup(function() {
			// 결재선 지정이 안되어 있다면
			if($('div').hasClass('s_div') == false) {
				alert('결재선 지정을 먼저 해주세요');
				// 입력한 내용 지우기
				$('.s_sp_amount').val("");
			}
		})
	</script>

</body>
</html>