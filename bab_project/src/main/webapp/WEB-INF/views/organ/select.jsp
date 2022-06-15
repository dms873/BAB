<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- jsTree js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
   	<!-- jsTree css -->
    <link rel="stylesheet" href="https://www.orangehilldev.com/jstree-bootstrap-theme/demo/assets/dist/themes/proton/style.css" />
<meta charset="UTF-8">
<title>조직도 조회</title>
<style>
        #s_organ_table tr th {
            width: 100px;
            padding: 5px 0;
            font-size: 1.1em;
        }

        #s_organ_table {
            margin-top: 50px;
        }

        #s_organ_table tr button {
            margin-left: 10px;
            font-size: 0.9em;
        }

        #s_organ_table .s_organ_td {
            width: 200px;
        }
    </style>
</head>
<body>

	<c:forEach items="${selectOrganList }" var="i">
		<div class="emp_name" style="display: none;">
			${i.emp_name }
		</div>
		<div class="dept_name_or" style="display: none;">
			${i.dept_name }
		</div>
		<div class="job_title_or" style="display: none;">
			${i.job_title }
		</div>
	</c:forEach>
	<c:forEach items="${selectDeptList }" var="i">
		<div class="dept_code" style="display: none;">
			${i.dept_code }
		</div>
		<div class="dept_name" style="display: none;">
			${i.dept_name }
		</div>
	</c:forEach>
	<c:forEach items="${selectJobList }" var="i">
		<div class="job_title" style="display: none;">
			${i.job_title }
		</div>
	</c:forEach>

	<div style="border: 1px solid lightgray;height: 1000px;width: 1300px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" >
        <div style="float:left;border: 1px solid lightgray;width: 40%;height: 955px;padding: 20px;border-radius: 10px;overflow: auto;">
            <!-- 검색 -->
            <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
                <div class="container-fluid">
                    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="search" value="">
                </div>
            </nav>
            
            <!-- 조직도 -->
            <div id="tree" style="float: left;margin-top: 20px;"></div>
        </div>

        <div style="float:left;border-top: 2px solid grey;border-bottom: 2px solid grey;margin-left: 20px;padding: 30px;width: 57%;height: 950px;" id="s_dt_info_content">
            <div style="color: grey;text-align: center;line-height: 800px;">조직도에서 사원을 선택하시면 상세조회가 가능합니다.</div>
        </div>
    </div>

    <script>
   		var arrName = [];
    	for(var i = 0; i < $(".emp_name").length; i++) {
    		var textName = document.getElementsByClassName('emp_name')[i].textContent.trim()
    		var text1 = document.getElementsByClassName('dept_name_or')[i].textContent.trim()
    		var text2 = document.getElementsByClassName('job_title_or')[i].textContent.trim()
    		arrName.push(textName);
    		console.log("이름 : " + arrName[i]);
    		console.log("부서명 : " + text1);
    		console.log("직위명 : " + text2);
    		console.log("=======================");
   		}
    	
    	var arrDeptCode = [];
    	for(var i = 0; i < $(".dept_code").length; i++) {
    		var textDeptCode = document.getElementsByClassName('dept_code')[i].textContent.trim();
    		arrDeptCode.push(textDeptCode);
    	}
    	console.log([...arrDeptCode]);
    	
    	var arrDeptName = [];
    	for(var i = 0; i < $(".dept_name").length; i++) {
    		var textDeptName = document.getElementsByClassName('dept_name')[i].textContent.trim();
    		arrDeptName.push(textDeptName);
    	}
    	console.log([...arrDeptName]);
    	
    	var arrJob = [];
    	for(var i = 0; i < $(".job_title").length; i++) {
    		var textJob = document.getElementsByClassName('job_title')[i].textContent.trim();
    		arrJob.push(textJob);
    	}
    	console.log([...arrJob]);
    	
    	
    	
    
        var data = [
            {
            "id": "1",
            "parent": "#",
            "text": "BAB",
            "icon": "https://www.jstree.com/static/3.2.1/assets/images/tree_icon.png" //root 아이콘 지정
            },
            {
            "id": "2",
            "parent": "1",
            "text": "회계팀"
            },
            {
            "id": "3",
            "parent": "1",
            "text": "인사팀"
            },
            {
            "id": "4",
            "parent": "1",
            "text": "기획팀"
            },
            {
            "id": "5",
            "parent": "1",
            "text": "개발팀"
            },
            {
            "id": "6",
            "parent": "1",
            "text": "영업팀"
            },
            {
            "id": "7",
            "parent": "2",
            "text": "손은진 (차장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "8",
            "parent": "2",
            "text": "홍길순 (사원)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "9",
            "parent": "4",
            "text": "장혜미 (과장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "10",
            "parent": "5",
            "text": "이해람 (사원)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "11",
            "parent": "5",
            "text": "서지훈 (사원)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "12",
            "parent": "6",
            "text": "윤영원 (대리)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "13",
            "parent": "6",
            "text": "홍길동 (사원)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "14",
            "parent": "3",
            "text": "박정환 (차장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "15",
            "parent": "3",
            "text": "서언주 (부장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "16",
            "parent": "3",
            "text": "박자민 (이사)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "17",
            "parent": "1",
            "text": "임원"
            },
            {
            "id": "18",
            "parent": "17",
            "text": "유재석 (사장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
            {
            "id": "19",
            "parent": "17",
            "text": "유희열 (부사장)",
            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
            },
        ]
        
        // data.push(arrDeptName.map((v, i) => ({text:v, id:i+2, parent:1})));
        /* for(var i = 0; i < arrDeptName.length; i++) {
            data.push({"id": String(i+2), "text": arrDeptName[i]});
        } */
    	
    	console.log("data: " + JSON.stringify(data));
  
        // load가 됐을 때 DB 다녀오기
        $(function() {
        	$.ajax({
        		url: '<%=request.getContextPath()%>/organ/select'
        		, type: 'post'
        		, dataType: 'json'
        		, success: function(result) {
//         			console.log("성공 : " + result);
        			console.log(result.length);
	      				let json = new Array();
	      					// 최상위부모
	      					json.push({
	      				            "id": "1",
	      				            "parent": "#",
	      				            "text": "BAB",
	      				            "icon": "https://www.jstree.com/static/3.2.1/assets/images/tree_icon.png" //root 아이콘 지정
		      					},
		      					{
		      			            "id": "D10",
		      			            "parent": "1",
		      			            "text": "개발팀"
	      			            },
	      			          	{
		      			            "id": "D20",
		      			            "parent": "1",
		      			            "text": "기획팀"
	      			            },
	      			          	{
		      			            "id": "D30",
		      			            "parent": "1",
		      			            "text": "영업팀"
	      			            },
	      			          	{
		      			            "id": "D40",
		      			            "parent": "1",
		      			            "text": "인사팀"
	      			            },
	      			          	{
		      			            "id": "D50",
		      			            "parent": "1",
		      			            "text": "임원"
	      			            },
	      			          	{
		      			            "id": "D60",
		      			            "parent": "1",
		      			            "text": "회계팀"
	      			            },
      			            );
	      					<%-- $.ajax({
	      						url:'<%= request.getContextPath()%>/organ/selectDept',
	      						
	      					}) --%>
	      					
	      					// 부서 정보
	      					/* for(var i=0; i<result.length; i++){
	      						json.push({
	      								// 문제는 result의 length가 29임 (직원 명수), for문 조건이 안맞음
	      					            "id": "result[i].dept_code",
	      					            "parent": "1",
	      					            "text": "result[i].dept_name"
	      						})
	      					} */
	      					
	      					// 사원 정보
		        			for(var i = 0; i<result.length; i++){
		        				json.push({
	        			            "id": result[i].emp_no,
	        			            "parent": result[i].dept_code,
	        			            "text": result[i].emp_name + ' ' + result[i].job_title,
	        			            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
	        			            });
        					}
	      					fnCreateJstree(json);
		        			console.log(json);
        			
        		}
        		, error: function() {
        			alert("응~못갔다왔어");
        		}
        	});
        });
        
        function fnCreateJstree(jsonData) {
		  $('#tree').jstree({
				'plugins': ["wholerow"],
				'core' : {
					'data' : jsonData,
					'state': {
						'opened' : true
					},
					'themes' : {
						'name' : 'proton',
						'responsive' : true
					}
				},
		        'plugins' : ["search"],
		        "search": {
		        	"case_sensitive": false,
		        	"show_only_matches": true
		        }
		
			});
        }
	</script>
	
	<script>
	$(function() {
		(function($) {
			$("#search").keyup(function() {
				var text = $("#search").val();
				console.log(text + " 검색되잖아");
				$('#tree').jstree(true).search(text);
			});
		} (jQuery))
	});
    </script>

	

    <script>
        $("#tree").click(function() {
            $('ul li a').click(function() {
                var text = $(this).text();
                console.log("값은? " + text);
                if(text.match('^손은진')) {
                    $("#s_dt_info_content").load("<%=request.getContextPath()%>/organ/selectInfo");
                } else {
                    $("#s_dt_info_content").html('<div style="color: grey;text-align: center;line-height: 800px;">조직도에서 사원을 선택하시면 상세조회가 가능합니다.</div>');
                }
            });
        })
    </script>

</body>
</html>