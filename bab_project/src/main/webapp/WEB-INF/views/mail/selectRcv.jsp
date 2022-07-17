<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>receive mail</title> -->
</head>
<style>
	.y_hover_event {
		cursor: pointer;
	}
 	#y_td_hover:hover {
		text-decoration: underline;
	}	
</style>
<body>

	<input type="hidden" id="y_emp_email" value="${email }">

	<section>
       
        <article>

				<div>
					<h1>받은 메일함</h1>
					<div>
						<span style="border: 1px solid lightgray; padding: 5px 7px 7px 7px;"><input type="checkbox" id="allCheck" name="allCheck"><i class="bi bi-arrow-down-short"></i></span>
						<button type="button" id="y_btn_read" class="btn btn-secondary">읽음</button>
						<button type="button" id="y_btn_delete" class="btn btn-secondary">삭제</button>
						<button type="button" class="btn btn-secondary">답장</button>
					</div>
					<div>
					<table class="table table-hover"
						style="vertical-align: middle; text-align: center;">
						<c:forEach items="${selectRcv}" var="i">
							<tr>
								<th scope="row"><input type="checkbox" id="rowCheck" name="rowCheck" value="${i.rec_no }"></th>
								<c:choose>
								<c:when test="${i.rec_read == 'Y'}">
								<td style="text-align: left;">${i.rec_sender }</td>
								<td id="y_td_hover" style="width: 400px; text-align: left;"><a href="javascript:void(0)" id="y_mail_view" class="y_mail_view">${i.rec_title }</a></td>
								</c:when>
								<c:otherwise>
								<td style="text-align: left; color: blue;">${i.rec_sender }</td>
								<td id="y_td_hover" style="width: 400px; text-align: left;"><a href="javascript:void(0)" id="y_mail_view" class="y_mail_view" style="color: blue;">${i.rec_title }</a></td>
								</c:otherwise>
								</c:choose>
								<td>${i.rec_date }</td>
								<td>${i.rec_filesize }</td>
							</tr>
						</c:forEach>
					</table>
					</div>
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
		</article>    
    </section>
    
    <script>
    
    
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
				url : "<%= request.getContextPath() %>/mail/deleteRcv",
				type : "post",
				traditional : true,
				data : {
					valueArrRcv : valueArr
				},
				success : function(result) {
					console.log("result : " + result);
					if(result == "메일 삭제에 성공하였습니다.") {
						alert(result);
						console.log("if 탔다");
						$("#y_rcv_mail").get(0).click();
					} else {
						alert(result);
						console.log("else 탔다");
						$("#y_rcv_mail").get(0).click();
					}
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
			});
		}
	});
    
	// 페이징 처리
	
	$(".page-item.num .page-link").click(function(event) {
		var email =$("#y_emp_email").val();
		console.log(event.target.innerText);
		
		var pageNum = event.target.innerText;
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectRcv",{page : pageNum, email : email});
	})
	
	$(".page-item.pre .page-link").click(function(event){
		var email =$("#y_emp_email").val();
		//이전 페이지 최소값 -1 -> 이전 페이지로 이동
		const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectRcv",{page : pageNum, email : email});
	
	})
	
	$(".page-item.next .page-link").click(function(event){
		var email =$("#y_emp_email").val();
		//다음 페이지 최대값 +1 -> 다음 페이지로 이동
		const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
		<%-- $("#s_content_box").load("<%=request.getContextPath()%>/board/select?page=${currentPage+1}"); --%>
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectRcv",{page : pageNum, email : email});
	})
    
    
    
	// 체크 박스 선택 후 읽음 버튼 클릭 시 색상 변경
	$("#y_btn_read").click(function(){
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
			var chk = confirm("읽음으로 표시하시겠습니까?");
			$.ajax({
				url : "<%= request.getContextPath() %>/mail/readOnly",
				type : "post",
				traditional : true,
				data : {
					valueArrRead : valueArr
				},
				success : function(result) {
					console.log("result : " + result);
					if(result == "메일을 읽었습니다.") {
						alert(result);
						console.log("if 탔다");
						$("#y_rcv_mail").get(0).click();
					} else {
						alert(result);
						console.log("else 탔다");
						$("#y_rcv_mail").get(0).click();
					}
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
			});
		}
	});
	
	
	
 	// 메일 리스트 [제목] 클릭 시 상세보기 페이지 진입
	$(".y_mail_view").click(function(){
		
		/* var mNo = $(this).parents("tr").children(".rowCheck").val(); */
		var mNo = $(this).parents("tr").children("th").children("input").val();
		console.log("mNo :" + mNo);
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/read?mRcvNo="+mNo);
	});
    </script>
</body>
</html>