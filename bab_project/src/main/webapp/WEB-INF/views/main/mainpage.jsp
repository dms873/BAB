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
	<!-- 조직도 -->
    <!-- jsTree js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <!-- jsTree css -->
    <link rel="stylesheet" href="https://www.orangehilldev.com/jstree-bootstrap-theme/demo/assets/dist/themes/proton/style.css" />
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<!-- fullcalendar CDN 추가 혜미-220612 -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css" rel="stylesheet"/>
    <!-- datepicker CDN 추가 혜미-220612 -->
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <!-- 공통 reset.css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<meta charset="UTF-8">
<title>메인페이지</title>
    <!-- 메뉴 호버 시 -->
    <style>
        .s_menu:hover {
            /* border: 1px solid !important; */
            background-color: #0583F2;
        }
        
        .toast-info {
        	background-color: #2F96B4 !important;
        }
    </style>
    
    
</head>
<body>

	

	<header>
        <div style="width: 1500px;margin: 0 auto;">
            <div style="margin-top: 30px;height: 100px;border-bottom: 1px solid silver;">
                <div style="float: left;padding: 10px;">
                    <a href="#" onclick="location.reload()">
                        <img src="https://cdn.discordapp.com/attachments/692994434526085184/981216631432818758/2-3.png" style="width: 150px;">
                    </a>
                </div>
                <div style="float: right;">
                    <div style="float: left; line-height: 70px;">
                    <!-- data-bs-toggle="modal" data-bs-target="#exampleModal" -->
                        <i id="s_bell_btn" class="bi bi-bell position-relative" style="cursor:pointer;">
                            <!-- 알람 배지 -->
                            <span
                                class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger s_badge">
                                2
                            </span>
                        </i>
                    </div>
                    <div style="float: right; width: 200px;">
                        <div>
                            <div style="float:left; margin:0 25px;">
                                <img src="https://media.discordapp.net/attachments/692994434526085184/981215903570092132/unknown.png"
                                    style="width: 50px;">
                                <div style="font-size: .8em;">손은진님</div>
                            </div>
                            <div style="line-height: 60px;">
                                <button type="button" class="btn btn-secondary" style="font-size: .8em;">로그아웃</button>
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
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_msg">쪽지</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_chat">채팅</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white s_menu" aria-current="page" id="menu_board">공지사항</a>
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
                    <div style="border: 1px solid lightgray; border-radius: 10px;height: 350px;margin-top: 20px;margin-left: 10px;width: 650px; float: left; padding: 20px;">
                        <div style="text-align: center; font-weight: bold; font-size: 1.2em; margin-bottom: 20px;">근무시간</div>
                        <div style="text-align: center;">
                            <img src="https://media.discordapp.net/attachments/692994434526085184/981241711105806396/unknown.png" style="width: 350px;">
                        </div>
                    </div>
                    <div style="border: 1px solid lightgray; border-radius: 10px;height: 350px;margin-top: 20px;margin-left: 10px;width: 650px; float: right; padding: 20px;">
                        <div style="text-align: center; font-weight: bold; font-size: 1.2em; margin-bottom: 20px;">캘린더</div>
                        <div style="text-align: center;">
                            <img src="https://media.discordapp.net/attachments/692994434526085184/981241672392409128/unknown.png" style="width: 450px;">
                        </div>
                    </div>
                </div>
                <div style="border: 1px solid lightgray; border-radius: 10px;height: 300px;margin-top: 30px;margin-left: 10px; padding: 20px;">
                    <div style="text-align: center; font-weight: bold; font-size: 1.2em; margin-bottom: 20px;">전자 결재 대기</div>
                    <table class="table" style="text-align: center;">
                        <thead>
                          <tr>
                            <th scope="col">NO</th>
                            <th scope="col">기안일</th>
                            <th scope="col">결재양식</th>
                            <th scope="col">제목</th>
                            <th scope="col">첨부</th>
                            <th scope="col">결재상태</th>
                          </tr>
                        </thead>
                        <tbody style="vertical-align: middle">
                          <tr>
                            <th scope="row">1</th>
                            <td>2022/05/26</td>
                            <td>지출결의서</td>
                            <td>신규 직원채용 명함 신청의 건</td>
                            <td><i class="bi bi-paperclip"></i></td>
                            <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
                          </tr>
                          <tr>
                            <th scope="row">2</th>
                            <td>2022/05/26</td>
                            <td>휴가신청서</td>
                            <td>개인 연차 신청의 건</td>
                            <td></td>
                            <td><button class="btn btn-success" style="font-size: .8em; width: 77px;">진행중</button></td>
                          </tr>
                          <tr>
                            <th scope="row">3</th>
                            <td>2022/05/26</td>
                            <td>휴가신청서</td>
                            <td>개인 연차 신청의 건</td>
                            <td></td>
                            <td><button class="btn btn-warning" style="font-size: .8em;">결재대기</button></td>
                          </tr>
                        </tbody>
                      </table>
                </div>
                <div style="border: 1px solid lightgray; border-radius: 10px;height: 300px;margin-top: 30px;margin-left: 10px; padding: 20px;">
                    <div style="text-align: center; font-weight: bold; font-size: 1.2em; margin-bottom: 20px;">공지사항</div>
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
                          <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                          </tr>
                          <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                          </tr>
                          <tr>
                            <th scope="row">3</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                          </tr>
                          <tr>
                            <th scope="row">4</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                          </tr>
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
        
        $("#menu_board").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/board/select");
        });
        /*캘린더 추가 혜미-220612  */
        $("#menu_calendar").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/calendar/select");
        });
        /*내정보수정 추가 혜미-220612  */
        $("#menu_info").click(function() {
            $("#s_content_box").load("<%=request.getContextPath()%>/info/main");
        });
    </script>
    
    <script>
    	$("#s_bell_btn").click(function() {
    		
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
    				  "timeOut": "0",
    				  "extendedTimeOut": "1000",
    				  "showEasing": "swing",
    				  "hideEasing": "linear",
    				  "showMethod": "fadeIn",
    				  "hideMethod": "fadeOut"
    				}
    		
    		toastr.info("결재 대기가 2건이 있습니다.", "알람");
    	});
    </script>

    <script>
        // 알람 아이콘 누를 때마다 색깔 변경, 배지 사라짐
        var i = 0;
        $('#s_bell_btn').on('click', function () {
            if (i == 0) {
                $(this).attr('class', 'bi bi-bell-fill');
                $('.s_badge').remove();
                i++;
            } else if (i == 1) {
                $(this).attr('class', 'bi bi-bell');
                i--;
            }
        });

    </script>

    <script>
        // 메뉴에서 클릭했을 때
        $(".s_menu").click(function() {
             $(".s_menu").removeClass("active");
             $(this).addClass("active");
         });
    </script>
    

</body>
</html>