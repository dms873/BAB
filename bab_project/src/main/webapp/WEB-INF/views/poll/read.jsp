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
				<button class="j_polld_side" id="j_polld_list">투표
					리스트&nbsp;&#128203;</button>
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
								<td class="j_polld_content">${poll.poll_time}</td>
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
								<%-- <c:forEach items="${pollList}" var="poll"> --%>
									<td class="j_polld_content" colspan="3">
										<div>
											<input type="radio" name="option_val" value=""><a
												class="j_polld_radio">파인애플</a> <input type="radio"
												name="option_val" value=""><a class="j_polld_radio">파인애플파인애플</a>
										</div>
									</td>
								<%-- </c:forEach> --%>
							<tr class="j_polld_nline">
								<td class="j_polld_noline" colspan="4"></td>
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
						<%-- <c:forEach items="${pollList}" var="poll"> --%>
							<tr class="j_polld_thead">
								<td class="j_polld_rtitle">파인애플</td>
								<td class="j_polld_rcontent">
									<div class="progress" style="width: 940px; margin-left: 25px;">
										<div class="progress-bar progress-bar-striped"
											role="progressbar" style="width: 25%" aria-valuenow="25"
											aria-valuemin="0" aria-valuemax="100">25%</div>
									</div>
								</td>
							</tr>
							<tr class="j_polld_thead">
								<td class="j_polld_rtitle">파인애플</td>
								<td class="j_polld_rcontent">
									<div class="progress" style="width: 940px; margin-left: 25px;">
										<div class="progress-bar progress-bar-striped"
											role="progressbar" style="width: 25%" aria-valuenow="25"
											aria-valuemin="0" aria-valuemax="100">25%</div>
									</div>
								</td>
							</tr>
						<%-- </c:forEach> --%>
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
        
        //저장버튼 클릭 시
        $("#").click(function(){
        	
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
        	if($(".j_polld_option").val()!=""){
        		
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