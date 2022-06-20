<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <div style="float:left;border: 1px solid lightgray;width: 40%;height: 500px;padding: 20px;border-radius: 10px;overflow: auto;">
            <!-- 검색 -->
            <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
                <div class="container-fluid">
                    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="search" value="" style=" width: 130px;">
                </div>
            </nav>
            
            <!-- 조직도 -->
            <div id="tree" style="float: left;margin-top: 20px;"></div>
        </div>

    <script>
     // load가 됐을 때 DB 다녀오기
        $(function() {
			let json = new Array();
			// 최상위부모
			json.push({
		            "id": "1",
		            "parent": "#",
		            "text": "BAB",
		            "icon": "https://www.jstree.com/static/3.2.1/assets/images/tree_icon.png" //root 아이콘 지정
				},
            );
			// 부서 호출
            $.ajax({
            	url: '<%=request.getContextPath()%>/organ/selectdept'
          		, type: 'post'
          		, dataType: 'json'
          		, success: function(result) {
          			for(var i = 0; i < result.length; i++) {
          				json.push({
          					"id": result[i].dept_code,
          					"parent": "1",
          					"text": result[i].dept_name
         					})
          			}
          			console.log("결과 담김 ? : " + JSON.stringify(json));
          		}
            });
			// 배열+객체 형태로 받아온 값을 배열만 벗기기
            json.flat();
            
            // 사원 호출
        	$.ajax({
        		url: '<%=request.getContextPath()%>/organ/select'
        		, type: 'post'
        		, dataType: 'json'
        		, success: function(result) {
//         			console.log("성공 : " + result);
        			console.log(result.length);
      					// 사원 정보
	        			for(var i = 0; i<result.length; i++){
	        				json.push({
        			            "id": result[i].emp_no,
        			            "parent": result[i].dept_code,
        			            "text": result[i].emp_name + ' ' + result[i].job_title  + '(' +  result[i].emp_no + ')',
        			            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
        			            });
       					}
      					fnCreateJstree(json);
	        			console.log(json);
        			
        		}
        		, error: function() {
        			alert("실패 !");
        		}
        	});
        });
        
        // jstree 만드는 함수
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

</body>
</html>