<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>조직도 조회</title> -->
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
                    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="search" value="" style=" width: 100px;">
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
				$('#tree').jstree(true).search(text);
			});
		} (jQuery))
	});
    </script>

</body>
</html>