<%@page import="kr.or.nextit.function.service.impl.ComCodeServiceImpl"%>
<%@page import="kr.or.nextit.function.service.ComCodeService"%>
<%@page import="kr.or.nextit.function.MemberUtil"%>
<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	MemberUtil utils = new MemberUtil();

	ComCodeService codeService = new ComCodeServiceImpl();
	List<CommCodeVo> hobbys = codeService.getCodeList("A1");
	List<CommCodeVo> sexs = codeService.getCodeList("B2");
	
	request.setAttribute("hobbys", hobbys);
	request.setAttribute("sexs", sexs);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<h3>회원 가입</h3>
	<c:url var="actionUrl" value="/16/memInsertProc.jsp" />
	<form action="${actionUrl }" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td>아 이 디</td>
				<td><input type="text" name="userID"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPW"></td>
			</tr>
			<tr>
				<td>이    름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>성    별</td>
				<td>
					<select name="userSex" class="form-control">
					<c:forEach var="item" items="${sexs }">
						<option value="${item.key }"
						${param.userSex eq item.key ? 'selected="selected"' : '' } 
						>${item.value }</option>
					</c:forEach>					</select>
				</td>
			</tr> 
			<tr>
				<td>취    미</td>
				<td>
					<%
						String[] userHobby = request.getParameterValues("hobbys");
					%>
					<c:set var="hobbyItem" value="<%=userHobby %>" />
					<c:forEach var="item" items="${hobbys }">	
						<input type="checkbox" name="userHobby" value="${item.key }"
							<c:forEach var="chkItem" items="${hobbyItem }">	
								${chkItem eq item.key ?'checked="checked"' : ''}
							</c:forEach> 
						>${item.value }<br>
					</c:forEach>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">가    입</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>	
	</div>
</body>
</html>