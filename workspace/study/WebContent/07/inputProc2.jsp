<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body>
<pre>
<%
	List<String> hello = new ArrayList();	
	hello.add("안녕하세요");
	hello.add("하이하이");
	hello.add("이름이 뭐에요?");
	
	String blood = request.getParameter("userBlood");
	
	switch (blood){
	case "A" :
		hello.add("A형입니다.");
	break;
	case "B" :
		hello.add("B형입니다.");
		break;
	case "O" : 
		hello.add("O형입니다.");
		break;
	case "AB" :
		hello.add("AB형입니다.");
		break;
	default :
		hello.add("모르는 혈액형");
	}
	
	request.setAttribute("hello", hello);

	StringBuilder path = new StringBuilder();		// 문자들을 합쳐 하나의 문자열로

	path.append(request.getContextPath());
	path.append("/07/");
	path.append(request.getParameter("userBlood"));
	path.append(".jsp");

	out.println(path.toString());
	// response.sendRedirect(path.toString());		// URL을 바꿔주는 것
%>

<!-- URL은 바뀌지 않고, 파일을 가져와 해석해 보여줌 -->			
<jsp:forward page="<%=path.toString() %>"></jsp:forward>	
			
			
</pre>
</body>
</html>