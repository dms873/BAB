<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더_상세조회(수정,삭제)</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- datepicker -->
<!-- <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"> -->
<!-- 공통 reset.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- update.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/calendar/update.css">
</head>
<body>
	<section id="j_cald_section">
		<div id="j_cald_menu">캘린더_일정상세</div>
		<hr id="j_cald_line">

		<form>
			<table id="j_cald_table">
				<tbody id="j_cald_tbody">
					<tr>
						<td class="j_cald_title">일정명<a class="j_cald_sym">*</a>
						</td>
						<td class="j_cald_content" colspan="5"><input type="text"
							name="emp_no" class="j_cald_input" required></td>
					</tr>
					<tr>
						<td class="j_cald_title">일시<a class="j_cald_sym">*</a>
						</td>
						<td class="j_cald_content"><input type="text" name="emp_id"
							class="j_cald_date" id="datepicker1" required></td>
						<td class="j_cald_content"><input type="text" name="emp_id"
							class="j_cald_time" placeholder="00:00" required></td>
						<td class="j_cald_content"><a>~</a></td>
						<td class="j_cald_content"><input type="text" name="emp_id"
							class="j_cald_date" id="datepicker2" required></td>
						<td class="j_cald_content"><input type="text" name="emp_id"
							class="j_cald_time" placeholder="00:00" required></td>
					</tr>
					<tr>
						<td class="j_cald_title1">내용</td>
						<td class="j_cald_content1" colspan="5"><textarea name=""
								class="j_cald_input" id="j_cald_input1"></textarea></td>
					</tr>
					<tr>
						<td colspan="6" class="j_cald_content"></td>
					</tr>
					<tr>
						<td colspan="6" class="j_cald_content">
							<button type="submit" id="j_cald_submit">수정</button>
							<button type="submit" id="j_cald_submit">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
	<script>
        // datepicker위젯
        $( function() {
          $( "#datepicker1, #datepicker2").datepicker({
              //날짜형식 바꿈
              dateFormat : "yy/mm/dd"
          });
        } );
    </script>
</body>
</html>