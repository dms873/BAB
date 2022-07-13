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
                <table class="j_poll_table">
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
                    <c:forEach items="${pollList}" var="poll">
                    <tr class="j_poll_tbody">
                        <td id="j_poll_pno">
                            ${poll.poll_no}
                        </td>
                        <td class="j_poll_ptitle j_poll_click">
                            ${poll.poll_title}
                        </td>
                        <td class="j_poll_ptime">
                            ${poll.poll_time}
                        </td>
                        <td class="j_poll_pstate">
                            진행중
                        </td>
                        <td class="j_poll_pwriter">
                            ${poll.poll_writer}
                        </td>
                        <td class="j_poll_pdate">
                            ${poll.poll_date}
                        </td>
                    </tr>
                    </c:forEach>
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
                                    <table class="j_poll_table">
                                        <tr>
                                            <td class="j_poll_title">투표제목<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content" colspan="3"><input type="text" id="poll_title"
                                                name="poll_title" class="j_poll_input"></td>
                                        </tr>
                                        <tr>
                                            <td class="j_poll_title">기간<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content"><input type="datetime-local" id="poll_start"
                                                name="poll_start" class="j_poll_date"></td>
                                            <td class="j_poll_content"><a>~</a></td>
                                            <td class="j_poll_content"><input type="datetime-local" id="poll_end"
                                                name="poll_end" class="j_poll_date"></td>
                                        </tr>
                                        <tr>
                                            <td class="j_poll_title1">내용</td>
                                            <td class="j_poll_content1" colspan="3"><textarea id="poll_content"
                                                name="poll_content" class="j_poll_input j_poll_input1"></textarea></td>
                                        </tr>
                                    </table>
                                </form>
                                <form>
                                    <table class="j_poll_table1">
                                        <tr class="j_poll_addinput">
                                            <td class="j_poll_title">옵션<a class="j_poll_sym">*</a>
                                            </td>
                                            <td class="j_poll_content j_poll_addanw" colspan="3">
                                                <input type="text" name="option_val" class="j_poll_option"><input type="button" class="j_poll_add j_poll_btn" value="추가"><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="j_poll_content">
                                                <c:if test="${login != null}">
                                                    <input type="hidden" id="emp_no" name="emp_no" value="${login.emp_no}">
                                                    <input type="hidden" id="emp_name" name="emp_name" value="${login.emp_name}">
                                                </c:if>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="j_poll_table">
                                    <button type="button" id="j_poll_submit">저장</button>
                                </div>
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
                    '<input type="text" name="option_val" class="j_poll_option"> <input type="button" class="j_poll_remove j_poll_btn" value="삭제"><br>'                    
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
        
        //검색버튼 클릭 시
        $("#j_poll_search").click(function(){
        	var param = {
                	"option": $("#select_search option:selected").val(),
                    "text": $("#search_bar").val()
                }
                console.log(param);
                $.ajax({
                    url: "<%=request.getContextPath()%>/poll/select",
                    data: param,
                    type: "get",
                    success: function(result) {
      					$("#s_content_box").html(result);
      				}
      			})
        });
        
        //저장버튼 클릭 시
        $("#j_poll_submit").click(function(){
        	
        	//투표제목 공란 체크
        	if($("#poll_title").val()==""){
				swal({
                    title: "투표제목은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#poll_title").focus();
                return false;
			}
        	
        	//시작일 공란 체크
        	if($("#poll_start").val()==""){
				swal({
                    title: "시작일은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#poll_start").focus();
                return false;
			}
        	
        	//종료일 공란 체크
        	if($("#poll_end").val()==""){
				swal({
                    title: "종료일은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $("#poll_end").focus();
                return false;
			}
        	
        	//옵션 공란 체크
        	if($(".j_poll_option").val()==""){
				swal({
                    title: "옵션은 필수 입력 사항입니다.",
                    text: "확인 후 입력 바랍니다.",
                    icon: "error",
                    closeOnClickOutside: false,
                    closeOnEsc: false
                })
                $(".j_poll_option").focus();
                return false;
			}
        	
        	//투표 데이터 전송 ajax
        	if($("#poll_start").val() < $("#poll_end").val()){
                var param = {
                	"poll_title": $("#poll_title").val(),
                    "poll_start": $("#poll_start").val(),
                    "poll_end": $("#poll_end").val(),
                    "poll_content": $("#poll_content").val(),
                    "poll_writer":$("#emp_name").val(),
                    "emp_no":$("#emp_no").val()
                }
                console.log(param);
                $.ajax({
                    url: "<%=request.getContextPath()%>/poll/insertPoll",
                    data: param,
                    type: "post",
                    success: function(result) {
                    	console.log(result.check);
                    	if(result.check == 0) {
                            swal({
                                title: "투표등록 실패!!",
                                text: "확인 후 다시 입력 바랍니다.",
                                icon: "error",
                                closeOnClickOutside: false,
                                closeOnEsc: false
                            })
                        }else {
                            swal({
                                title: "투표등록 완료!!",
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
        	
        	//옵션 데이터 전송 ajax
        	if($(".j_poll_option").val()!=""){
        		
        		//옵션 데이터 배열로 보내기
        		var optionList = $("input[name=option_val]").length;
        		var optionArr = new Array(optionList);
        		for(var i=0; i<optionList; i++){                          
        		optionArr[i] = $("input[name=option_val]").eq(i).val();
        	        console.log(optionArr[i]);
        		}
        		
                var param = {
                	"option_val":optionArr,
                    "emp_no":$("#emp_no").val()
                }
                console.log(param);
                $.ajax({
                    url: "<%=request.getContextPath()%>/poll/insertOption",
                    data: param,
                    type: "post",
                    success: function(result) {
                    	console.log(result.check);
                    	if(result.check == 0) {
                            swal({
                                title: "투표등록 실패!!",
                                text: "확인 후 다시 입력 바랍니다.",
                                icon: "error",
                                closeOnClickOutside: false,
                                closeOnEsc: false
                            })
                        }else {
                            swal({
                                title: "투표등록 완료!!",
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
                         title: "옵션은 필수 입력 사항입니다. ",
                         text: "확인 후 입력 바랍니다.",
                         icon: "error",
                         closeOnClickOutside: false,
                         closeOnEsc: false
                     })
                };
        });
    </script>
</body>
</html>