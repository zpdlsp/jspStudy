<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	request.setAttribute("name", "ㅇㅇ");
	request.setAttribute("name1", 1);
	
	HashMap<String, Object> item = new HashMap();
	item.put("test","문자열");
	item.put("Integer",88);
	
	request.setAttribute("item", item);
%>
<pre>
${nextit }
메뉴를 구성해주세요
<%=request.getParameter("test") %>

el tag : ${param.test}
request.setAttribute el tag : ${name}
request.setAttribute el tag : ${name1}

request.setAttribute Map : ${item.test}
request.setAttribute Map : ${item.Integer}
</pre>