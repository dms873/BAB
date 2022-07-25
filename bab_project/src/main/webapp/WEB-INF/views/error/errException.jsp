<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>에러페이지</title>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div style="text-align: center;margin-top: 100px;border: 1px solid lightgray;padding: 70px;border-radius: 10px;">
			<div>
				<img alt="error" src="https://media.discordapp.net/attachments/692994434526085184/1000933831903293520/unknown.png">
			</div>
			<div style="margin-top: 100px;">
				<button class="btn btn-danger btn-lg" onclick="location.href='<%=request.getContextPath()%>/main'">BAB 메인페이지로 이동</button>
			</div>
		</div>
	</div>
</body>
</html>