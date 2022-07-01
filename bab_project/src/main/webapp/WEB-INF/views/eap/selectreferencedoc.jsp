<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>참조 문서함</title> -->
<style>
	.s_eap_tt {
		font-size: 1.2em;
		font-weight: bold;
		margin-bottom: 15px;
	}
</style>
</head>
<body>

	<div>
		<div class="s_eap_tt" style="float: left; padding: 30px; margin-bottom: 30px;">
			참조 문서함
		</div>
		<div style="padding: 30px;">
	        <!-- 검색 -->
			<nav class="navbar navbar-light"
				style="float: right; margin-bottom: 20px;">
				<div class="container-fluid">
					<form action="AdminReviewList" method="get" id="frm" class="d-flex">
						<select name="f" style="width: 200px; float: right; margin-right: 10px;"
							class="form-select" aria-label="Default select example">
							<option value="eap_title" selected="selected">제목</option>
							<option value="df_code">결재양식</option>
							<option value="emp_name">기안자</option>
							<option value="dept_name">기안부서</option>
						</select> 
						<input class="form-control me-2" type="search" name="q" placeholder="Search" aria-label="Search" value="${query }">
						<button id="s_search_btn" class="btn btn-outline-success" type="submit">Search</button>
					</form>
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
				  	<c:forEach items="${referencedoc }" var="i">
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
					      	  <c:if test="${i.eap_sta_code eq '결재완료' }">
					      		  <button class="btn btn-secondary" style="font-size: .8em; width: 77px;">완료</button>
				      		  </c:if>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
			<div style="margin-top: 100px; display: flex; justify-content: center;">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
    </div>
    
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
    		
    		console.log("tdArr : " + tdArr);
    		console.log("배열에 담긴 값 : " + tdArr[0]);
    		// 그 중 첫 번째 담긴 결재번호 필요
    		var dfNo = tdArr[0]; 
    		
    		// 링크로 넘기기
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectdoc?df_no=" + dfNo);
    		
    	});
    </script>

</body>
</html>