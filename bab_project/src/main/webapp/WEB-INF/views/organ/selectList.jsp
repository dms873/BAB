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
                    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="search" value="" style=" width: 150px;">
                </div>
            </nav>
            
            <!-- 조직도 -->
            <div id="tree" style="float: left;margin-top: 20px;"></div>
        </div>

    <script>
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
  
  
  $('#tree').jstree({
		'plugins': ["wholerow"],
		'core' : {
			'data' : data,
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
        
	

	/* $("#tree").jstree("open_all"); */
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
                console.log("값은222? " + text);
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