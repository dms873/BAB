<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>투표_상세보기</title> -->
<!-- read.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/poll/read.css">
</head>
<body>
	<section>
		<article style="float: left;">
			<div
				style="width: 150px; height: 1000px; margin-top: 25px; margin-left: 10px;">
				<button class="j_polld_side" id="j_polld_list">투표리스트&nbsp;&#128203;</button>
			</div>
		</article>
		<article style="float: left;">
			<div id="j_polld_frame">
				<div class="j_polld_menu">투표하기&nbsp;&#9998;</div>
				<hr class="j_polld_line">
				<div>
					<form>
						<table class="j_polld_table">
						<c:if test="${poll !=null}">
							<tr class="j_polld_thead">
								<td class="j_polld_title">투표제목</td>
								<td class="j_polld_content">${poll.poll_title}</td>
								<td class="j_polld_title j_polld_yline">기간</td>
								<td class="j_polld_content" id="poll_end">${poll.poll_time}</td>
							</tr>
							<tr class="j_polld_thead">
								<td class="j_polld_title">작성자</td>
								<td class="j_polld_content">${poll.poll_writer}</td>
								<td class="j_polld_title j_polld_yline">작성일</td>
								<td class="j_polld_content">${poll.poll_date}</td>
							</tr>
							<tr class="j_polld_thead">
								<td class="j_polld_title">내용</td>
								<td class="j_polld_content" colspan="3">${poll.poll_content}</td>
							</tr>
						</c:if>
							<tr class="j_polld_thead">
								<td class="j_polld_title">옵션<a class="j_polld_sym">*</a>
								</td>
									<td class="j_polld_content" colspan="3">
										<div>
								<c:forEach items="${optionList}" var="option">
											<input type="radio" name="option_val" value="${option.option_val}"><a
												class="j_polld_radio">${option.option_val}</a>
								</c:forEach>
										</div>
									</td>
							<tr class="j_polld_nline">
								<td class="j_polld_noline" colspan="4">
									<c:if test="${login != null}">
                                        <input type="hidden" id="emp_no" name="emp_no" value="${login.emp_no}">
                                    </c:if>
                                    <c:if test="${poll != null}">
                                        <input type="hidden" id="poll_no" name="poll_no" value="${poll.poll_no}">
                                    </c:if>
								</td>
							</tr>
							<tr class="j_polld_nline">
								<td class="j_polld_pno" colspan="4">
									<button type="button" class="j_polld_btn" id="j_polld_submit">투표하기</button>
								</td>
							</tr>
						</table>
					</form>
					<div class="j_polld_menu">투표결과&nbsp;&#128202;</div>
					<hr class="j_polld_line">
					<table class="j_polld_table">
						<c:forEach items="${resultList}" var="result">
							<tr class="j_polld_thead">
								<td class="j_polld_rtitle">${result.option_val}</td>
								<td class="j_polld_rcontent">
									<div class="progress" style="width: 940px; margin-left: 25px;">
										<div class="progress-bar progress-bar-striped"
											role="progressbar" style="width: ${result.result_count}%" aria-valuenow="25"
											aria-valuemin="0" aria-valuemax="100">${result.result_count}%</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</article>
	</section>
	
	<script>
        //투표 리스트 클릭
        $("#j_polld_list").click(function(){
        	$("#s_content_box").load("<%=request.getContextPath()%>/poll/select");
        });
        
        
        //투표하기 버튼 클릭 시
        $("#j_polld_submit").click(function(){
        //마감된 투표 투표하기 버튼 클릭 시
        var today = new Date();

        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);

        var dateString = year + '/' + month  + '/' + day;

        console.log(dateString);
        
        	
        	//투표여부 확인
        	var str = $("#poll_end").text();
        	var substr = str.substr(11,10);
        	console.log(substr);
        	
        	if(substr>dateString){
        	
        	if($("input:radio[name=option_val]").is(':checked')>0){
                var param = {
                	"poll_no": $("#poll_no").val(),
                    "result_voter": $("#emp_no").val()
                }
                console.log(param);
                $.ajax({
                    url: "<%=request.getContextPath()%>/poll/voteCk",
                    data: param,
                    type: "post",
                    success: function(result) {
                    	console.log(result.check);
                    	//투표한적 없으면 투표결과 데이터 전송
                    	if(result.check == 0) {
                    		//투표결과 데이터 전송 ajax
                                var param = {
                                	"poll_no": $("#poll_no").val(),
                                    "result_val": $("input[name=option_val]:checked").val(),
                                    "result_voter": $("#emp_no").val()
                                }
                                console.log(param);
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/poll/vote",
                                    data: param,
                                    type: "post",
                                    success: function(result) {
                                    	console.log(result.check);
                                    	if(result.check == 0) {
                                            swal({
                                                title: "투표 실패!!",
                                                text: "확인 후 다시 입력 바랍니다.",
                                                icon: "error",
                                                closeOnClickOutside: false,
                                                closeOnEsc: false
                                            })
                                        }else {
                                            swal({
                                                title: "투표 완료!!",
                                                text: "투표 메인 화면으로 이동합니다.",
                                                icon: "success",
                                                closeOnClickOutside: false,
                                                closeOnEsc: false
                                            })
                                            .then((willDelete) => {
                      						  if (willDelete) {
                      							$("#s_content_box").load("<%=request.getContextPath()%>/poll/select");
                      						  }
                      						})
                                        }
                                    }
                                })
                        }else {
                            swal({
                                title: "이미 진행한 투표입니다.",
                                text: "",
                                icon: "error",
                                closeOnClickOutside: false,
                                closeOnEsc: false
                            })
                        }
                    }
                })}else{
                	 swal({
                         title: "옵션을 선택하지 않으셨습니다. ",
                         text: "확인 후 다시 선택 바랍니다.",
                         icon: "error",
                         closeOnClickOutside: false,
                         closeOnEsc: false
                     })
                }}else{
                	swal({
                        title: "투표 기간이 종료되었습니다.",
                        text: "",
                        icon: "error",
                        closeOnClickOutside: false,
                        closeOnEsc: false
                    })
                }   	
        });
    </script>
</body>
</html>