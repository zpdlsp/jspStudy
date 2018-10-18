<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키 Info</title>
</head>
<body>

	<%
	// 쿠키 생성
	Cookie createCookie = new Cookie("test",URLEncoder.encode("안녕하세요","UTF-8"));
	//createCookie.setDomain("127.0.0.1");
	createCookie.setPath("/");
	createCookie.setMaxAge(20);
	response.addCookie(createCookie);
	
	Cookie createCookie2 = new Cookie("review",URLEncoder.encode("review에서만 보임","UTF-8"));
	//createCookie2.setDomain("127.0.0.1");
	createCookie2.setPath("/");
	//createCookie2.setPath("/review");
	createCookie2.setMaxAge(5);
	response.addCookie(createCookie2);	
	
	// 생성된 쿠키 정보
	Cookie[] cookie = request.getCookies();
	
	if(cookie != null){
		for(Cookie cok : cookie){
			out.println("getName() : " + cok.getName() + "<br>" );
			out.println("getValue() : " + cok.getValue() + "<br>" );
			out.println("URLDecoder.decode(getValue()) : " 
						+ URLDecoder.decode(cok.getValue(),"UTF-8") + "<br>" );
			out.println("getComment() : " + cok.getComment() + "<br>" );
			out.println("getDomain() : " + cok.getDomain() + "<br>" );
			out.println("getMaxAge() : " + cok.getMaxAge() + "<br>" );
			out.println("getPath() : " + cok.getPath() + "<br>" );
			out.println("getVersion() : " + cok.getVersion() + "<br>" );
			out.println("getSecure() : " + cok.getSecure() + "<br>" );
			out.println("======================================== <br>" );
		}
	}
	
	%>

</body>
</html>