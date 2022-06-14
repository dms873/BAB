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
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<meta charset="UTF-8">
<title>내 근태 현황</title>
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
<body>

	<section>
        <article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
            	
            	<!-- 디지털 시계 -->
        		<div id="date" class="date"></div>
            	<div id="time" class="time"></div>
            	
            	<div>출근시간 <span id="s_now_start_time" style="color: gray; margin-left: 20px;">미등록</span></div>
            	<div style="margin-top: 5px; margin-bottom: 20px;">퇴근시간 <span id="s_now_out_time" style="color: gray; margin-left: 20px;">미등록</span></div>
            	<div style="border: 1px solid lightgrey;margin-bottom: 20px;"></div>
            	<div style="display: flex;justify-content: space-evenly;">
            		<button class="btn btn-outline-success" id="s_att">출근</button>
            		<button class="btn btn-outline-danger" id="s_leave" disabled style="background-color: gray; color: white; border-color: gray;">퇴근</button>
            	</div>
            
                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">근태 관리</div>
                <div style="display: inline-block; margin-right: 10px; color: rgb(5, 131, 242);" id="s_att_select" class="s_hover_event">내 근태 현황</div>
                <div style="display: inline-block; margin-right: 10px;" id="s_ho_select" class="s_hover_event">내 연차 내역</div>
            </div>
        </article>  
        <article style="float: left;">
            <div style="border: 1px solid lightgray;height: 1000px;width: 1150px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_att_content_box">
            	<div style="margin-top: 20px; margin-bottom: 10px;font-size: 1.2em;font-weight: bold; display: inline-block;">선택적근로시간제</div><div style="display: inline-block;margin-left: 5px;color: darkslategray;">(월 160시간 근무)</div>	
            	<div style="border: 1px solid lightgray; border-radius: 10px; padding: 10px; height: 310px;">
	            	<!-- 근무시간 통계 -->
            		<div style="float: left;">
						<figure class="highcharts-figure">
						  <div id="container" style="width: 500px; height: 300px;"></div>
						</figure>
					</div>
					<div style="float: left;border-right: 2px solid lightgray;height: 250px;margin: 20px 50px;"></div>
					<div style="float: left;margin: 20px 0 20px 60px;">
						<div style="line-height: 150px;">
							<div style="display: inline-block;font-size: 1.2em;font-weight: bold;margin-right: 50px;">누적 근무 시간</div>
							<div style="display: inline-block;font-size: 1.2em;font-weight: bold;color: #008dd7;">140시간</div>
						</div>
						<div>
							<div style="display: inline-block;font-size: 1.2em;font-weight: bold;margin-right: 50px;">남은 근무 시간</div>
							<div style="display: inline-block;font-size: 1.2em;font-weight: bold;color: gray;">20시간</div>
						</div>
					</div>
				</div>	
	            <div style="margin-top: 50px; margin-bottom: 10px;font-size: 1.2em;font-weight: bold; clear: both;">내 근태 현황</div>
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
					    <tr>
					      <th scope="row">1</th>
					      <td>2022/05/27</td>
					      <td>10:00</td>
					      <td>19:00</td>
					      <td>8시간</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>2022/05/26</td>
					      <td>9:00</td>
					      <td>18:00</td>
					      <td>8시간</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>2022/05/25</td>
					      <td>9:30</td>
					      <td>18:30</td>
					      <td>8시간</td>
					    </tr>
					    <tr>
					      <th scope="row">4</th>
					      <td>2022/05/24</td>
					      <td>10:00</td>
					      <td>19:00</td>
					      <td>8시간</td>
					    </tr>
					    <tr>
					      <th scope="row">5</th>
					      <td>2022/05/23</td>
					      <td>9:00</td>
					      <td>18:00</td>
					      <td>8시간</td>
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
        </article>    
    </section>
    
    <script>
    	// 출근버튼 클릭 시 버튼 사용 불가
    	$("#s_att").click(function() {
    		$("#s_att").prop("disabled", "disabled");
    		$("#s_att").css("backgroundColor", "gray");
    		$("#s_att").css("color", "white");
    		$("#s_att").css("borderColor", "gray");
    		$("#s_now_start_time").text($("#time").text().substr(0,5));
    		$("#s_now_start_time").css("color", "rgb(5, 131, 242)");
    		$("#s_now_start_time").css("fontWeight", "bold");
    		$("#s_leave").removeAttr("disabled");
    		$("#s_leave").removeAttr("style");
    	});
    	
    	// 퇴근버튼 클릭 시 버튼 사용 불가
    	$("#s_leave").click(function() {
    		$("#s_leave").prop("disabled", "disabled");
    		$("#s_leave").css("backgroundColor", "gray");
    		$("#s_leave").css("color", "white");
    		$("#s_leave").css("borderColor", "gray");
    		$("#s_now_out_time").text($("#time").text().substr(0,5));
    		$("#s_now_out_time").css("color", "red");
    		$("#s_now_out_time").css("fontWeight", "bold");
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
	          text: '84' + '<span class="unit"> %</span>',
	          align: 'center',
	          verticalAlign: 'middle',
	          y: 70,
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
	                ['누적 근무시간', 140],
	                {
	                  name: '남은 근무시간',
	                  y: 20,
	                  dataLabels: {
	                 	 enabled: true,
	                 	format: '{y}시간',
		                color: '#fff', 
		                y: 0,
		                x: -15,
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
	                y: 10,
	                x: 20,
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