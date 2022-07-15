<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>마감된 투표</title> -->
<!-- end.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/poll/end.css">
</head>
<body>
   	<article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
                <button class="j_polle_side" id="j_poll_list">투표 리스트&nbsp;&#128203;</button>
                <button class="j_polle_side" id="j_poll_endList">마감된 투표&nbsp;&#8987;</button>
            </div>
    </article>
	<article style="float: left;">
		<div id="j_polle_frame">
			<div id="j_polle_menu">마감된 투표 &#128221;</div>
			<hr id="j_polle_line">
			<!-- 검색기능 -->
			<div class="select_outer"
				style="display: flex; justify-content: center;">
				<select id="select_search" name="select_search"
					class="form-select mb-3" style="width: 100px;">
					<option value="poll_title">제목</option>
					<option value="poll_writer">작성자</option>
				</select> <input type="text" class="form-control" name="search_bar"
					id="search_bar" style="width: 270px; height: 38px; margin: 0 6px;">
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="j_polle_search" style="height: 38px; width: 80px;">검색</button>
			</div>
			<div>
				<table class="j_polle_table">
					<tr class="j_polle_thead">
						<td class="j_polle_pno">No</td>
						<td class="j_polle_ptitle">제목</td>
						<td class="j_polle_ptime">기간</td>
						<td class="j_polle_pstate">상태</td>
						<td class="j_polle_pwriter">작성자</td>
						<td class="j_polle_pdate">작성일</td>
					</tr>
					<c:forEach items="${endList}" var="poll">
						<c:set var="i" value="${i+1}"/>
						<tr class="j_polle_tbody">
							<td id="j_polle_pno">
							<input type="hidden" name="poll_no" class="poll_pno" value="${poll.poll_no}">
                            <a>${i}</a>
							</td>
							<td class="j_polle_ptitle j_polle_click">${poll.poll_title}
							</td>
							<td class="j_polle_ptime">${poll.poll_time}</td>
							<td class="j_polle_pstate"><a style="color: red; font-weight:bold ">마감</a></td>
							<td class="j_polle_pwriter">${poll.poll_writer}</td>
							<td class="j_polle_pdate">${poll.poll_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</article>
	<script>
	 //상세조회
    $(".j_polle_click").click(function(){
    	var pollNo = $(this).parents("tr").children("td").children(".poll_pno").val();
    	console.log("화면에서 받아가는 번호:"+pollNo)
    	$("#s_content_box").load("<%=request.getContextPath()%>/poll/readPoll?poll_no="+pollNo);
    });
	 
  	//투표 리스트 클릭
    $("#j_poll_list").click(function(){
    	$("#s_content_box").load("<%=request.getContextPath()%>/poll/select");
    });
	 
    //검색버튼 클릭 시
    $("#j_polle_search").click(function(){
    	var param = {
            	"option": $("#select_search option:selected").val(),
                "text": $("#search_bar").val()
            }
            console.log(param);
            $.ajax({
                url: "<%=request.getContextPath()%>/poll/end",
                data: param,
                type: "get",
                success: function(result) {
  					$("#s_content_box").html(result);
  				}
  			})
    });
	</script>
</body>
</html>