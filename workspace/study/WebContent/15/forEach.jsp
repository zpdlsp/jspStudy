<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.function.MemberUtil"%>
<%@page import="kr.or.nextit.mber.service.MberVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		<%
			HashMap<String, Object> map = new HashMap<>();
			map.put("memID","master");
			map.put("memName","매스터");
				
		%>
		<c:set var="item" value="<%=map %>"/>
		
		<c:forEach var="m" items="${item }" >
			key = ${m.key } : value = ${m.value } <br>
		</c:forEach>
		<hr>
		<%
			List<MberVo> items = new ArrayList();
			MberVo item = new MberVo();
			item.setMemID("armadilo");
			item.setMemName("아르마딜로");
			items.add(item);

			item = new MberVo();
			item.setMemID("cat");
			item.setMemName("고양이");
			items.add(item);

			item = new MberVo();
			item.setMemID("black cow");
			item.setMemName("흑우");
			items.add(item);
			
			request.setAttribute("ds", items);
		%>
		
		<c:set var="rs" value="<%=items %>" />
		<c:forEach var="tem" items="${rs }">
			${tem.memID }
			${tem.memName }<br>
		</c:forEach>
		<hr>
		<table class="table">
			<tr>
				<th>status.first</th>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>status.last</th>
			</tr>
		<c:forEach var="mber" items="${ds }" varStatus="status">
			<tr>			
				<td>${status.first ? '시작' : '' }</td>
				<td>${status.count }</td>
				<td>${mber.memID }</td>
				<td>${mber.memName }</td>
				<td>${status.last ? '끝' : '' }</td>
			</tr>
		</c:forEach>
		</table>
		
		<%
			List<CommCodeVo> hobby = MemberUtil.getHobbyItems();
		%>
		취미 : select<br>
		<c:set var="hobbys" value="<%=hobby %>" />
		<select name="hobby" class="form-control">
			<c:forEach var="rs" items="${hobbys }">
				<option value="${rs.key }">${rs.value }</option>
			</c:forEach>
		</select>
		<br>
		<hr>
		취미 : radio<br>
		<c:forEach var="rs" items="${hobbys }" >
			<input type="radio" name="hobbyRadio" value="${rs.key }">${rs.value }<br>
		</c:forEach>
		<br>
		<hr>
		취미 : checkbox<br>
		<c:forEach var="rs" items="${hobbys }">
			<input type="checkbox" name="hobbyCheckBox" value="${rs.key }">${rs.value }<br>
		</c:forEach>		
		
	</div>
</body>
</html>