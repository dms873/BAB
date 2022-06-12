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
	/* .y_outer_div {
		width: 1100px;
		margin-top : 70px;
		margin-left: 70px;
	} */
	
</style>

</head>
<body>
	<div class="row" style="width: 1000px;">
		<div class="col-lg-12">
			<h1 class="page-header">공지사항</h1>
		</div>
		<hr>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="pannel-heading">전체 9건의 게시물이 있습니다.</div>
		</div>

	</div>
	<div>
		<!-- search{s} -->
		<div class="select_outer" style="display: flex; justify-content: center;">
			<select class="select">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" class="text-area" name="keyword" id="keyword">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="btnSearch">검색</button>
		</div>
	</div>
	<!-- search{e} -->


	<div class="container y_outer_div" style="display: flex; justify-content: center;">
		<table class="table table-striped table-hover">
			<tr>
				<td>No</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>
			<tr>
				<td>1</td>
				<td>sdhfssdhsdhfs</td>
				<td>sdfsfsfs</td>
				<td>2022-06-09</td>
			</tr>

		</table>
	</div>
	
	<div>
		<button type="button" class="btn btn-primary">글쓰기</button>
	</div>

		<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
</body>
</html>