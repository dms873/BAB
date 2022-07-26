<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>주소록 조회</title> -->
</head>
<body>

    <div style="border: 1px solid lightgray;height: 1000px;width: 1300px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" >
        <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">주소록</h1>
		</div>

		<hr>
		
	</div>

	<div style="margin: 20px 0;">
		<!-- search{s} -->
		<div class="select_outer" style="display: flex; justify-content: center;">
			<select id="select_search" name="select_search" class="form-select mb-3" style="width: 100px;">
				<option value="emp_name">이름</option>
				<option value="dept_name">부서</option>
				<option value="job_title">직급</option>
			</select> <input type="text" class="form-control" name="search_bar" id="search_bar" style="width: 270px; height: 38px; margin: 0 6px;">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="y_btn_search" style="height: 38px;">검색</button>
		</div>
	</div>
	<!-- search{e} -->

		<div id='y_hangle_btn' style="text-align: center; ">
			<button type="button" class="btn btn-light hangle">ㄱ</button>
			<button type="button" class="btn btn-light hangle">ㄴ</button>
			<button type="button" class="btn btn-light hangle">ㄷ</button>
			<button type="button" class="btn btn-light hangle">ㄹ</button>
			<button type="button" class="btn btn-light hangle">ㅁ</button>
			<button type="button" class="btn btn-light hangle">ㅂ</button>
			<button type="button" class="btn btn-light hangle">ㅅ</button>
			<button type="button" class="btn btn-light hangle">ㅇ</button>
			<button type="button" class="btn btn-light hangle">ㅈ</button>
			<button type="button" class="btn btn-light hangle">ㅊ</button>
			<button type="button" class="btn btn-light hangle">ㅋ</button>
			<button type="button" class="btn btn-light hangle">ㅌ</button>
			<button type="button" class="btn btn-light hangle">ㅍ</button>
			<button type="button" class="btn btn-light hangle">ㅎ</button>
			
		</div>
	
	<div class="container y_outer_div" style="display: flex; justify-content: center;">
		<table id='my-table' class="table table-hover" style="text-align: center; border: 1px dotted lightgray; border-collapse: separate;">
			<tbody id='my-tbody'>
			<tr style="background-color: #e9ecef;">
				<td>No</td>
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
				<td>전화번호</td>
				<td>내선번호</td>
				<td>입사일</td>
				<td>이메일</td>
				<td>주소</td>
			</tr>
			<c:forEach items="${selectContact }" var="i">
			<tr>
				<td>${i.rownum }</td>
				<td>${i.emp_name }</td>
				<td>${i.dept_name }</td>
				<td>${i.job_title }</td>
				<td>${i.emp_phone }</td>
				<td>${i.emp_deskphone }</td>
				<td>${i.emp_hiredate }</td>
				<td>${i.emp_email }</td>
				<td>${i.emp_address }</td>
			</tr>
			</c:forEach>
</tbody>
		</table>
	</div>
	<ul id="find"></ul>

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
				url : "<%= request.getContextPath() %>/contact/select",
				type : "get",
				data : {"type" : valueSelect, "keyword" : valueInput},
				success : function(result) {
					console.log(result);
					$("#s_content_box").html(result);
				}
			})
		}
	});
	
	
	// 페이징 처리
		
		$(".page-item.num .page-link").click(function(event) {
			console.log(event.target.innerText);
			
			var pageNum = event.target.innerText;
			$("#s_content_box").load("<%=request.getContextPath()%>/contact/select?page="+pageNum);
		})
		
		$(".page-item.pre .page-link").click(function(event){
			//이전 페이지 최소값 -1 -> 이전 페이지로 이동
			const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
			$("#s_content_box").load("<%=request.getContextPath()%>/contact/select?page="+num);
		
		})
		
		$(".page-item.next .page-link").click(function(event){
			//다음 페이지 최대값 +1 -> 다음 페이지로 이동
			const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
			$("#s_content_box").load("<%=request.getContextPath()%>/contact/select?page="+num);
		})
	
	
	// 검색할 배열
	// controller에서 fetch로 값을 받아옴 (json형태의 data)
	fetch('http://localhost:8090/bab/contact/selectBtn').then(res=>res.json()).then(res=>{
		
    	// 가져온 값을 배열 형태로 만들고 리턴한 값을 arr에 담아줌
    	const arr = res.selectContact.map(v=>Object.keys(v).reduce((res,vv)=>{
    		res[vv] = v[vv]+''
    		return res
    	},{}));
    	
		//29개의 rownum : ~ emp_name : ~ -> 각 줄당 emp_name 값을 api처리
		//arr2에 arr을 담아주는데 값이 같이 바뀌므로 arr = arr2
		const arr2 = arr.map(function(item){
		const res = item;
		res.diassembled = Hangul.disassemble(item.emp_name)[0]
		return res;
		})
		console.log(arr2);
		console.log(arr);
		
	const COLUMN = ['rownum','emp_name','dept_name','job_title','emp_phone','emp_deskphone','emp_hiredate','emp_email','emp_address']
	
	// tagName이 Button인 초성 버튼 클랙했을때 기존 리스트 삭제
	document.querySelector('#y_hangle_btn').addEventListener('click',function(e){
	const $tbody =  document.querySelector('#my-tbody')
			if(e.target.tagName === 'BUTTON'){
			const dataRows = [...$tbody.children].slice(1)
			dataRows.forEach(function(item){item.remove()})
			
			const $el = e.target;
			
			//search는 해당 버튼의 초성
			const search = $el.innerText;
			console.log("search : " + search)
				// api로 가져온 초성과 search 값이 같은것들을 남겨둔다.
				arr.filter(function(item){
					return item.diassembled === search
				})
				.forEach(function(item){
					const tr = document.createElement('tr')
						
					COLUMN.forEach(function(colName){
						const td = document.createElement('td')
						td.innerText = item[colName]
						tr.append(td)
					})
					
					$tbody.append(tr)
				})
		}
	})
	
	})
	
	// 초성 버튼 클릭 시 퍼지네이션 숨기기
	$(".hangle").click(function(){
		$(".pagination").hide();
	})
	
	</script>
    </div>

</body>
</html>