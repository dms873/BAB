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
<meta charset="UTF-8">
<title>전자결재</title>
	<style>
        .s_hover_event {
            cursor: pointer;
        }
    </style>
</head>
<body>

	<section>
        <article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
                <button class="btn btn-primary btn-lg">새 결재 진행</button>

                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">결재하기</div>
                <div style="display: inline-block; margin-right: 10px;" id="s_before_doc" class="s_hover_event">결재 대기 문서</div><span style="font-weight: bold; color: red;">2</span>
                <div style="display: inline-block; margin-right: 10px;" id="s_receipt_doc" class="s_hover_event">결재 수신 문서</div><span style="font-weight: bold; color: red;">2</span>

                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">문서함</div>
                <div id="s_insert_doc" class="s_hover_event">기안 문서함</div>
                <div id="s_result_doc" class="s_hover_event">결재 문서함</div>
                <div id="s_reference_doc" class="s_hover_event">참조 문서함</div>
            </div>
        </article>  
        <article style="float: left;" id="s_eap_content_box">
            <div style="border: 1px solid lightgray;height: 1000px;width: 1150px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_eap_content">
                전자결재 내용 채우세요 !
            </div>
        </article>    
    </section>
    
    <script>
        $("#s_before_doc").click(function() {
            $("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/beforedoc");
        });

        $("#s_receipt_doc").click(function() {
            $("#s_eap_content_box").load("<%=request.getContextPath()%>/eap/receiptdoc");
        });

        // 서브메뉴 클릭 시 색깔변경
        $(".s_hover_event").click(function() {
            $(".s_hover_event").css('color', 'black');
            $(this).css('color', 'rgb(5, 131, 242)');
        });
    </script>

</body>
</html>