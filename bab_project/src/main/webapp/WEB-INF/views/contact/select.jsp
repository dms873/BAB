<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" class="form-control" name="keyword" id="keyword" style="width: 270px; height: 38px; margin: 0 6px;">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="y_btn_search" style="height: 38px;">검색</button>
		</div>
	</div>
	<!-- search{e} -->

		<div id='test'>
			<button>ㅅ</button>
			<button>ㅇ</button>
			<button>ㅈ</button>
			<button>ㅌ</button>
		</div>
	
	<div class="container y_outer_div" style="display: flex; justify-content: center;">
		<table id='my-table' class="table table-hover" style="text-align: center; border: 1px dotted lightgray; border-collapse: separate;">
			<tbody id='my-tbody'>
			<tr style="background-color: #e9ecef;">
				<td>No</td>
				<td>이름</td>
				<td>부서</td>
				<td>소속</td>
				<td>직급</td>
				<td>전화번호</td>
				<td>내선번호</td>
				<td>입사일</td>
				<td>이메일</td>
				<td>주소</td>
			</tr>
			<tr>
				<td>1</td>
				<td>손은진</td>
				<td>회계팀</td>
				<td>BAB</td>
				<td>차장</td>
				<td>010-1234-5678</td>
				<td>4567</td>
				<td>2019-01-24</td>
				<td>dms873@naver.com</td>
				<td>경기도 의정부시</td>
			</tr>
			<tr>
				<td>2</td>
				<td>장혜미</td>
				<td>기획팀</td>
				<td>BAB</td>
				<td>대리</td>
				<td>010-5678-1234</td>
				<td>1234</td>
				<td>2020-04-15</td>
				<td>hyemi5242@gmail.com</td>
				<td>경기도 의정부시</td>
			</tr>
			<tr>
				<td>3</td>
				<td>윤영원</td>
				<td>영업팀</td>
				<td>BAB</td>
				<td>과장</td>
				<td>010-4787-1565</td>
				<td>4433</td>
				<td>2022-02-15</td>
				<td>22yongwon@gmail.com</td>
				<td>서울시 강동구 천호동</td>
			</tr>
			<tr>
				<td>4</td>
				<td>서지훈</td>
				<td>개발팀</td>
				<td>파견</td>
				<td>*</td>
				<td>010-1518-8784</td>
				<td>5987</td>
				<td>2020-06-25</td>
				<td>wlgns@gmail.com</td>
				<td>서울시 강서구 목동</td>
			</tr>
			<tr>
				<td>5</td>
				<td>이해람</td>
				<td>개발팀</td>
				<td>파견</td>
				<td>*</td>
				<td>010-5487-1154</td>
				<td>6748</td>
				<td>2021-11-05</td>
				<td>wlgofka@gmail.com</td>
				<td>서울시 동대문구 장안동</td>
			</tr>
</tbody>
		</table>
	</div>
	<ul id="find"></ul>

		<nav aria-label="Page navigation example" style="display: flex; justify-content: center; margin-top: 50px;">
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
		

	<script>
	// 검색할 배열
	        const arr = [
		            { name: "손은진",boo:'기획팀' },
		            { name: "장혜미",boo:'영업팀' },
		            { name: "윤영원",boo:'기획팀' },
		            { name: "서지훈",boo:'영업팀' },
		            { name: "이해람",boo:'회계팀' },
		            { name: "박정환",boo:'기획팀' },
		            { name: "김혜린",boo:'회계팀' },
		            { name: "홍샛별",boo:'회계팀' },
		        ];
	
	//const arr2 = arr.map(item =>({...item,diassembled:Hangul.disassemble(item.name)[0]}))
	
	const arr2 = arr.map(function(item){
		const res = item;
		res.diassembled = Hangul.disassemble(item.name)[0]
		return res;
	})
	
	const COLUMN = [0,'name','boo',3,4,5,6,7,8,9]
	
	
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

	
	
	</script>
    </div>

</body>
</html>