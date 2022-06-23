<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				    <tr>
				      <th scope="row">1</th>
				      <td>2022/05/30</td>
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
				      <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>2022/05/24</td>
				      <td>회계팀</td>
				      <td>손은진</td>
				      <td>지출결의서</td>
				      <td>사람인 유료 채용공고 신청의 건</td>
				      <td><i class="bi bi-paperclip"></i></td>
				      <td><button class="btn btn-secondary" style="font-size: .8em; width: 77px;">완료</button></td>
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>2022/05/23</td>
				      <td>회계팀</td>
				      <td>손은진</td>
				      <td>지출결의서</td>
				      <td>사람인 유료 채용공고 신청의 건</td>
				      <td><i class="bi bi-paperclip"></i></td>
				      <td><button class="btn btn-danger" style="font-size: .8em; width: 77px;">반려</button></td>
				    </tr>
				    <tr>
				      <th scope="row">5</th>
				      <td>2022/05/10</td>
				      <td>회계팀</td>
				      <td>홍길순</td>
				      <td>휴가신청서</td>
				      <td>개인 연차 신청의 건</td>
				      <td></td>
				      <td><button class="btn btn-secondary" style="font-size: .8em; width: 77px;">완료</button></td>
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

</body>
</html>