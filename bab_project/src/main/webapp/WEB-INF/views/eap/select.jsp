<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>전자결재</title> -->
	<style>
.s_hover_event {
	cursor: pointer;
}

.modal {
	left: -15% !important;
}

.s_eap_tt {
	font-size: 1.2em;
	font-weight: bold;
	margin-bottom: 15px;
}

.s_eap_home {
	margin-top: 30px;
	margin-bottom: 80px;
	padding: 0 20px;
}

.table-hover {
	cursor: pointer;
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

	<section>
        <article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
                <button id="s_eap_btn" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">새 결재 진행</button>
                <!-- 결재 양식 Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style="width: 1200px;">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">결재 양식 선택</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <select id="s_document_form_select" name="s_document_form_select" class="form-select" aria-label="Default select example">
				        	<option selected="selected">양식을 선택해주세요</option>
				        	<option id="s_holiday_form" value="s_holiday_form">휴가신청서</option>
				        	<option id="s_spending_form" value="s_spending_form">지출결의서</option>
				        </select>
				        <div id="s_document_form" style="margin-top: 20px; border: 1px solid lightgray; border-radius: 5px; padding: 10px;">
				        	양식을 선택해주세요.
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="s_cancel_btn">취소</button>
				        <button type="button" class="btn btn-primary" id="liveAlertBtn">확인</button>
				      </div>
				    </div>
				  </div>
				</div>

                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">결재하기</div>
                <div style="display: inline-block; margin-right: 5px;" id="s_before_doc" class="s_hover_event">결재 대기 문서</div>
                <span style="font-weight: bold; color: red;">
                	<c:if test="${beDocCnt ne 0 }">${beDocCnt }</c:if>
					<c:if test="${beDocCnt eq 0 }"></c:if>
				</span>
                <div style="display: inline-block; margin-right: 5px;" id="s_receipt_doc" class="s_hover_event">결재 수신 문서</div>
                <span style="font-weight: bold; color: red;">
                	<c:if test="${reDocCnt ne 0 }">${reDocCnt }</c:if>
					<c:if test="${reDocCnt eq 0 }"></c:if>
                </span>

                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">문서함</div>
                <div id="s_insert_doc" class="s_hover_event">기안 문서함</div>
                <div id="s_result_doc" class="s_hover_event">결재 문서함</div>
                <div id="s_reference_doc" class="s_hover_event">참조 문서함</div>
            </div>
        </article>  
        <article style="float: left;">
            <div style="border: 1px solid lightgray;height: 1000px;width: 1150px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_eap_content_box">
            	
                <div class="s_eap_home">
	                <div class="s_eap_tt">전자 결재 대기</div>
		                <table class="table table-hover" style="vertical-align: middle; text-align: center;">
						  <thead>
						    <tr>
						      <th scope="col">NO</th>
						      <th scope="col">기안일</th>
						      <th scope="col">결재양식</th>
						      <th scope="col">제목</th>
						      <th scope="col">첨부</th>
						      <th scope="col">결재상태</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>2022/05/26</td>
						      <td>지출결의서</td>
						      <td>신규 직원채용 명함 신청의 건</td>
						      <td><i class="bi bi-paperclip"></i></td>
						      <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
						    </tr>
	                        <tr>
	                          <th scope="row">2</th>
	                          <td>2022/05/26</td>
	                          <td>휴가신청서</td>
	                          <td>개인 연차 신청의 건</td>
	                          <td></td>
	                          <td><button class="btn btn-warning" style="font-size: .8em;">결재대기</button></td>
	                        </tr>
						  </tbody>
						</table>
					</div>
					
					<div class="s_eap_home">
		                <div class="s_eap_tt">기안 진행 문서</div>
		                <table class="table table-hover" style="vertical-align: middle; text-align: center;">
						  <thead>
						    <tr>
						      <th scope="col">NO</th>
						      <th scope="col">기안일</th>
						      <th scope="col">결재양식</th>
						      <th scope="col">제목</th>
						      <th scope="col">첨부</th>
						      <th scope="col">결재상태</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>2022/05/30</td>
						      <td>지출결의서</td>
						      <td>개인 반차 신청의 건</td>
						      <td></td>
						      <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
						    </tr>
	                        <tr>
	                          <th scope="row">2</th>
	                          <td>2022/05/30</td>
	                          <td>휴가신청서</td>
	                          <td>개인 연차 신청의 건</td>
	                          <td></td>
	                          <td><button class="btn btn-warning" style="font-size: .8em;">결재대기</button></td>
	                        </tr>
						  </tbody>
						</table>
					</div>
	            </div>
        </article>    
    </section>
    
    <script>
    	// 결재 대기 문서 클릭 시
        $("#s_before_doc").click(function() {
            $("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/beforedoc");
        });

    	// 결재 수신 문서 클릭 시
        $("#s_receipt_doc").click(function() {
            $("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/receiptdoc");
        });
    	
    	// 기안 문서함 클릭 시
    	$("#s_insert_doc").click(function() {
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectinsertdoc");
    	});
    	
    	// 결재 문서함 클릭 시
    	$("#s_result_doc").click(function() {
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectresultdoc");
    	});
    	
    	// 참조 문서함 클릭 시
    	$("#s_reference_doc").click(function() {
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectreferencedoc");
    	});

        // 서브메뉴 클릭 시 색깔변경
        $(".s_hover_event").click(function() {
            $(".s_hover_event").css('color', 'black');
            $(this).css('color', 'rgb(5, 131, 242)');
        });
        
        
    </script>
    
    <script>
    	// 양식선택
    	$("#s_document_form_select").on('change', function() {
    		console.log(this.value);
    		// value값이 휴가신청서면
    		if(this.value == "s_holiday_form") {
	    		$("#s_document_form").load("<%=request.getContextPath()%>/eap/selectform/holidayForm");
    			$("#s_document_form").html('');
    		} else if(this.value == "s_spending_form") { // 지출결의서면
    			$("#s_document_form").load("<%=request.getContextPath()%>/eap/selectform/spendingForm");
    			$("#s_document_form").html('');
    		} else { // 양식을 선택해주세요면
    			$("#s_document_form").html("<div>양식을 선택해주세요.</div>");		
    		}
    	});
    	
    	// 양식선택 후 확인버튼 클릭 시
        $("#liveAlertBtn").click(function() {
        	
        	
        	// debugger;
        	var form = $("#s_document_form_select").val();
        	if(form == 's_holiday_form') {
        		// 강제로 닫기버튼 클릭하기
        		// debugger;
        		$(".btn-close").trigger('click');
        		// $("#s_eap_content_box").html();
        		<%-- $("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectform/holiday"); --%>
        	} else if(form == 's_spending_form') {
        		// 강제로 닫기버튼 클릭하기
        		$(".btn-close").trigger('click');
        		<%-- $("#s_eap_content_box_left").load("<%=request.getContextPath()%>/eap/selectform/spending"); --%>
        	} else {
        		$("#s_document_form").html('<div class="alert alert-danger d-flex align-items-center" role="alert">'
        				  + '<i class="bi bi-exclamation-triangle-fill"></i>'
        				  + '<div style="margin-left: 5px;">'
        				    + '양식을 선택해주세요.'
        				  + '</div>'
        				+ '</div>')
           	}
        	// 결재 양식 선택에 있는 option의 text를 form변수에 담아줌
        	var form = $("#s_document_form_select option:selected").text();
        	if(form == '양식을 선택해주세요') {
        		console.log("양식 선택");
        	} else {
	        	$.ajax({
	        		url: "<%=request.getContextPath()%>/eap/insertdoc"
	        		// ajax data로 보냄
	        		, data: {"form": form}
	        		, type: "post"
	        		, success: function(result) {
	        			console.log("result : " + result);
	        			// 받아온 결과가 jsp라서 그 자리 html을 result로 넣어줌
	        			$("#s_eap_content_box").html(result);
	        		}
	        	});
        	}
        });
    	
    </script>
</body>
</html>