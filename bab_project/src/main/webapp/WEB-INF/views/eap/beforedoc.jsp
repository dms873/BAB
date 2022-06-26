<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>결재 대기 문서</title> -->
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
			결재 대기 문서
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
				      <th scope="col">NO</th>
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
				  	<c:forEach items="${beforeDoc }" var="i">
					    <tr>
					      <th scope="row">${i.eap_no }</th>
					      <td>${i.eap_draft_date }</td>
					      <td>${i.dept_name }</td>
					      <td>${i.emp_name }</td>
					      <td>${i.df_title }</td>
					      <td>${i.eap_title }</td>
					      <td><i class="bi bi-paperclip"></i></td>
					      <c:if test="${i.eap_sta_code eq '결재대기'}">
					      	<td><button class="btn btn-warning" style="font-size: .8em;">결재대기</button></td>
					      </c:if>
					      <c:if test="${i.eap_sta_code eq '진행중'}">
					      	<td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
					      </c:if>
					      <!-- TODO) 결재회수, 반려, 결재완료 추가 예정 -->
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
    
    <script>
    	$("#s_test").click(function() {
    		console.log("클릭됨??");
    		$("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/selectdoc");
    	});
    </script>
    

</body>
</html>