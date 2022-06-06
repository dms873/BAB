<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div>
	<c:forEach items="${selectEmp }" var="i">
		<div>이름 : ${i.emp_name }</div>
		<div>전화번호 : ${i.emp_phone }</div>
		<div>이메일 : ${i.emp_email }</div>
		<div>주소 : ${i.emp_address }</div>
	</c:forEach>
</div>


</body>
</html>
