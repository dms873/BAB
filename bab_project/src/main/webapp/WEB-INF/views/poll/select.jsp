<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>투표</title> -->
<!-- select.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/poll/select.css">
</head>
<body>
<section>
        <article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
                <button class="j_poll_side" id="j_poll_list">투표 리스트&#128203;</button>
                <button class="j_poll_side" id="j_poll_make">투표 등록&#9998;</button>
            </div>
        </article>
        <article style="float: left;">
            <div id="j_poll_frame">
            <div id="j_poll_menu">투표</div>
		    <hr id="j_poll_line">
            <!-- 검색기능 -->
            <div class="select_outer" style="display: flex; justify-content: center;">
                <select id="select_search" name="select_search" class="form-select mb-3" style="width: 100px;">
                    <option value="poll_title">제목</option>
                    <option value="poll_writer">작성자</option>
                </select>
                <input type="text" class="form-control" name="search_bar" id="search_bar" style="width: 270px; height: 38px; margin: 0 6px;">
                <button class="btn btn-sm btn-primary" name="btnSearch" id="j_poll_search" style="height: 38px; width: 80px;">검색</button>
            </div>
            <div>
                <table id="j_poll_table">
                    <tr class="j_poll_thead">
                        <td class="j_poll_pno">
                            No
                        </td>
                        <td class="j_poll_ptitle">
                            제목
                        </td>
                        <td class="j_poll_ptime">
                            기간
                        </td>
                        <td class="j_poll_pstate">
                            상태
                        </td>
                        <td class="j_poll_pwriter">
                            작성자
                        </td>
                        <td class="j_poll_pdate">
                            작성일
                        </td>
                    </tr>
                    <!-- 아래 데이터 불러와서 for문 돌리기 -->
                    <tr class="j_poll_tbody">
                        <td id="j_poll_pno">
                            1
                        </td>
                        <td class="j_poll_ptitle j_poll_click">
                            추석 선물은?
                        </td>
                        <td class="j_poll_ptime">
                            2022/05/01~2022/05/12
                        </td>
                        <td class="j_poll_pstate">
                            진행중
                        </td>
                        <td class="j_poll_pwriter">
                            장혜미
                        </td>
                        <td class="j_poll_pdate">
                            2022/07/11
                        </td>
                    </tr>
                </table>
            </div>
                <!-- 모달 Bootstrap -->
                <div class="modal fade" id="j_myModal" data-bs-backdrop="static"
                data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">투표 생성</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <table id="j_poll_table">
                                        <tr>
                                            <td class="j_poll_title">투표제목<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content" colspan="3"><input type="text" id="cal_title"
                                                name="cal_title" class="j_poll_input"></td>
                                        </tr>
                                        <tr>
                                            <td class="j_poll_title">기간<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content"><input type="datetime-local" id="cal_start"
                                                name="cal_start" class="j_poll_date"></td>
                                            <td class="j_poll_content"><a>~</a></td>
                                            <td class="j_poll_content"><input type="datetime-local" id="cal_end"
                                                name="cal_end" class="j_poll_date"></td>
                                        </tr>
                                        <tr>
                                            <td class="j_poll_title1">내용</td>
                                            <td class="j_poll_content1" colspan="3"><textarea id="cal_content"
                                                name="cal_content" class="j_poll_input j_poll_input1"></textarea></td>
                                        </tr>
                                        <tr class="j_poll_addinput">
                                            <td class="j_poll_title">옵션<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content j_poll_addanw" colspan="3">
                                                <input type="text" name="" class="j_poll_option"><input type="button" class="j_poll_add j_poll_btn" value="추가"><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="j_poll_content">
                                                <c:if test="${login != null}">
                                                    <input type="hidden" id="emp_no" name="emp_no" value="${login.emp_no}">
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="j_poll_content">
                                                <button type="button" id="j_poll_submit">저장</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </article>    
    </section>
    <script>
        //모달 Bootstrap
        $("#j_poll_make").click(function(){
            $("#j_myModal").modal("show");
        });

        //옵션 추가
        $(document).ready (function () {                
            $('.j_poll_add').click (function () {                                        
                $('.j_poll_addanw').append (                        
                    '<input type="text" name="" class="j_poll_option"> <input type="button" class="j_poll_remove j_poll_btn" value="삭제"><br>'                    
                );                           
                $('.j_poll_remove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    $(this).next ().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            });                                            
        });
        
        //투표 리스트 클릭
        $("#j_poll_list").click(function(){
        	$("#s_content_box").load("<%=request.getContextPath()%>/poll/select");
        });
    </script>
</body>
</html>