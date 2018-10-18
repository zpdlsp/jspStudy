<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@page import="kr.or.nextit.login.service.LoginVo"%>
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

<%
	LoginVo loginVo = new LoginVo();
	loginVo.setMessage("메세지");
	
	String userID = request.getParameter("userID");
	loginVo.setUserID(userID);	
	loginVo.setUserPW(request.getParameter("userPW"));
	loginVo.setUserRemember(request.getParameter("userRemember"));

%>
<pre>
	아 이 디 : <%=loginVo.getUserID() %>
	비밀번호 : <%=loginVo.getUserPW() %>
	저장유무 : <%=loginVo.getUserRemember() %>
</pre>

<jsp:useBean id="loginInfo" class="kr.or.nextit.login.service.LoginVo" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="loginInfo"/>
<%-- <jsp:setProperty property="userID" name="loginInfo"/> --%>
<%-- <jsp:setProperty property="userPW" name="loginInfo"/> --%>
<%-- <jsp:setProperty property="userRemember" name="loginInfo"/> --%>
<jsp:setProperty property="userEmail" name="loginInfo" value="master@nextit.or.kr"/>

<pre>
	아 이 디 : ${loginInfo.userID }
	비밀번호 : ${loginInfo.userPW }
	저장유무 : ${loginInfo.userRemember == 'Y' ? '아이디 저장' : '저장 안됨' }
	이 메 일 : ${loginInfo.userEmail }
</pre>

<jsp:setProperty property="userID" name="loginInfo" value="master"/>

<pre>
	아 이 디 : <jsp:getProperty property="userID" name="loginInfo" />
	비밀번호 : <jsp:getProperty property="userPW" name="loginInfo"/>
	저장유무 : <jsp:getProperty property="userRemember" name="loginInfo"/>
	이 메 일 : <jsp:getProperty property="userEmail" name="loginInfo"/>
</pre>

<%
	CookieBox cookieBox = new CookieBox(request);
	String userRemember = request.getParameter("userRemember");
	
	if("Y".equals(userRemember)){
		// Cookie cID = CookieBox.createCookie("userID",request.getParameter("userID"), "/", 60);
		Cookie cID = CookieBox.createCookie("userID",userID);
		response.addCookie(cID);
		Cookie cRemember = CookieBox.createCookie("userRemember", userRemember);
		response.addCookie(cRemember);
	} else {
		Cookie cID = CookieBox.createCookie("userID","", "/", 0);
		response.addCookie(cID);
		Cookie cRemember = CookieBox.createCookie("userRemember","", "/", 0);
		response.addCookie(cRemember);
	}
	
	response.sendRedirect(request.getContextPath() + "/09/loginForm.jsp"); 
%>


</body>
</html>