<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
t1 변수값 : <%=request.getParameter("t1")%> <br>
t2 변수값 : <%=request.getParameter("t2")%> <br>

<%
	int t1 = Integer.parseInt(request.getParameter("t1"));
	int t2 = Integer.parseInt(request.getParameter("t2"));
	int dan = t1 * t2;
%>

<%=t1 %> * <%=t2 %> = <%=dan %> <br>

<a href="<%=request.getContextPath()%>/01/dan3.jsp">돌아가기</a>

</body>
</html>