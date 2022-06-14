<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>결재 대기 문서</title>
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
				    <tr id="s_test">
				      <th scope="row">1</th>
				      <td>2022/05/26</td>
				      <td>회계팀</td>
				      <td>손은진</td>
				      <td>지출결의서</td>
				      <td>신규 직원채용 명함 신청의 건</td>
				      <td><i class="bi bi-paperclip"></i></td>
				      <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>2022/05/26</td>
				      <td>회계팀</td>
				      <td>손은진</td>
				      <td>휴가신청서</td>
				      <td>개인 연차 신청의 건</td>
				      <td></td>
				      <td><button class="btn btn-warning" style="font-size: .8em;">결재대기</button></td>
				    </tr>
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