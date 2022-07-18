<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>캘린더_상세조회(수정,삭제)</title> -->
<!-- update.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/calendar/update.css">
</head>
<body>
	<section id="j_cald_section">
		<div id="j_cald_menu">캘린더_일정상세</div>
		<hr id="j_cald_line">
		<div id="j_cald_men1">일정수정 및 삭제&#10071;</div>
		<div id="j_cald_men2">수정버튼 클릭 시 입력하신 내용이 수정되며, 삭제버튼 클릭 시 해당 일정이
			삭제됩니다.</div>
		<c:if test="${cal != null}">
			<form action="<%=request.getContextPath()%>/calendar/update"
				method="post">
				<table id="j_cald_table">
					<tbody id="j_cald_tbody">
						<tr>
							<td class="j_cald_title">일정명<a class="j_cald_sym">*</a>
							</td>
							<td class="j_cald_content" colspan="3"><input type="text"
								id="cal_title" name="cal_title" class="j_cald_input"
								value="${cal.cal_title}"></td>
						</tr>
						<tr>
							<td class="j_cald_title">작성자</td>
							<td class="j_cald_content" colspan="3"><input type="text"
								name="cal_title" class="j_cald_input"
								value="${cal.emp_name}" readonly="readonly"></td>
						</tr>
						<tr>
							<td class="j_cald_title">일시<a class="j_cald_sym">*</a>
							</td>
							<td class="j_cald_content"><input type="datetime-local"
								id="cal_start" name="cal_start" class="j_cald_date"
								value="${cal.cal_start}"></td>
							<td class="j_cald_content"><a>~</a></td>
							<td class="j_cald_content"><input type="datetime-local"
								id="cal_end" name="cal_end" class="j_cald_date"
								value="${cal.cal_end}"></td>
						</tr>
						<tr>
							<td class="j_cald_title1">내용</td>
							<td class="j_cald_content1" colspan="3"><textarea
									name="cal_content" id="cal_content"
									class="j_cald_input j_cald_input1">${cal.cal_content}</textarea>
							</td>
						</tr>
						<tr>
							<td class="j_cald_title">색상<a class="j_cald_sym">*</a>
							</td>
							<td class="j_cald_content" colspan="3">
								<div class="j_cald_color">
									<input type="color" id="cal_color" name="cal_color" value="${cal.cal_color}">
									&nbsp;&#128072;클릭하여 색상을 선택해주세요.
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="j_cald_content"><input type="hidden"
								id="cEmp_no" name="emp_no" value="${cal.emp_no}"> <input
								type="hidden" id="cal_no" name="cal_no" value="${cal.cal_no}">
							</td>
							<c:if test="${login != null}">
								<input type="hidden" id="lEmp_no" name="emp_no"
									value="${login.emp_no}">
							</c:if>


						</tr>
						<tr>
							<td colspan="4" class="j_cald_content">
								<button type="button" class="j_cald_submit" id="j_cald_update">수정</button>
								<button type="button" class="j_cald_submit" id="j_cald_delete">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</c:if>
	</section>
	<script>
	//삭제버튼 클릭 시
    $("#j_cald_delete").click(function(){
    	if ($("#lEmp_no").val() == $("#cEmp_no").val()){
    		swal({
                title: "해당 일정을 삭제하시겠습니까?",
                text: "",
                icon: "info",
                buttons: true,
                closeOnClickOutside: false,
                closeOnEsc: false
            }) .then((willDelete) => {
				  if (willDelete) {
					  var calNo = $("#cal_no").val()
					  console.log(calNo);
					  $.ajax({
						  url: "<%=request.getContextPath()%>/calendar/delete?cal_no="+calNo,
			                data: calNo,
			                type: "post",
			                success: function(result) {
			                	console.log(result.check);
			                	if(result.check == 0) {
			                        swal({
			                            title: "일정삭제 실패!!",
			                            text: "확인 후 다시 입력 바랍니다.",
			                            icon: "error",
			                            closeOnClickOutside: false,
			                            closeOnEsc: false
			                        })
			                    }else {
			                        swal({
			                            title: "일정삭제 완료!!",
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
					  })
				  } else {
				    
				  }
				});
    	}else{
    		swal({
                title: "작성자만 삭제가 가능합니다.",
                text: "확인 후 다시 시도해주세요.",
                icon: "error",
                closeOnClickOutside: false,
                closeOnEsc: false
            })
    	}
    	 
    });
    		 
	//수정버튼 클릭 시
    $("#j_cald_update").click(function() {
    	
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
    	
    	//시작일 종료일 유효성 체크
    	if($("#cal_start").val() > $("#cal_end").val()){
			swal({
                title: "일자선택이 올바르지 않습니다.",
                text: "종료일을 시작일보다 뒷 날짜로 선택 바랍니다.",
                icon: "error",
                closeOnClickOutside: false,
                closeOnEsc: false
            })
            $("#cal_end").focus();
            return false;
		}
    	
    	//데이터 전송 ajax(로그인한계정=글쓴이)
    	if($("#lEmp_no").val() == $("#cEmp_no").val()){
            var param = {
            	"cal_title": $("#cal_title").val(),
                "cal_start": $("#cal_start").val(),
                "cal_end": $("#cal_end").val(),
                "cal_content": $("#cal_content").val(),
                "cal_no":$("#cal_no").val(),
                "cal_color":$("#cal_color").val()
            }
            console.log(param);
            $.ajax({
                url: "<%=request.getContextPath()%>/calendar/update",
                data: param,
                type: "post",
                success: function(result) {
                	console.log(result.check);
                	if(result.check == 0) {
                        swal({
                            title: "일정수정 실패!!",
                            text: "확인 후 다시 입력 바랍니다.",
                            icon: "error",
                            closeOnClickOutside: false,
                            closeOnEsc: false
                        })
                    }else {
                        swal({
                            title: "일정수정 완료!!",
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
                     title: "작성자만 수정이 가능합니다.",
                     text: "확인 후 다시 시도해주세요.",
                     icon: "error",
                     closeOnClickOutside: false,
                     closeOnEsc: false
                 })
            }
    });
    </script>
</body>
</html>