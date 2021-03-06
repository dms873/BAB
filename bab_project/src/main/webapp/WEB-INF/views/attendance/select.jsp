<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>내 근태 현황</title> -->
</head>

<!-- 통계 -->
<style>
	.highcharts-figure,
	.highcharts-data-table table {
	  min-width: 320px;
	  max-width: 500px;
	  margin: 1em auto;
	}
	
	#container {
	  height: 400px;
	}
	
	.highcharts-data-table table {
	  font-family: Verdana, sans-serif;
	  border-collapse: collapse;
	  border: 1px solid #ebebeb;
	  margin: 10px auto;
	  text-align: center;
	  width: 100%;
	  max-width: 500px;
	}
	
	.highcharts-data-table caption {
	  padding: 1em 0;
	  font-size: 1.2em;
	  color: #555;
	}
	
	.highcharts-data-table th {
	  font-weight: 600;
	  padding: 0.5em;
	}
	
	.highcharts-data-table td,
	.highcharts-data-table th,
	.highcharts-data-table caption {
	  padding: 0.5em;
	}
	
	.highcharts-data-table thead tr,
	.highcharts-data-table tr:nth-child(even) {
	  background: #f8f8f8;
	}
	
	.highcharts-data-table tr:hover {
	  background: #f1f7ff;
	}
</style>

<!-- 시계, 서브 메뉴 -->
<style>
	.date {
		font-size: 1em;
	    color: dimgray;
	}
	
	.time {
		font-size: 2.2em;
	    font-weight: bold;
	    margin-bottom: 10px;
	    color: #010326;
	}
	
	.s_hover_event {
		cursor: pointer;
	}
</style>
<style>
	#s_attendance_box {
		width: 150px;
		height: 1000px;
		margin-top: 25px;
		margin-left: 10px;
	}
	
	#s_att_management {
		margin-top: 30px;
		font-weight: bold;
		font-size: 1.2em;
		color: rgb(1, 3, 38);
	}
	
	.s_hover_event {
		display: inline-block;
		margin-right: 10px;
	}
	
	#s_att_content_box {
		border: 1px solid lightgray;
		height: 1000px;
		width: 1150px;
		margin-top: 20px;
		margin-left: 10px;
		border-radius: 10px;
		padding: 20px;
	}
	
	#s_att_chart_tt {
		margin-top: 20px;
		margin-bottom: 10px;
		font-size: 1.2em;
		font-weight: bold;
		display: inline-block;
	}
	
	#s_att_chart_co {
		display: inline-block;
		margin-left: 5px;
		color: darkslategray;
	}
	
	#s_att_chart_box {
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 10px;
		height: 310px;
	}
	
	#s_att_line {
		float: left;
		border-right: 2px solid lightgray;
		height: 250px;
		margin: 20px 50px;
	}
	
	.s_att_box_co {
		display: inline-block;
		font-size: 1.2em;
		font-weight: bold;
	}
	
	#s_att_table_tt {
		margin-top: 50px;
		margin-bottom: 10px;
		font-size: 1.2em;
		font-weight: bold;
		clear: both;
	}
	
	#s_att_month {
		font-size: 2em;
		font-weight: bold;
		color: rgb(5, 131, 242);
		text-align: center;
		margin-bottom: 30px;
	}
</style>
<body>

	<section id="s_att_box">
        <article style="float: left;">
            <div id="s_attendance_box">
            	
            	<!-- 디지털 시계 -->
        		<div id="date" class="date"></div>
            	<div id="time" class="time"></div>
            	
            	<!-- 출근 버튼 클릭 시 출근시간 표시되는 화면 -->
            	<div>출근시간 
            		<span id="s_now_start_time" style="color: gray; margin-left: 20px;">
            			<!-- 오늘 날짜의 근무시작시간이 없으면 미등록 표기 -->
            			<c:if test="${empty selectToday.att_start }">
            				미등록
            			</c:if>
            			<!-- 오늘 날짜의 근무시작시간이 있으면 오늘 날짜의 근무시작시간 표기 -->
            			<c:if test="${not empty selectToday.att_start }">
            				${selectToday.att_start }
            			</c:if>
            		</span>
            	</div>
            	<!-- 퇴근 버튼 클릭 시 퇴근시간 표시되는 화면 -->
            	<div style="margin-top: 5px; margin-bottom: 20px;">퇴근시간 
	            	<span id="s_now_out_time" style="color: gray; margin-left: 20px;">
	            		<!-- 오늘 날짜의 근무종료시간이 없으면 미등록 표기 -->
		            	<c:if test="${empty selectToday.att_end }">
		            		미등록
		            	</c:if>
		            	<!-- 오늘 날짜의 근무종료시간이 있으면 오늘 날짜의 근무종료시간 표기 -->
            			<c:if test="${not empty selectToday.att_end }">
            				${selectToday.att_end }
            			</c:if>
	            	</span>
            	</div>
            	<div style="border: 1px solid lightgrey;margin-bottom: 20px;"></div>
            	<div style="display: flex;justify-content: space-evenly;">
            		<!-- 출퇴근 버튼 -->
            		<button class="btn btn-outline-success" id="s_att">출근</button>
            		<button class="btn btn-outline-danger" id="s_leave" disabled>퇴근</button>
            	</div>
            
            	<!-- 서브 메뉴 -->
                <div id="s_att_management">근태 관리</div>
                <div style="color: rgb(5, 131, 242);" id="s_att_select" class="s_hover_event">내 근태 현황</div>
                <div id="s_ho_select" class="s_hover_event">내 연차 내역</div>
            </div>
        </article>  
        <article style="float: left;">
            <div id="s_att_content_box">
            	<div id="s_att_chart_tt">선택적근로시간제</div><div id="s_att_chart_co">(월 160시간 근무)</div>	
            	<div id="s_att_chart_box">
	            	<!-- 근무시간 통계 -->
            		<div style="float: left;">
						<figure class="highcharts-figure">
						  <div id="container" style="width: 500px; height: 300px;"></div>
						</figure>
					</div>
					<div id="s_att_line"></div>
					<div style="float: left; margin: 20px 0 20px 60px;">
						<div style="line-height: 150px;">
							<div class="s_att_box_co" style="margin-right: 50px;">누적 근무 시간</div>
							<div class="s_att_box_co" style="color: #008dd7;">${workTimeCnt }시간</div>
						</div>
						<div>
							<div class="s_att_box_co" style="margin-right: 50px;">남은 근무 시간</div>
							<div class="s_att_box_co" style="color: gray;" id="s_r_work_time">160시간</div>
						</div>
					</div>
				</div>
	            <div id="s_att_table_tt">내 근태 현황</div>
	            <!-- 현재 월 컨트롤러에서 currentMonth로 담아준 것 가져와 표기 -->
				<div id="s_att_month">${currentMonth }</div>
	            <div>
					<table class="table table-hover" style="text-align: center; vertical-align: middle;">
					  <thead>
					    <tr>
					      <th scope="col">NO</th>
					      <th scope="col">날짜</th>
					      <th scope="col">근무시작시간</th>
					      <th scope="col">근무종료시간</th>
					      <th scope="col">소정근무시간</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<!-- 월별근무시간 반복문 돌기 -->
					  	<c:forEach items="${selectMonth }" var="i">
						    <tr>
						      <th scope="row">${i.rnum }</th>
						      <td>
						      	 <!-- 근무시작시간 timestamp라서 년월일만 출력 -->
						      	 <c:set var="att_start" value="${i.att_start }"/>
						      	 ${fn:substring(att_start, 0, 10) }
						      </td>
						      <td>
						      	 ${fn:substring(att_start, 11,16) }
					      	  </td>
						      <td>
						      	  <!-- 근무종료시간이 없으면 미등록으로 표기 -->
						      	  <c:if test="${empty i.att_end }">
						      	  	 미등록
						      	  </c:if>
						      	  <!-- 근무종료시간이 있으면 근무종료시간 표기 -->
						      	  <c:if test="${not empty i.att_end }">
						      	  	 ${i.att_end }
						      	  </c:if>
						      </td>
						      <td>
						      	  <!-- 소정근무시간이 0보다 크면 소정근무시간 표기 -->
						      	  <c:if test="${i.att_worktime > 0 }">
						      	  	 ${i.att_worktime }시간
						      	  </c:if>
						      	  <!-- 소정근무시간이 0보다 작으면 아무것도 표기 안함 -->
						      	  <c:if test="${i.att_worktime < 0 }">
						      	  	 
						      	  </c:if>
						      	  <!-- 소정근무시간이 비어있으면 퇴근시간 미등록 표기 -->
						      	  <c:if test="${empty i.att_worktime }">
						      	  	 퇴근시간 미등록
						      	  </c:if>
					      	  </td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				</div>
			<div style="margin-top: 50px; display: flex; justify-content: center;">
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
            </div>
        </article>    
    </section>
    
    <script>
    	// 남은 근무 시간 계산
    	$(document).ready(function(){
    		// 컨트롤러에서 구한 근무시간을 time변수에 담아줌
        	var time = "${workTimeCnt}";
        	// 전체근무시간 - 소정근무시간 계산 
        	var timeCal = 160 - Number(time);
        	// 남은 근무 시간 text를 계산한 값으로 변경
    		$("#s_r_work_time").text(timeCal + "시간");
    	});
    </script>
    
    <script>
		// 페이징 처리
		$(".page-item.num .page-link").click(function(event) {
			// 페이지숫자 눌렀을 때 누른 innerText를 pageNum으로 가져와 링크로 넘겨주기
			var pageNum = event.target.innerText;
			$("#s_att_box").load("<%=request.getContextPath()%>/attendance/select?page="+pageNum);
		})
		
		$(".page-item.pre .page-link").click(function(event){
			//이전 페이지 최소값 -1 -> 이전 페이지로 이동
			const num = Math.min(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))-1;
			$("#s_att_box").load("<%=request.getContextPath()%>/attendance/select?page="+num);
		
		})
		
		$(".page-item.next .page-link").click(function(event){
			//다음 페이지 최대값 +1 -> 다음 페이지로 이동
			const num = Math.max(...[...$('.page-link')].map(v=>v.innerText*1).filter(v=>v>0))+1;
			$("#s_att_box").load("<%=request.getContextPath()%>/attendance/select?page="+num);
		});
    </script>
    
    
    <script>
    	// 서브 메뉴 클릭 시
   		// 내 근태 현황
    	$("#s_ho_select").click(function() {
    		$("#s_att_content_box").load("<%=request.getContextPath()%>/attendance/holiday");
    	});
    	
    	// 내 연차 내역
    	$("#s_att_select").click(function() {
    		$("#menu_attendance").get(0).click();
    	});
    </script>
    
    <script>
    
    	// 출근 시간이 미등록인 경우 
    	if($("#s_now_start_time").text().trim() == '미등록') {
    		$("#s_now_start_time").css('color', 'gray');
    	} else { // 출근 시간이 적혀있는 경우
    		$("#s_now_start_time").css('color', 'rgb(5, 131, 242)');
    		$("#s_now_start_time").css('fontWeight', 'bold');
    		$("#s_att").prop("disabled", "disabled");
    		$("#s_att").css("backgroundColor", "gray");
    		$("#s_att").css("color", "white");
    		$("#s_att").css("borderColor", "gray");
    		$("#s_leave").removeAttr("disabled");
    		$("#s_leave").removeAttr("style");
    	}
    	
    	// 퇴근 시간이 미등록인 경우
    	if($("#s_now_out_time").text().trim() == '미등록') {
    		$("#s_now_out_time").css('color', 'gray');
    	} else { // 퇴근 시간이 적혀있는 경우
    		$("#s_now_out_time").css("color", "red");
    		$("#s_now_out_time").css("fontWeight", "bold");
    		$("#s_leave").prop("disabled", "disabled");
    		$("#s_leave").css("backgroundColor", "gray");
    		$("#s_leave").css("color", "white");
    		$("#s_leave").css("borderColor", "gray");
    	}
   		
    	// 출근버튼 클릭 시 버튼 사용 불가
    	$("#s_att").click(function() {
    		
    		// 출근 시간 저장 DB다녀올 ajax
   			$.ajax({
   				url : "<%=request.getContextPath()%>/attendance/insertstart"
   					, type: "post"
   					, success: function(result) {
   						if(result.includes('실패')) {
   							swal({
   			                    title: "",
   			                    text: error,
   			                    icon: "success",
   			                    closeOnClickOutside: false,
   			                    closeOnEsc: false
   			                });
   	   						$("#menu_attendance").get(0).click();
   						} else {
	   						swal({
			                    title: "",
			                    text: result,
			                    icon: "success",
			                    closeOnClickOutside: false,
			                    closeOnEsc: false
			                });
	   						$("#menu_attendance").get(0).click();
   						}
   					}
   			});
    	});
    	
    	// 퇴근버튼 클릭 시 버튼 사용 불가
    	$("#s_leave").click(function() {
    		
    		// DB에 저장된 출근 시간 
    		var startTime = "${selectToday.att_start}"
    		
    		// 오늘 날짜 조회
   			var date = new Date();
    	    var year = date.getFullYear();
    	    var month = ("0" + (1 + date.getMonth())).slice(-2);
    	    var day = ("0" + date.getDate()).slice(-2);
    	    var TodayDate = year + "/" + month + "/" + day; 
    	    
    	    // 오늘 출근 시간 시간 계산 위해 오늘날짜+DB 저장된 출근시간으로 Date형식을 만듬
    	    var attStart = new Date(TodayDate + " " + startTime);
    		
    	    // 출근 시간보다 1시간 뒤 시간 계산
    	    attStart.setHours(attStart.getHours() + 1);
    		var endTime = new Date();
    		// 출근 후 최소 1시간 이상 근무해야 퇴근 가능
    		if(attStart <= endTime) {
    			// 퇴근 시간 저장 DB다녀올 ajax
       			$.ajax({
       				url : "<%=request.getContextPath()%>/attendance/updateend"
       					, type: "post"
       					, success: function(result) {
       						if(result.includes('실패')) {
       							swal({
       			                    title: result,
       			                    text: "",
       			                    icon: "error",
       			                    closeOnClickOutside: false,
       			                    closeOnEsc: false
       			                });
       	   						$("#menu_attendance").get(0).click();
       						} else {
    	   						swal({
    			                    title: result,
    			                    text: "",
    			                    icon: "success",
    			                    closeOnClickOutside: false,
    			                    closeOnEsc: false
    			                });
    	   						$("#menu_attendance").get(0).click();
       						}
       					}
       			});
    		} else {
    			swal({
	                    title: "출근 후 최소 1시간 이상 지나야 퇴근 처리가 가능합니다.",
	                    text: "",
	                    icon: "error",
	                    closeOnClickOutside: false,
	                    closeOnEsc: false
	                });
    			return;
    		}
    		
    		
    		
    		
    	});
    </script>

	<!-- 디지털시계 js -->
	<script>
		function setClock(){
		    var dateInfo = new Date(); 
		    var hour = modifyNumber(dateInfo.getHours());
		    var min = modifyNumber(dateInfo.getMinutes());
		    var sec = modifyNumber(dateInfo.getSeconds());
		    var year = dateInfo.getFullYear();
		    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
		    var date = dateInfo.getDate();
		    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
		    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
		}
		function modifyNumber(time){
		    if(parseInt(time)<10){
		        return "0"+ time;
		    }
		    else
		        return time;
		}
		
		$(document).ready(function() {
		    setClock();
		    setInterval(setClock,1000); //1초마다 setClock 함수 실행
		});
	</script>
    
    <script>
	 	// 서브메뉴 클릭 시 색깔변경
	    $(".s_hover_event").click(function() {
	        $(".s_hover_event").css('color', 'black');
	        $(this).css('color', 'rgb(5, 131, 242)');
	    });
    </script>
    
    <script>
 	// 근무시간 퍼센트 소수점 반올림
    $(document).ready(function() {
    	$("#s_percent").text(Math.round($("#s_percent").text()));
    });
    </script>
    
    <!-- 통계 -->
    <script>
	    Highcharts.setOptions({
	      	colors: ['#008dd7','#c6c6c6']
	      });
	    Highcharts.chart('container', {
	      chart: {
	          renderTo: 'halfPie',
	          type: 'pie',
	          margin: [0, 10, 30, 10],
	          style: {
	            color: '#333333',
	            fontFamily: 'notoSans'
	          },
	          backgroundColor:'rgba(255, 255, 255, 0)'
	        },
	      credits: {enabled: false},
	      title: {
	          text: '<span id="s_percent">' + ${workTimeCnt}/160*100 + '</span>' + '<span class="unit"> %</span>',
	          align: 'center',
	          verticalAlign: 'middle',
	          y: 50,
	          style: {
	            color:'#333',
	            fontSize: '20px',
	            fontFamily: 'Segoe UI',
	            fontWeight: 'bold',
	            textOutline: false 
	          }
	        },
	        legend: {
	          align:'center',
	          verticalAlign: 'bottom',
	          x: 0,
	          y: -35,
	          itemDistance: 15,
	          symbolHeight: 10,
	          symbolWidth: 10,
	          symbolPadding: 5,
	          symbolRadius: 0,
	          itemStyle: {
	            color: '#333',
	            fontSize: '14px',
	            fontWeight:'normal'
	           }
	         },
	         plotOptions: {
	         	pie: {
	              dataLabels: {
	                enabled: true,
	                distance: -20,
	              },
	                startAngle: -90,//하프 도넛 앵글 시작 각도
	                endAngle: 90,//하프 도넛 앵글 끝 각도
	                center: ['50%', '75%'],
	                size: '100%',
	                showInLegend: true
	               }
	            },
	            series: [{
	              type: 'pie',
	              name:'근무시간',
	              innerSize: '50%',
	              data:[
	                ['누적 근무시간', ${workTimeCnt}],
	                {
	                  name: '남은 근무시간',
	                  y: 160-${workTimeCnt},
	                  dataLabels: {
	                 	 enabled: true,
	                 	format: '{y}시간',
		                color: '#fff', 
		                y: -5,
		                x: -10,
		                style: {
			                  fontSize: '13px',
			                  fontFamily: 'notoSans',
			                  fontWeight: 'bold',
			                  textOutline: false 
		                 }
	                  }
	                }
	              ],
	              dataLabels: {
	                enabled: true,
	                format: '{y}시간',
	                color: '#fff', 
	                align: 'center',
	                //세로 위치 지정
	                y: 15,
	                x: 10,
	                style: {
	                  fontSize: '13px',
	                  fontFamily: 'notoSans',
	                  fontWeight: 'bold',
	                  textOutline: false 
	                 }
	              }
	           }]
	    });
    </script>

</body>
</html>