<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더_조회</title>
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
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">일정등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<table id="j_cal_table">
								<tr>
									<td class="j_cal_title">일정명<a class="j_cal_sym">*</a>
									</td>
									<td class="j_cal_content" colspan="5"><input type="text"
										name="emp_no" class="j_cal_input" required></td>
								</tr>
								<tr>
									<td class="j_cal_title">일시<a class="j_cal_sym">*</a>
									</td>
									<td class="j_cal_content"><input type="text" name="emp_id"
										class="j_cal_date" id="datepicker1" required></td>
									<td class="j_cal_content"><input type="text" name="emp_id"
										class="j_cal_time" placeholder="00:00" required></td>
									<td class="j_cal_content"><a>~</a></td>
									<td class="j_cal_content"><input type="text" name="emp_id"
										class="j_cal_date" id="datepicker2" required></td>
									<td class="j_cal_content"><input type="text" name="emp_id"
										class="j_cal_time" placeholder="00:00" required></td>
								</tr>
								<tr>
									<td class="j_cal_title1">내용</td>
									<td class="j_cal_content1" colspan="5"><textarea name=""
											class="j_cal_input" id="j_cal_input1"></textarea></td>
								</tr>
								<tr>
									<td colspan="6" class="j_cal_content"></td>
								</tr>
								<tr>
									<td colspan="6" class="j_cal_content">
										<button type="submit" id="j_cal_submit">저장</button>
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
				initialView : 'dayGridMonth'
			});
			calendar.render();
		});

		//모달 Bootstrap
		$("#j_cal_btn").click(function() {
			$("#j_myModal").modal("show");
		});

		// datepicker위젯
		$(function() {
			$("#datepicker1, #datepicker2").datepicker({
				//날짜형식 바꿈
				dateFormat : "yy/mm/dd"
			});
		});
	</script>
</body>
</html>