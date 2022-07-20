<%@page import="kh.spring.bab.employee.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>공지사항 조회</title> -->
<style>
	#y_td_hover:hover {
		text-decoration: underline;
	}	

	
</style>

</head>
<body>

		<%
		String mainBoard_no = request.getParameter("mainBoard_no");
		
		String dept_code = null;
		Employee vo = (Employee) request.getSession().getAttribute("login");
		
		dept_code = vo.getDept_code();
		%>

<div id="y_board_content" style="border: 1px solid lightgray;height: 1000px;width: 1300px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" >

	<div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">공지사항</h1>
		</div>
		
		<hr>
		
		<div class="pannel-heading">전체 ${totalCnt}건의 게시물이 있습니다.</div>
	</div>
	
	<input type="hidden" id="y_main_bNo" value = "<%= mainBoard_no %>">
	<input type="hidden" id="y_emp_dCode" value = "<%= dept_code %>">
	
	<div style="margin: 20px 0;">
	<!-- search{s} -->
		<div class="select_outer" style="display: flex; justify-content: center;">
			<select id="select_search" name="select_search" class="form-select mb-3" style="width: 100px;">
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer">작성자</option>
			</select> <input type="text" class="form-control" name="search_bar" id="search_bar" style="width: 270px; height: 38px; margin: 0 6px;">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="y_btn_search" style="height: 38px;">검색</button>
		</div>
	</div>
	<!-- search{e} -->

	
	<form id="y_board_delete" action="<%= request.getContextPath()%>/board/delete" method="POST">
	<div class="container y_outer_div" style="display: flex; justify-content: center;">
		<table class="table table-striped table-hover" style="text-align: center;">
			<tr>
				<td><input type="checkbox" id="allCheck" name="allCheck"></td>
				<td>No</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		<c:forEach items="${selectBoard}" var="i">
			<tr>
				<td><input type="checkbox" id="rowCheck" name="rowCheck" value="${i.board_no }"></td>
				<td class="y_td_no">${i.board_no }</td>
				<td id="y_td_hover"><a href="javascript:void(0)" id="y_board_view" class="y_board_view">${i.board_title }</a></td>
				<td>${i.board_writer }</td>
				<td>${i.board_date }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	</form>
	
	<div style="margin: 0 15px;">
		<button type="button" class="btn btn-primary" id="y_btn_insert">글쓰기</button>
		<button type="button" class="btn btn-secondary" id="y_btn_delete">삭제</button>
	</div>

		<nav aria-label="Page navigation example" style="display: flex; justify-content: center; margin-top: 50px;">
			<ul class="pagination">
				<c:if test="${startPage > 1 }">
				<li class="page-item pre"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<c:if test="${currentPage eq i }">
						<li class="page-item num active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
					<c:if test="${currentPage ne i }">
						<li class="page-item num"><a class="page-link" href="#">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
				<li class="page-item next"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
			</ul>
		</nav>
		
	<script>
	
	// 페이징 처리
	
	$(".page-item.num .page-link").click(function(event) {
		console.log(event.target.innerText);
		
		var pageNum = event.target.innerText;
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?page="+pageNum);
	})
	
	$(".page-item.pre .page-link").click(function(event){
		//이전 페이지 최소값 -1 -> 이전 페이지로 이동
		const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?page="+num);
	
	})
	
	$(".page-item.next .page-link").click(function(event){
		//다음 페이지 최대값 +1 -> 다음 페이지로 이동
		const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
		<%-- $("#s_content_box").load("<%=request.getContextPath()%>/board/select?page=${currentPage+1}"); --%>
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?page="+num);
	})
	
	
	// 체크박스 전체 선택/해제
	// 메인페이지 board_no 값 받아오기.
	
	$(function(){
		
		var mainBoard_no = $("#y_main_bNo").val();
		console.log(mainBoard_no);
		if(mainBoard_no != null && mainBoard_no != "null"){
			$("#y_board_content").load("<%=request.getContextPath()%>/board/read",{board_no : mainBoard_no});
		} else {
		var chkObj = document.getElementsByName("rowCheck");
		console.log("chkObj : " + chkObj);
		var rowCnt = chkObj.length;
		
		$("input[name=allCheck]").click(function() {
			var chk_listArr = $("input[name=rowCheck]");
			for(var i = 0; i < chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
			
		$("input[name=rowCheck]").click(function(){
			if($("input[name=rowCheck]:checked").length == rowCnt) {
				$("input[name=rowCheck]")[0].checked = true;
			} else {
			$("input[name=allCheck]")[0].checked = false;
			}
		});
			
		}
		
		
	});
	// 체크박스 삭제
	$("#y_btn_delete").click(function() {
		var valueArr = new Array();
		var list = $("input[name=rowCheck]");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) { // 선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : "<%= request.getContextPath() %>/board/delete",
				type : "post",
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(result) {
					console.log("result : " + result);
					if(result == "게시글 삭제에 성공하였습니다.") {
						alert(result);
						console.log("if 탔다");
						$("#menu_board").get(0).click();
					} else {
						alert(result);
						console.log("else 탔다");
						$("#menu_board").get(0).click();
					}
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
			});
		}
	});
	
	
	// 검색
	$("#y_btn_search").click(function(){
		var valueSelect = $("#select_search option:selected").val();
		var valueInput = $("#search_bar").val();
		console.log("valueSelect : " + valueSelect);
		console.log("valueInput : " + valueInput);

		//if(valueInput == "") {
			if(false) {
			alert("글을 입력해주세요.")
		} else {
			$.ajax({
				url : "<%= request.getContextPath() %>/board/select",
				type : "get",
				data : {"type" : valueSelect, "keyword" : valueInput},
				success : function(result) {
					console.log(result);
					$("#s_content_box").html(result);
				}
			})
		}
	});
		
	// 게시물 리스트 [제목] 클릭 시 상세보기 페이지 진입
	$(".y_board_view").click(function(){
		var bNo = $(this).parents("tr").children(".y_td_no").text();
		console.log("bNo :" + bNo);
		$("#y_board_content").load("<%=request.getContextPath()%>/board/read", {board_no : bNo});
	});
	
	
	// 글쓰기 [버튼] 클릭 시 글쓰기 페이지 진입
	$("#y_btn_insert").click(function() {
       var dept_code = $("#y_emp_dCode").val()
       console.log(dept_code);
       if(dept_code == "D40"){
         $("#y_board_content").load("<%=request.getContextPath()%>/board/insert");
       } else {
    	  alert("권한이 없습니다!");
       }
    });
	
	</script>
 </div>
</body>
</html>