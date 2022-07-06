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
		<div id="j_cald_men2">수정버튼 클릭 시 입력하신 내용이 수정되며, 삭제버튼 클릭 시 해당 일정이 삭제됩니다.</div>
		<form action="<%=request.getContextPath()%>/calendar/update" method="post"> 
			<table id="j_cald_table">
				<tbody id="j_cald_tbody">
					<tr>
						<td class="j_cald_title">일정명<a class="j_cald_sym">*</a>
						</td>
						<td class="j_cald_content" colspan="3">
							<input type="text" name="cal_title" class="j_cald_input">
						</td>
					</tr>
					<tr>
						<td class="j_cald_title">일시<a class="j_cald_sym">*</a>
						</td>
						<td class="j_cald_content">
							<input type="datetime-local" name="cal_start"class="j_cald_date">
						</td>
						<td class="j_cald_content"><a>~</a></td>
						<td class="j_cald_content">
							<input type="datetime-local" name="cal_end" class="j_cald_date">
						</td>
					</tr>
					<tr>
						<td class="j_cald_title1">내용</td>
						<td class="j_cald_content1" colspan="3">
							<textarea name="cal_content" class="j_cald_input" id="j_cald_input1"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="j_cald_content"></td>
						<c:if test="${login != null}">
						<input type="hidden" id="emp_no" name="emp_no" value="${login.emp_no}" >
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
	</section>
	<script>
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
    	
    	//데이터 전송 ajax
    	if($("#cal_start").val() < $("#cal_end").val()){
            var param = {
            	"cal_title": $("#cal_title").val(),
                "cal_start": $("#cal_start").val(),
                "cal_end": $("#cal_end").val(),
                "cal_content": $("#cal_content").val(),
                "emp_no":$("#emp_no").val()
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
    </script>
</body>
</html>