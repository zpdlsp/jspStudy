<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>

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
	<br><br><br>
	<h4>Exception Error(모든에러를 잡아옴)</h4>
	<pre>
		에러타입(class) : <%=exception.getClass().getName() %>
		에러 메세지 : <%=exception.getMessage() %>
	</pre>
	
			
	
	</div>
</body>
</html>