<%@page import="kh.spring.bab.employee.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.y_hover_event {
	cursor: pointer;
}
</style>
<body>
		<%
 		String email = null;
		Employee vo = (Employee) request.getSession().getAttribute("login");
		
		email = vo.getEmp_email();
		
		%>
		
		<input type="hidden" id="y_emp_email" value = "<%= email %>">
		
	<section>
        <article style="float: left;">
            <div style="width: 150px; height: 1000px; margin-top: 25px;margin-left: 10px;">
                <button id="y_write_btn" class="btn btn-primary btn-lg">메일 쓰기</button>
                

                <div style="margin-top: 30px; font-weight: bold; font-size: 1.2em; color: rgb(1, 3, 38);">메일함</div>
                <div id="y_rcv_mail" class="y_hover_event" style="display: inline-block; margin-right: 10px;">받은 메일함</div><span style="font-weight: bold; color: red;">2</span>
                <div id="y_snd_mail" class="y_hover_event" style="display: inline-block; margin-right: 10px;">보낸 메일함</div><span style="font-weight: bold; color: red;">2</span>
            </div>
        </article>  
        <article style="float: left;">
			<div
				style="border: 1px solid lightgray; height: 1000px; width: 1150px; margin-top: 20px; margin-left: 10px; border-radius: 10px; padding: 20px;"
				id="y_content_box">

			
			</div>
		</article>    
    </section>
    
    <script>
    
    // 탭 메뉴 클릭 후 페이지 로드 시 선실행
    $(function() {
    	
    	var email = $("#y_emp_email").val()
    	$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectRcv",{email: email});
        $("#y_rcv_mail").css('color', 'rgb(5, 131, 242)');
    });
    
    
    $("#y_write_btn").click(function(){
    	$("#y_content_box").load("<%=request.getContextPath()%>/mail/insert");
    });
    
    // 받은 메일함 클릭 시 이동
    $("#y_rcv_mail").click(function(){
    	var email = $("#y_emp_email").val()
    	$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectRcv",{email: email});
	});
    
	// 보낸 메일함 클릭 시 이동
	$("#y_snd_mail").click(function() {
		var email = $("#y_emp_email").val()
		$("#y_content_box").load("<%=request.getContextPath()%>/mail/selectSnd",{email: email});
    });
    
 	// 서브메뉴 클릭 시 색깔변경
    $(".y_hover_event").click(function() {
        $(".y_hover_event").css('color', 'black');
        $(this).css('color', 'rgb(5, 131, 242)');
    });
    </script>
</body>
</html>