<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키생성 전체 적용하는 쿠키<br>
<a href="<%=request.getContextPath() %>/10/viewCookie.jsp" target="_blank">
전체 보이는 쿠키 이동</a><br>
<%
	String[] domains = {"127.0.0.1","localhost"};

	for(String domain : domains){

		Cookie cookiAll = new Cookie("title",URLEncoder.encode("하잇하잇"));
		cookiAll.setDomain(domain);
		cookiAll.setPath("/");
		cookiAll.setMaxAge(20);
	
		response.addCookie(cookiAll);
	}
%>

쿠키생성 review 적용하는 쿠키<br>
<a href="<%=request.getContextPath() %>/review/viewCookie.jsp" target="_blank">
review 보이는 쿠키 이동</a><br>

<%
	Cookie cookiItem = new Cookie("review",URLEncoder.encode("review를 쓰시면"));
	cookiItem.setDomain("127.0.0.1");
	cookiItem.setPath("/review");
	cookiItem.setMaxAge(20);

	response.addCookie(cookiItem);
%>

쿠키 util(API) 활용<br>

<a href="<%=request.getContextPath() %>/10/viewCookieBox.jsp" target="_blank">
view CookieBox 보이는 쿠키 이동</a><br>

<%
	CookieBox cookieBox = new CookieBox(request);
	Cookie userCookie = cookieBox.createCookie("userCookie", "고길동");
	response.addCookie(userCookie);
	
	Cookie userCookie2 = CookieBox.createCookie("userCookie2", "가즈아", "/", 20);
	response.addCookie(userCookie2);
	
	response.addCookie(CookieBox.createCookie("userCookie3", "수고", 10));
	
%>

</body>
</html>