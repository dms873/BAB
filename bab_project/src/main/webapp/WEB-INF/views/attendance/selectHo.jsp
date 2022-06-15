<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 연차 내역</title>
</head>
<body>

	<div style="margin-top: 20px; margin-bottom: 10px;font-size: 1.2em;font-weight: bold;">내 연차 내역</div>
	<div style="border: 1px solid lightgray; border-radius: 10px; padding: 20px; height: 120px;">
		<div>
			<div style="text-align: center; width: 250px; line-height: 70px; float: left;">
				<img src="https://media.discordapp.net/attachments/692994434526085184/981215903570092132/unknown.png" style="width: 50px;">
				<div style="display: inline-block;font-size: .9em;margin-left: 10px;">손은진</div>
				<div style="display: inline-block;font-size: .9em;">차장</div>
			</div>
			<div style="border-right: 1px solid; height: 80px; float: left; margin: 0 30px;"></div>
			<div style="text-align: center;width: 200px;float: left;">
				<div style="margin-top: 15px;">총 연차</div>
				<div style="color: rgb(5, 131, 242);font-weight: bold;">21</div>
			</div>
			<div style="border-right: 1px solid; height: 80px; float: left; margin: 0 30px;"></div>
			<div style="text-align: center;width: 200px;float: left;">
				<div style="margin-top: 15px;">사용 연차</div>
				<div style="color: rgb(5, 131, 242);font-weight: bold;">18</div>
			</div>
			<div style="border-right: 1px solid; height: 80px; float: left; margin: 0 30px;"></div>
			<div style="text-align: center;width: 200px;float: left;">
				<div style="margin-top: 15px;">잔여 연차</div>
				<div style="color: rgb(5, 131, 242);font-weight: bold;">3</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 100px; margin-bottom: 10px;font-size: 1.2em;font-weight: bold; clear: both;">사용 내역</div>
	
	<div>
		<table class="table table-hover" style="text-align: center; vertical-align: middle;">
		  <thead>
		    <tr>
		      <th scope="col">NO</th>
		      <th scope="col">이름</th>
		      <th scope="col">부서명</th>
		      <th scope="col">휴가 종류</th>
		      <th scope="col">사용기간</th>
		      <th scope="col">사용연차</th>
		      <th scope="col">내용</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>손은진</td>
		      <td>회계팀</td>
		      <td>연차</td>
		      <td>2022/03/28 ~ 2022/03/30</td>
		      <td>2</td>
		      <td>휴가로 인한 연차 사용</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>손은진</td>
		      <td>회계팀</td>
		      <td>반차</td>
		      <td>2022/03/18 ~ 2022/03/18</td>
		      <td>0.5</td>
		      <td>코로나 백신 3차 접종으로 인한 반차 사용</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>손은진</td>
		      <td>회계팀</td>
		      <td>반차</td>
		      <td>2022/02/17 ~ 2022/02/17</td>
		      <td>0.5</td>
		      <td>병원검진으로 인한 반차 사용</td>
		    </tr>
		    <tr>
		      <th scope="row">4</th>
		      <td>손은진</td>
		      <td>회계팀</td>
		      <td>연차</td>
		      <td>2022/02/07 ~ 2022/02/11</td>
		      <td>5</td>
		      <td>휴가로 인한 연차 사용</td>
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
	
	<div style="margin-top: 100px; margin-bottom: 10px;font-size: 1.2em;font-weight: bold;">생성 내역</div>
	
	<div>
		<table class="table table-hover" style="text-align: center; vertical-align: middle;">
		  <thead>
		    <tr>
		      <th scope="col">NO</th>
		      <th scope="col">등록일</th>
		      <th scope="col">사용기간</th>
		      <th scope="col">발생일수</th>
		      <th scope="col">내용</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>2022/01/01</td>
		      <td>2022/01/01 ~ 2022/12/31</td>
		      <td>21</td>
		      <td>근무년수에 따른 연차 지급</td>
		    </tr>
		  </tbody>
		</table>
	</div>

</body>
</html>