<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>캘린더_조회</title> -->
<!-- select.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/calendar/select.css">
</head>
<body>
	<section id="j_cal_section">
		<div id="j_cal_menu">캘린더</div>
		<hr id="j_cal_line">
		<div id='j_cal_frame'></div>
		<div id="j_cal_wrap">
			<button type="button" id="j_cal_btn">일정등록</button>
		</div>

		<!-- 모달 Bootstrap -->
		<div class="modal fade" id="j_myModal" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">일정등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="<%=request.getContextPath()%>/calendar/insert"
							method="post">
							<table id="j_cal_table">
								<tr>
									<td class="j_cal_title">일정명<a class="j_cal_sym">*</a>
									</td>
									<td class="j_cal_content" colspan="3"><input type="text" id="cal_title"
										name="cal_title" class="j_cal_input"></td>
								</tr>
								<tr>
									<td class="j_cal_title">일시<a class="j_cal_sym">*</a>
									</td>
									<td class="j_cal_content"><input type="datetime-local" id="cal_start"
										name="cal_start" class="j_cal_date"></td>
									<td class="j_cal_content"><a>~</a></td>
									<td class="j_cal_content"><input type="datetime-local" id="cal_end"
										name="cal_end" class="j_cal_date"></td>
								</tr>
								<tr>
									<td class="j_cal_title1">내용</td>
									<td class="j_cal_content1" colspan="3"><textarea id="cal_content"
										name="cal_content" class="j_cal_input j_cal_input1"></textarea></td>
								</tr>
								<tr>
									<td class="j_cal_title">색상<a class="j_cal_sym">*</a>
									</td>
									<td class="j_cal_content" colspan="3">
										<div class="j_cal_color"><input type="color" id="cal_color" name="cal_color">
										&nbsp;&#128072;클릭하여 색상을 선택해주세요.</div>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="j_cal_content">
										<c:if test="${login != null}">
											<input type="hidden" id="emp_no" name="emp_no" value="${login.emp_no}">
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="j_cal_content">
										<button type="button" id="j_cal_submit">저장</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

	</section>
	<script>
		//Fullcalandar API	
		$(function() {
			//배열형태
			var calendarEl = $('#j_cal_frame')[0];
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridDay'
				},
				locale : 'ko',
				initialView : 'dayGridMonth',
				eventDisplay: 'block',
				navLinks: true,
				eventClick: function(data){
					/*휴가, 생일 제외한 일정만 상세조회 가능  */
					var calNo = data.event.id;
					if(calNo!=0){
						console.log(calNo);
						 swal({
	                         title: "일정상세 페이지로 이동하시겠습니까?",
	                         text: "",
	                         icon: "info",
	                         buttons: true,
	                         closeOnClickOutside: false,
	                         closeOnEsc: false
	                     })
	                     .then((willDelete) => {
							  if (willDelete) {
								  $("#s_content_box").load("<%=request.getContextPath()%>/calendar/read?cal_no="+calNo);
							  } else {
							    
							  }
						});
					}else{
						
					}
				},
				events : [
					/*캘린더 조회  */
					<c:forEach items="${calList}" var="cal">
						{	
							id : "${cal.cal_no}",
							title : "${cal.cal_title}",
							start : "${cal.cal_start}",
							end : "${cal.cal_end}",
							color : "${cal.cal_color}",
							textColor : 'black'
						},
					</c:forEach>
					/*캘린더 조회(휴가)  */
					<c:forEach items="${calHoList}" var="calHo">
						{
							title : "${calHo.emp_name}님 휴가",
							start : "${calHo.ho_start}",
							end : "${calHo.ho_end}",
							color : '#ffcb6b',
							textColor : 'black'
						},
					</c:forEach>
					/*캘린더 조회(생일)  */
					<c:forEach items="${calHBDList}" var="calHBD">
						{
							title : "★${calHBD.emp_name}님 생일★",
							start : "${calHBD.hbd_start}",
							end : "${calHBD.hbd_end}",
							color : 'yellowgreen',
							textColor : 'black',
							allDay : 'allDay'
						},
					</c:forEach>
				] 
			});
			calendar.render();
		});
		
		 //submit버튼 클릭 시
        $("#j_cal_submit").click(function() {
        	
        	//일정명 공란 체크
        	if($("#cal_title").val()==""){
				swal({
                    title: "일정명은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#cal_title").focus();
                return false;
			}
        	
        	//시작일 공란 체크
        	if($("#cal_start").val()==""){
				swal({
                    title: "시작일은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#cal_start").focus();
                return false;
			}
        	
        	//종료일 공란 체크
        	if($("#cal_end").val()==""){
				swal({
                    title: "종료일은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#cal_end").focus();
                return false;
			}
        	
        	//색상 공란 체크
        	if($("#cal_color").val()==""){
				swal({
                    title: "색상은 필수 선택 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#cal_color").focus();
                return false;
			}
        	
        	//데이터 전송 ajax
        	if($("#cal_start").val() < $("#cal_end").val()){
                var param = {
                	"cal_title": $("#cal_title").val(),
                    "cal_start": $("#cal_start").val(),
                    "cal_end": $("#cal_end").val(),
                    "cal_content": $("#cal_content").val(),
                    "cal_color": $("#cal_color").val(),
                    "emp_no":$("#emp_no").val()
                }
                console.log(param);
                $.ajax({
                    url: "<%=request.getContextPath()%>/calendar/insert",
                    data: param,
                    type: "post",
                    success: function(result) {
                    	console.log(result.check);
                    	if(result.check == 0) {
                            swal({
                                title: "일정등록 실패!!",
                                text: "확인 후 다시 입력 바랍니다.",
                                icon: "error",
                                closeOnClickOutside: false,
                                closeOnEsc: false
                            })
                        }else {
                            swal({
                                title: "일정등록 완료!!",
                                text: "그룹웨어 메인 화면으로 이동합니다.",
                                icon: "success",
                                closeOnClickOutside: false,
                                closeOnEsc: false
                            })
                            .then((willDelete) => {
      						  if (willDelete) {
      							  location.reload();
      						  }
      						})
                        }
                    }
                })}else{
                	 swal({
                         title: "일자선택이 올바르지 않습니다. ",
                         text: "종료일을 시작일보다 뒷 날짜로 선택 바랍니다.",
                         icon: "error",
                         closeOnClickOutside: false,
                         closeOnEsc: false
                     })
                }
        });
		//모달 Bootstrap
		$("#j_cal_btn").click(function() {
			$("#j_myModal").modal("show");
		});
	</script>
</body>
</html>