<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		${param.result } 
		${param.message } 
		안녕하세요~~ <br>
		request.getContextPath() : <%=request.getContextPath() %>
		<%
		String name = "susan";
		%>
		<br> <br>
		이름은 무엇?<%=name%>
		<br> <br> 
		진짜 이름 <% out.print(name); %>
		<br>
		<% out.print(String.format("버퍼사이즈 %d", out.getRemaining())); %>
	</div>
</body>
</html>