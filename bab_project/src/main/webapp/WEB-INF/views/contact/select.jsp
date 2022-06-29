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
		<div class="select_outer" style="display: flex; justify-content: flex-end;">
			<select class="form-select mb-3" style="width: 100px;">
				<option value="title">이름</option>
				<option value="content">부서</option>
				<option value="writer">직급</option>
			</select> <input type="text" class="form-control" name="keyword" id="keyword" style="width: 270px; height: 38px; margin: 0 6px;">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="y_btn_search" style="height: 38px;">검색</button>
		</div>
	</div>
	<!-- search{e} -->

		<div id='test' style="text-align: center; ">
			<button type="button" class="btn btn-light">ㄱ</button>
			<button type="button" class="btn btn-light">ㄴ</button>
			<button type="button" class="btn btn-light">ㄷ</button>
			<button type="button" class="btn btn-light">ㄹ</button>
			<button type="button" class="btn btn-light">ㅁ</button>
			<button type="button" class="btn btn-light">ㅂ</button>
			<button type="button" class="btn btn-light">ㅅ</button>
			<button type="button" class="btn btn-light">ㅇ</button>
			<button type="button" class="btn btn-light">ㅈ</button>
			<button type="button" class="btn btn-light">ㅊ</button>
			<button type="button" class="btn btn-light">ㅋ</button>
			<button type="button" class="btn btn-light">ㅌ</button>
			<button type="button" class="btn btn-light">ㅍ</button>
			<button type="button" class="btn btn-light">ㅎ</button>
			
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
	
	fetch('http://localhost:8090/bab/board/test').then(res=>res.json()).then(res=>{

		//const {selectBoard:arrs} = res.map(v=>Object.keys(v))
		
		const arr = res.selectBoard.map(v=>Object.keys(v).reduce((res,vv)=>{
    		res[vv.split('board_')[1]] = v[vv]+''
    		return res
    	},{}))
			
			const arr2 = arr.map(function(item){
		const res = item;
		res.diassembled = Hangul.disassemble(item.writer)[0]
		return res;
		})
	
	const COLUMN = ['content','writer','no','title','undefined','date',6,7,8,9]
	
	
	document.querySelector('#test').addEventListener('click',function(e){
	const $tbody =  document.querySelector('#my-tbody')
			if(e.target.tagName === 'BUTTON'){
			const dataRows = [...$tbody.children].slice(1)
			dataRows.forEach(function(item){item.remove()})
			
			const $el = e.target;
			
			const search = $el.innerText;
			
				//arr.filter(item => item.diassembled === search)
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
	
	//const arr2 = arr.map(item =>({...item,diassembled:Hangul.disassemble(item.name)[0]}))
	


	
	
	</script>
    </div>

</body>
</html>