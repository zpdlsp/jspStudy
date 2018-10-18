<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.nextit.member.*" %>
<%@ page import="kr.or.nextit.member.impl.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	String userName = request.getParameter("userName");
	String userHP = request.getParameter("userHP");
	String userSex = request.getParameter("userSex");
	String[] userHobby = request.getParameterValues("userHobby");
	String userEmail = request.getParameter("userEmail");
	
	for(String hobby : userHobby){
		out.print(hobby);	//코드값으로
	}
	
	
	HashMap<String, Object> params = new HashMap();
	params.put("userID", userID);
	params.put("userPW", userPW);
	params.put("userName", userName);
	params.put("userHP", userHP);
	params.put("userSex", userSex);
	params.put("userHobby", userHobby);
	params.put("userEmail", userEmail);
	
	MemberService memService = new MemberServiceImpl();
	memService.insertUserInfo(params);

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<pre>
el tag
아 이 디 ${param.userID }
이    름 ${param.userName }
이 메 일 ${param.userEmail }
</pre>

<pre>
request
아 이 디 <%=request.getParameter("userID") %>
이    름 <%=request.getParameter("userName") %>
이 메 일 <%=request.getParameter("userEmail") %> 
</pre>

</body>
</html>