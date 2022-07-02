<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>결재 문서함</title> -->
<style>
	.s_eap_tt {
		font-size: 1.2em;
		font-weight: bold;
		margin-bottom: 15px;
	}
	
	#s_notice {
		text-align: center;
	    color: red;
	    font-weight: bold;
	    font-size: 1.2em;
	}
	
	.s_search_notice {
	    font-size: 1.2em;
	    color: red;
	    font-weight: bold;
	    margin: 30px 0;
	}
</style>
</head>
<body>

	<div>
		<div class="s_eap_tt" style="float: left; padding: 30px; margin-bottom: 30px;">
			결재 문서함
		</div>
		<div style="padding: 30px;">
	        <!-- 검색 -->
			<nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
				<div class="container-fluid" style="margin: 30px 0;">
					<select name="select_search" style="width: 120px; float: right; margin-right: 10px;" id="select_search"
						class="form-select" aria-label="Default select example">
						<option value="eap_title" selected="selected">제목</option>
						<option value="df_title">결재양식</option>
						<option value="emp_name">기안자</option>
						<option value="dept_name">기안부서</option>
					</select> 
					<input class="form-control me-2" type="search" name="search_bar" id="search_bar" placeholder="Search" aria-label="Search" style="width: 300px;">
					<button id="s_search_btn" class="btn btn-outline-success" type="submit">Search</button>
				</div>
			</nav>
			<div style="clear: both;">
				<table class="table table-hover" style="text-align: center; vertical-align: middle;">
				  <thead>
				    <tr>
				      <th scope="col">문서번호</th>
				      <th scope="col">기안일</th>
				      <th scope="col">기안부서</th>
				      <th scope="col">기안자</th>
				      <th scope="col">결재양식</th>
				      <th scope="col">제목</th>
				      <th scope="col">첨부</th>
				      <th scope="col">결재상태</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${resultdoc }" var="i">
					    <tr class="s_tr_readList">
					      <th scope="row">${i.df_no }</th>
					      <td>${i.eap_draft_date }</td>
					      <td>${i.dept_name }</td>
					      <td>${i.emp_name }</td>
					      <td>${i.df_title }</td>
					      <td>${i.eap_title }</td>
					      <td>
						      <c:if test="${not empty i.eap_file_path }">
						      	<i class="bi bi-paperclip"></i>
						      </c:if>
					      </td>
					      <td>
					      	<c:if test="${i.eap_sta_code eq '반려' }">
					      		<button class="btn btn-danger" style="font-size: .8em; width: 77px;">반려</button>
				      		</c:if>
				      		<c:if test="${i.eap_sta_code eq '결재완료' }">
					      		<button class="btn btn-secondary" style="font-size: .8em; width: 77px;">완료</button>
				      		</c:if>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<c:if test="${empty resultdoc }">
					<div id="s_notice">결재한 문서가 없습니다.</div>
				</c:if>
			</div>
			<div style="margin-top: 100px; display: flex; justify-content: center;">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
					<c:if test="${startPage > 1 }">
						<li class="page-item pre">
							<a class="page-link" href="#" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						</c:if>
						<c:forEach begin="${startPage }" end="${endPage }" var="i">
							<li class="page-item num"><a class="page-link" href="#">${i }</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCnt }">
						<li class="page-item next">
							<a class="page-link" href="#" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
    </div>
    
    <script>
		// 페이징 처리
		$(".page-item.num .page-link").click(function(event) {
			var pageNum = event.target.innerText;
			$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectresultdoc?page="+pageNum);
		})
		
		$(".page-item.pre .page-link").click(function(event){
			//이전 페이지 최소값 -1 -> 이전 페이지로 이동
			const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
			$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectresultdoc?page="+num);
		
		})
		
		$(".page-item.next .page-link").click(function(event){
			//다음 페이지 최대값 +1 -> 다음 페이지로 이동
			const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
			$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectresultdoc?page="+num);
		});
		
		// 검색
		$("#s_search_btn").click(function() {
			
			var check = "${empty resultdoc }";
			var check2 = "${not empty resultdoc }";
			
			var valueSelect = $("#select_search option:selected").val();
			var valueInput = $("#search_bar").val();
			
			$.ajax({
				url : "<%= request.getContextPath() %>/eap/selectresultdoc",
				type : "get",
				data : {"type" : valueSelect, "keyword" : valueInput},
				success : function(result) {
					if(check == 'true') {
						$('#s_notice').replaceWith('<div style="text-align: center;">'
				                  + '<div class="s_search_notice">검색 결과가 없습니다.</div>'
				                  + '<button class="btn btn-primary" onclick="relist()">목록으로</button>'
				               + '</div>');
					} else if(check2 == 'true') {
						$("#s_eap_content_box").html(result);
						$('#s_notice').replaceWith('<div style="text-align: center;">'
				                  + '<div class="s_search_notice">검색 결과가 없습니다.</div>'
				                  + '<button class="btn btn-primary" onclick="relist()">목록으로</button>'
				               + '</div>');
					} else {
						$("#s_eap_content_box").html(result);
					}
				}
			});
		});
    </script>
    
    <!-- 상세문서조회 -->
    <script>
    	$(".s_tr_readList").click(function() {
    		// 배열 선언
    		var tdArr = new Array();
    		// 현재 클릭된 행(tr의 td)
    		var tr = $(this);
    		var td = tr.children();
    		
    		// 반복문을 통해 배열에 값을 담아 사용
    		td.each(function(i) {
    			tdArr.push(td.eq(i).text());
    		})
    		
    		// 그 중 첫 번째 담긴 결재번호 필요
    		var dfNo = tdArr[0]; 
    		
    		// 링크로 넘기기
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectdoc?df_no=" + dfNo);
    		
    	});
    </script>
    
    <script>
	 	// 결재 문서함 메뉴 클릭(목록으로)
		function relist() {
			$('#s_result_doc').trigger('click');
		}
    </script>

</body>
</html>