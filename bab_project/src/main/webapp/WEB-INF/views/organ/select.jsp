<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- SweetAlert -->
<style>
	/*모달창  */
	.swal-modal {
		background-color: white;
		border: 3px solid white;
	}
	/*ok버튼  */
	.swal-button--danger {
		background-color: #0583F2;
		color: white;
	}
	/*cancel버튼  */
	.swal-button--cancel {
		background-color: red;
		color: white;
	}
	/*ok버튼  */
	.swal-button--confirm {
		background-color: #0583F2;
		color: white;
	}
	/*아이콘 테두리  */
	.swal-icon--info {
		border-color: #0583F2;
	}
	/*아이콘 i 윗부분  */
	.swal-icon--info:after {
		background-color: #0583F2;
	}
	/*아이콘 i 아랫부분  */
	.swal-icon--info:before {
		background-color: #0583F2;
	}
	/*타이틀  */
	.swal-title {
		font-size: 20px;
		color: black;
	}
	/*텍스트  */
	.swal-text {
		color: black;
	}
	
	/* 스크롤바 디자인 */
	.s_scroll::-webkit-scrollbar {
    	width: 10px;  /* 스크롤바의 너비 */
	}
	
	.s_scroll::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #34343482; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	.s_scroll::-webkit-scrollbar-track{
	    background: #4747471a;  /*스크롤바 뒷 배경 색상*/
	}
</style>
</head>
<body>

	<div style="border: 1px solid lightgray;height: 1000px;width: 1300px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" >
        <div class="s_scroll" style="float:left;border: 1px solid lightgray;width: 40%;height: 955px;padding: 20px;border-radius: 10px;overflow: auto;">
            <!-- 검색 -->
            <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px; width: 150px;">
                <div class="container-fluid">
                    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="search" value="" style=" width: 150px;">
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
        			            // emp_no를 띄운 이유 : 상세 조회 시 emp_no를 넘기려고
        			            "text": result[i].emp_name + ' ' + result[i].job_title  + '(' +  result[i].emp_no + ')',
        			            "icon": "https://media.discordapp.net/attachments/692994434526085184/983044903678398604/5e8f55608965fadc.png"
        			            });
       					}
      					fnCreateJstree(json);
	        			
	        			// 조직도의 사원정보 상세보기
	        			$("#tree").click(function() {
	        		        $('ul li a').click(function() {
        		    			var emp_no = $(this).text().slice(-8, $(this).text().length - 1);
	        					$.ajax({
	        						url: '<%=request.getContextPath()%>/organ/selectdetailinfo'
	        						, data: {"emp_no":emp_no}
	        						, type: 'post'
	        						, success: function(result) {
	        							// 결과 값이 selectInfo.jsp여서 content자리를 html(result)로 바꿈!
	        							$("#s_dt_info_content").html(result);
	        						}
	        					});
	        				})
	        		    })
        		}	
        		, error: function() {
        			swal({
	                    title: "",
	                    text: "실패하였습니다.",
	                    icon: "error",
	                    closeOnClickOutside: false,
	                    closeOnEsc: false
	                });
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
		// 검색
		$("#search").keyup(function() {
			var text = $("#search").val();
			$('#tree').jstree(true).search(text);
		});
    </script>

</body>
</html>