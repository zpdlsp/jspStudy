<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memID = request.getParameter("memID");

MberService mber = new MberServiceImpl();
boolean result = mber.deleteMemberItem(memID);

StringBuilder url = new StringBuilder();
url.append(request.getContextPath());
url.append("/14/memberListForm.jsp");

if(result){
	response.sendRedirect(url.toString());
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>