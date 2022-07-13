<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>내 연차 내역</title> -->
<style>
	#s_ho_list_tt {
		margin-top: 20px;
		margin-bottom: 10px;
		font-size: 1.2em;
		font-weight: bold;
	}
	
	#s_ho_list_box {
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 20px;
		height: 120px;
	}
	
	#s_ho_list_info {
		text-align: center;
		width: 250px;
		line-height: 70px;
		float: left;
	}
	
	.s_ho_cnt {
		border-right: 1px solid;
		height: 80px;
		float: left;
		margin: 0 30px;
	}
	
	.s_ho_cnt_box {
		text-align: center;
		width: 200px;
		float: left;
	}
	
	.s_ho_cnt_co {
		color: rgb(5, 131, 242);
		font-weight: bold;
	}
	
	#s_ho_use_tt {
		margin-top: 100px;
		margin-bottom: 10px;
		font-size: 1.2em;
		font-weight: bold;
		clear: both;
	}
	
	#s_notice {
		text-align: center;
		color: red;
		font-weight: bold;
		font-size: 1.2em;
}
</style>
</head>
<body>

	<div id="s_ho_list_tt">내 연차 내역</div>
	<div id="s_ho_list_box">
		<div>
			<div id="s_ho_list_info">
				<!-- 로그인한 사람의 프로필 사진 -->
				<img src="${info.emp_file_path }" style="width: 50px;">
				<!-- 로그인한 사람의 이름 표기 -->
				<div style="display: inline-block;margin-left: 10px;">${info.emp_name }</div>
				<!-- 로그인한 사람의 직위 표기 -->
				<div style="display: inline-block;">${info.job_title }</div>
			</div>
			<div class="s_ho_cnt"></div>
			<div class="s_ho_cnt_box">
				<!-- 총 연차의 수 표기 -->
				<div style="margin-top: 15px;">총 연차</div>
				<div class="s_ho_cnt_co">${totalHoCnt }</div>
			</div>
			<div class="s_ho_cnt"></div>
			<div class="s_ho_cnt_box">
				<!-- 휴가신청서 결재 완료, 승인 완료 된 것의 연차 합계 표기 -->
				<div style="margin-top: 15px;">사용 연차</div>
				<div class="s_ho_cnt_co" id="s_ho_use_cnt">${useHoCnt }</div>
			</div>
			<div class="s_ho_cnt"></div>
			<div class="s_ho_cnt_box">
				<!-- 총 연차 - 사용 연차 표기 -->
				<div style="margin-top: 15px;">잔여 연차</div>
				<div class="s_ho_cnt_co" id="s_ho_rm_cnt"></div>
			</div>
		</div>
	</div>
	
	<div id="s_ho_use_tt">사용 내역</div>
	
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
		  	<!-- 사용 내역이 있을 때 -->
		  	<c:if test="${not empty useHoList }">
		  		<!-- 사용 내역만큼 반복문 돌기 -->
			  	<c:forEach items="${useHoList }" var="i">
				    <tr>
				      <th scope="row">${i.rnum }</th>
				      <td>${i.emp_name }</td>
				      <td>${i.dept_name }</td>
				      <td>${i.ho_code }</td>
				      <td>${i.ho_start } ~ ${i.ho_end }</td>
				      <td>${i.ho_use_count }</td>
				      <td>${i.eap_content }</td>
				    </tr>
			    </c:forEach>
		    </c:if>
		  </tbody>
		</table>
		<!-- 사용 내역이 없을 때 -->
		<c:if test="${empty useHoList }">
			<div id="s_notice">휴가 사용 내역이 없습니다.</div>
		</c:if>
	</div>
	<div style="margin-top: 100px; display: flex; justify-content: center;">
			<!-- 페이징 처리 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<!-- 시작페이지가 1보다 크면 -->
				<c:if test="${startPage > 1 }">
					<li class="page-item pre">
						<!-- '<<' 이전 모양 버튼 생김 -->
						<a class="page-link" href="#" aria-label="Previous"> 
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					</c:if>
					<!-- 시작페이지부터 끝페이지까지 반복 -->
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<!-- 현재페이지가 i와 같으면 -->
						<c:if test="${currentPage eq i}">
							<!-- 해당 페이징에 active 클래스 추가(파란 배경) -->
							<li class="page-item num active"><a class="page-link" href="#">${i }</a></li>
						</c:if>
						<c:if test="${currentPage ne i}">
							<!-- 아니면 active 없음(흰 배경) -->
							<li class="page-item num"><a class="page-link" href="#">${i }</a></li>
						</c:if>
					</c:forEach>
					<!-- 끝페이지가 페이지개수보다 작으면 -->
					<c:if test="${endPage < pageCnt }">
					<li class="page-item next">
						<!-- '>>' 다음 모양 버튼 생김 -->
						<a class="page-link" href="#" aria-label="Next"> 
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					</c:if>
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
		      <td>${totalHoCnt }</td>
		      <td>직급에 따른 연차 지급</td>
		    </tr>
		  </tbody>
		</table>
	</div>
	
	<script>
    	// 잔여 연차 계산
    	$(document).ready(function(){
    		// 컨트롤러에서 구한 총 연차 개수를 total 변수에 담아줌
        	var total = "${totalHoCnt}";
        	// 컨트롤러에서 구한 사용 연차 개수를 use 변수에 담아줌
        	var use = "${useHoCnt}";
        	// 총 연차 개수 - 사용 연차 개수 계산
        	var cal = Number(total) - Number(use);
        	// 잔여 연차 text를 계산한 값으로 변경
    		$("#s_ho_rm_cnt").text(cal);
    		
    		// 사용 연차가 0.0일 경우 0으로 표시
    		if($("#s_ho_use_cnt").text() == '0.0') {
    			$("#s_ho_use_cnt").text('0');
    		}
    	});
    </script>
    
    <script>
		// 페이징 처리
		$(".page-item.num .page-link").click(function(event) {
			// 페이지숫자 눌렀을 때 누른 innerText를 pageNum으로 가져와 링크로 넘겨주기
			var pageNum = event.target.innerText;
			$("#s_att_content_box").load("<%=request.getContextPath()%>/attendance/holiday?page="+pageNum);
		})
		
		$(".page-item.pre .page-link").click(function(event){
			//이전 페이지 최소값 -1 -> 이전 페이지로 이동
			const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
			$("#s_att_content_box").load("<%=request.getContextPath()%>/attendance/holiday?page="+num);
		
		})
		
		$(".page-item.next .page-link").click(function(event){
			//다음 페이지 최대값 +1 -> 다음 페이지로 이동
			const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
			$("#s_att_content_box").load("<%=request.getContextPath()%>/attendance/holiday?page="+num);
		});
    </script>

</body>
</html>