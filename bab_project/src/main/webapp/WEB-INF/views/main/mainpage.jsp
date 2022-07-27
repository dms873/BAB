<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 조직도(jsTree) CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <link rel="stylesheet" href="https://www.orangehilldev.com/jstree-bootstrap-theme/demo/assets/dist/themes/proton/style.css" />
    <!-- 알람 toastr CDN -->
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<!-- fullcalendar CDN 추가 장혜미(220612) -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
    <!-- datepicker CDN 추가 장혜미(220612) -->
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <!-- 통계API CDN 추가 손은진(220614) -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<!-- 한글 초성 검색필터 CDN 추가 윤영원(220615) -->
	<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
	<!-- CKEditor CDN 추가 윤영원(220615) -->
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<!-- SweetAlert CDN 추가 장혜미(220624) -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- kakao(daum) 주소 API CDN 추가 장혜미(220624) -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Uploadcare CDN 추가 장혜미(220627) -->
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
    <script>UPLOADCARE_LOCALE = "ko"</script>
    <!-- sockjs CDN 추가 손은진(220702) -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
    <!-- calendar/mainpage.css 추가 장혜미(220711) -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/calendar/mainpage.css">
    <!-- 공통 reset.css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
	.s_menu:hover {
		/* border: 1px solid !important; */
		background-color: #0583F2;
	}
	
	.toast-info {
		background-color: #2F96B4 !important;
	}
	
	#s_notice {
		text-align: center;
		color: red;
		font-weight: bold;
		font-size: 1.2em;
		margin-top: 70px;
	}
	
	.s_main_tt {
		text-align: center;
		font-weight: bold;
		font-size: 1.2em;
		margin-bottom: 20px;
		cursor: pointer;
		color: darkgreen;
	}
</style>
<!-- 통계css 추가 : 손은진(220709) -->
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

<style>
	#y_td_hover:hover {
		text-decoration: underline;
	}	
</style>
    
    
</head>
<body>

	

	<header>
        <div style="width: 1500px;margin: 0 auto;">
            <div style="margin-top: 30px;height: 100px;border-bottom: 1px solid silver;">
                <div style="float: left;padding: 10px;">
                    <a href="#" onclick="location.href='<%=request.getContextPath()%>/main/'">
                        <img src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png" style="width: 150px;">
                    </a>
                </div>
                <div style="float: right;">
                    <div style="float: left; line-height: 70px;">
                        <i id="s_bell_btn" class="bi bi-bell position-relative" style="cursor:pointer;">
                            <!-- 알람 배지 -->
                           	<c:if test="${homeRcDocCnt ne 0 }">
	                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger s_badge">
	                            	${homeRcDocCnt }
	                            </span>
                            </c:if>
                        </i>
                    </div>
                    <div style="float: right; width: 200px;">
                        <div>
                        <!--로그인세션 받아와서 정보 출력 혜미 수정-220629  -->
                        <c:if test="${info != null}">
                            <div style="float:left; margin:0 25px;">
                                <img src="${info.emp_file_path}"
                                    style="width: 50px; height: 50px; border-radius: 25px;">
                                <div style="font-size: .8em;">${info.emp_name}님</div>
                            </div>
                        </c:if>
                            <div style="line-height: 60px;">
                                <button type="button" id="j_main_logout" class="btn btn-secondary" style="font-size: .8em;">
                                로그아웃
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section style="clear:both;">
        <div style="width: 1500px; margin: 0 auto;">
            <nav style="float: left; width: 170px;">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 160px; background-color: #010326 !important;">
                    <ul class="nav nav-pills flex-column mb-auto" style="height: 1000px;">
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_contact">주소록</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_organ">조직도</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_mail">메일</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_eap">전자결재</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_attendance">근태관리</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_calendar">캘린더</a>
                        </li>
						<li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_chat">채팅</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_board">공지사항</a>
                        </li>
                         <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_poll">투표</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_info">내 정보 수정</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <article style="float: left;" id="s_content_box">
                <div>
                <div style="height: 370px;">
                    <div style="border: 1px solid lightgray; border-radius: 10px;height: 340px;margin-top: 30px;margin-left: 10px;width: 650px; float: left; padding: 20px;">
                        <div class="s_main_tt" id="s_at_tt">근무시간</div>
                        <div style="text-align: center;">
                            <figure class="highcharts-figure">
							  <div id="container" style="width: 500px; height: 300px;"></div>
							</figure>
                        </div>
                    </div>
                    <div style="border: 1px solid lightgray; border-radius: 10px;height: 340px;margin-top: 30px;margin-left: 10px;width: 650px; float: right; padding: 20px;">
                        <div class="s_main_tt" id="j_cal_tt">캘린더</div>
                        <div style="text-align: center;">
                            <div id="j_calendar"></div>
                        </div>
                    </div>
                </div>
                <div style="border: 1px solid lightgray; border-radius: 10px;height: 300px;margin-top: 30px;margin-left: 10px; padding: 20px;">
                    <div class="s_main_tt" id="s_re_tt">전자 결재 대기</div>
                    <table class="table" style="text-align: center;">
                        <thead>
                          <tr>
						      <th scope="col">문서번호</th>
						      <th scope="col">기안일</th>
						      <th scope="col">기안부서</th>
						      <th scope="col">기안자</th>
						      <th scope="col">결재양식</th>
						      <th scope="col">제목</th>
						      <th scope="col">첨부</th>
						      <th scope="col">결재상태</th>
				    	  </tr>
                        </thead>
                        <tbody style="vertical-align: middle">
                        	<c:forEach begin="0" end="2" items="${homeRcDoc }" var="i">
	                          <tr>
	                            <th scope="row">${i.df_no }</th>
						        <td>${i.eap_draft_date }</td>
						        <td>${i.dept_name }</td>
						        <td>${i.emp_name }</td>
						        <td>${i.df_title }</td>
						        <td>${i.eap_title }</td>
						      <td>
						      	<c:if test="${not empty i.eap_file_path }">
						      		<i class="bi bi-paperclip"></i>
						      	</c:if>
					      	  </td>
						      <c:if test="${i.eap_sta_code eq '결재대기'}">
						      	<td><button class="btn btn-warning" style="font-size: .8em; cursor: auto;">결재대기</button></td>
						      </c:if>
						      <c:if test="${i.eap_sta_code eq '진행중'}">
						      	<td><button class="btn btn-success" style="font-size: .8em; width: 77px; cursor: auto;">진행중</button></td>
						      </c:if>
						      <c:if test="${i.eap_sta_code eq '반려'}">
						      	<td><button class="btn btn-danger" style="font-size: .8em; width: 77px; cursor: auto;">반려</button></td>
						      </c:if>
						      <c:if test="${i.eap_sta_code eq '결재완료'}">
						      	<td><button class="btn btn-secondary" style="font-size: .8em; width: 77px; cursor: auto;">완료</button></td>
						      </c:if>
						    </tr>
                        	</c:forEach>
                        </tbody>
                      </table>
                      <c:if test="${empty homeRcDoc }">
				  		<div id="s_notice">결재할 문서가 없습니다.</div>
				  	  </c:if>
                </div>
                <div style="border: 1px solid lightgray; border-radius: 10px;height: 300px;margin-top: 30px;margin-left: 10px; padding: 20px;">
                    <div id="y_board_tt" class="s_main_tt">공지사항</div>
                    <table class="table" style="text-align: center;">
                        <thead>
                          <tr>
                            <th scope="col">NO</th>
                            <th scope="col">제목</th>
                            <th scope="col">내용</th>
                            <th scope="col">작성일</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${boardList }" var="i">
                          <tr>
                          	<th scope="row" class="y_td_no">${i.board_no }</th>
                          	<td id="y_td_hover"><a href="javascript:void(0)" id="y_board_view" class="y_board_view">${i.board_title }</a></td>
                          	<td>${i.board_writer }</td>
                          	<td>${i.board_date }</td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                </div>
            </div>
            </article>
        </div>
    </section>
    
    <!-- 메뉴 클릭 시 context_box 자리에 jsp파일(contact.html을 jsp이름으로 바꾸면 됨) load하기(ajax역할하는 함수) -->
    <script>
	    
        $("#menu_contact").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/contact/select");
        });
 		
 		
        $("#menu_organ").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/organ/select");
        });

        $("#menu_eap").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/eap/main");
        });
        
        // 메일 추가 : 윤영원(220701)
        $("#menu_mail").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/mail/main");
        });
        // 공지사항 추가 : 윤영원(220615)
        $("#menu_board").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/board/select");
        });
        
        // 근태관리 추가 : 손은진(220614)
        $("#menu_attendance").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/attendance/select");
        });
        /*캘린더 추가 : 장혜미(220612)  */
        $("#menu_calendar").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/calendar/select");
        });
        /*내정보수정 추가 : 장혜미(220612)  */
        $("#menu_info").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/info/main");
        });
        
     	// 채팅 추가 : 손은진(220614)
        $("#menu_chat").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/echo/select");
        });
        
        /*투표 추가 : 장혜미(220712)  */
        $("#menu_poll").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/poll/select");
        });
    </script>
    
    <script>
    	$("#s_bell_btn").click(function() {
    		
    		var cnt = "${homeRcDocCnt}";
    		
    		toastr.options = {
    				  "closeButton": true,
    				  "debug": false,
    				  "newestOnTop": true,
    				  "progressBar": true,
    				  "positionClass": "toast-top-right",
    				  "preventDuplicates": false,
    				  "onclick": null,
    				  "showDuration": "300",
    				  "hideDuration": "1000",
    				  "timeOut": "2000",
    				  "extendedTimeOut": "1000",
    				  "showEasing": "swing",
    				  "hideEasing": "linear",
    				  "showMethod": "fadeIn",
    				  "hideMethod": "fadeOut"
    				}
    		
    		if(cnt > 0) {
	    		toastr.info("결재 대기가 " + cnt + "건이 있습니다.", "알람");
    		} else {
    			toastr.info("새 알람이 없습니다.", "알람");
    		}
    	});
    </script>

    <script>
        // 알람 아이콘 누를 때마다 색깔 변경, 배지 사라짐
        $('#s_bell_btn').on('click', function () {
            if ($(this).attr('class', 'bi bi-bell')) {
                $(this).attr('class', 'bi bi-bell-fill');
                $('.s_badge').remove();
            } else if ($(this).attr('class', 'bi bi-bell-fill')) {
                $(this).attr('class', 'bi bi-bell');
            }
            // 2초 후 알람 아이콘 색깔 없애기
            setTimeout(function () {
            	$("#s_bell_btn").attr('class', 'bi bi-bell');
			}, 2000);
        });

    </script>

    <script>
        // 메뉴에서 클릭했을 때
        $(".s_menu").click(function() {
             $(".s_menu").removeClass("active");
             $(this).addClass("active");
         });
        
        // 전자 결재 대기 클릭했을 때
        $("#s_re_tt").click(function() {
        	$("#menu_eap").get(0).click();
        });
        
        // 근무시간 클릭했을 때
        $("#s_at_tt").click(function() {
        	$("#menu_attendance").get(0).click();
        });
    </script>
    
    <!-- 근무시간 통계 추가 : 손은진(220709) -->
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
    
    <script>
    // 근무시간 퍼센트 소수점 반올림
    $(document).ready(function() {
    	$("#s_percent").text(Math.round($("#s_percent").text()));
    });
    </script>
    
    <!--script 추가 : 장혜미(220718)  -->
    <script>
    //로그아웃 버튼 클릭 시
    $("#j_main_logout").click(function(){
   	 swal({
         title: "로그아웃 하시겠습니까?",
         text: "",
         icon: "info",
         buttons: true,
         closeOnClickOutside: false,
         closeOnEsc: false
     })
     .then((willDelete) => {
		  if (willDelete) {
			  location.href='<%=request.getContextPath()%>/employee/logout'
		  } else {
		    
		  }
	});
    });
    </script>
    
    <!--FullCalendar 추가 : 장혜미(220711)  -->
    <script>
    // 캘린더 클릭 시
    $("#j_cal_tt").click(function(){
    	$("#menu_calendar").get(0).click();
    });
    // 캘린더 로드
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('j_calendar');
    	  var calendar = new FullCalendar.Calendar(calendarEl, {

    	    locale : 'ko',
    	    initialView: 'listWeek',
    	    views: {
    	      listDay: { buttonText: 'Today' },
    	      listWeek: { buttonText: 'Week' },
    	      listMonth: { buttonText: 'Month' }
    	    },
    	    headerToolbar: {
    	      left: 'title',
    	      center: '',
    	      right: 'listDay,listWeek,listMonth'
    	    },
    	    eventClick: function(data){
    	    	$("#s_content_box").load("<%=request.getContextPath()%>/calendar/select");
    	    },
    	    events : [
				/*캘린더 조회  */
				<c:forEach items="${calList}" var="cal">
					{	
						id : "${cal.cal_no}",
						title : "${cal.cal_title}",
						start : "${cal.cal_start}",
						end : "${cal.cal_end}",
						color : "${cal.cal_color}",
						textColor : 'black'
					},
				</c:forEach>
				/*캘린더 조회(휴가)  */
				<c:forEach items="${calHoList}" var="calHo">
					{
						title : "${calHo.emp_name}님 휴가",
						start : "${calHo.ho_start}",
						end : "${calHo.ho_end}",
						color : '#ffcb6b',
						textColor : 'black'
					},
				</c:forEach>
				/*캘린더 조회(생일)  */
				<c:forEach items="${calHBDList}" var="calHBD">
					{
						title : "★${calHBD.emp_name}님 생일★",
						start : "${calHBD.hbd_start}",
						end : "${calHBD.hbd_end}",
						color : 'yellowgreen',
						textColor : 'black',
						allDay : 'allDay'
					},
				</c:forEach>
			] 
    	  });

    	  calendar.render();
    	});
    </script>
    
    <script>
    
    // 공지사항 제목 클릭 시 공지사항 페이지 로드
    $("#y_board_tt").click(function(){
    	$("#s_content_box").load("<%= request.getContextPath() %>/board/select");
    })
    
    // 게시물 리스트 [제목] 클릭 시 상세보기 페이지 진입
	$(".y_board_view").click(function(){
		var bNo = $(this).parents("tr").children(".y_td_no").text();
		console.log("bNo :" + bNo);
		$("#s_content_box").load("<%=request.getContextPath()%>/board/select?mainBoard_no=" + bNo);
	});
    
    </script>

</body>
</html>