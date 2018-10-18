<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/inc/lib.jsp"></c:import>
</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
	<br><br>
		<form action="/servletTest" method="get">
			<input type="text" name="test" >
			<input type="text" name="userName" >
			<button type="submit">servlet Test doGet</button>
		</form>
	<br>
		<form action="/servletTest" method="post">
			<input type="text" name="test" >
			<input type="text" name="userName" >
			<button type="submit">servlet Test doPost</button>
		</form>
		
	
	</div>
</body>
</html>