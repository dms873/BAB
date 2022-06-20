<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<meta charset="UTF-8">
<title>공지사항 조회</title>
<style>
	#y_td_hover:hover {
		text-decoration: underline;
	}	

	
</style>

</head>
<body>
<div id="y_board_content" style="border: 1px solid lightgray;height: 1000px;width: 1300px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" >

	<div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">공지사항</h1>
		</div>
		
		<hr>
		
		<div class="pannel-heading">전체 ${totalCnt}건의 게시물이 있습니다.</div>
	</div>

	<div style="margin: 20px 0;">
		<!-- search{s} -->
		<div class="select_outer" style="display: flex; justify-content: center;">
			<select class="form-select mb-3" style="width: 100px;">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" class="form-control" name="keyword" id="keyword" style="width: 270px; height: 38px; margin: 0 6px;">
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
				<li class="page-item num"><a class="page-link" href="#">${i }</a></li>
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
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?page=${currentPage-1}");
	
	})
	
	$(".page-item.next .page-link").click(function(event){
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?page=${currentPage+1}");
	
	})
	
	
	// 체크박스 전체 선택/해제
	
	$(function(){
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
		
		
	
	// 게시물 리스트 [제목] 클릭 시 상세보기 페이지 진입
	$(".y_board_view").click(function(){
		var bNo = $(this).parents("tr").children(".y_td_no").text();
		console.log("bNo :" + bNo);
		$("#y_board_content").load("<%=request.getContextPath()%>/board/read?board_no=" + bNo);
	});
	
	
	// 글쓰기 [버튼] 클릭 시 글쓰기 페이지 진입
	$("#y_btn_insert").click(function() {
        $("#y_board_content").load("<%=request.getContextPath()%>/board/insert");
    });
	</script>
 </div>
</body>
</html>