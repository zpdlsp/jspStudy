<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>O 형</title>
</head>
<body>
<pre>
이름  : ${param.userName }
취미  : <%
		String[] hobbys = request.getParameterValues("userHobby");
		for (String hobby : hobbys) {
			out.println(hobby);
		}
		%>
		
<%
	List<String> hello = (List<String>)request.getAttribute("hello");
	if(hello != null){
	for(String value : hello){
		out.println(value);
	}
	} else {
		out.println("데이터가 없습니다.");
	}
%>
</pre>
O 형
</body>
</html>