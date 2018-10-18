<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 (session)</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/inc/navbar.jsp"></jsp:include>

<pre>
<%
	LoginVo loginInfo = (LoginVo) request.getSession().getAttribute("loginInfo");

	if (loginInfo != null) {
		out.println(loginInfo.getUserName());
		out.println(loginInfo.getUserID());
		out.println(loginInfo.getUserPW());
		out.println(loginInfo.getUserEmail());
		out.println(loginInfo.getMessage());
	}
%>
</pre>

<% if(loginInfo == null || !loginInfo.isResult()) { %>
	<form action="<%=request.getContextPath()%>/11/loginProc.jsp" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userID" ></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPW"></td>
				</tr>
				<tr>
					<td>아이디 저장</td>
					<td><input type="checkbox" name="userRemember" value="Y" 
							${cookie.userRemember.value eq 'Y' ? 'checked="checked"' : '' }></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">로그인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
<%} else { %>
<pre>
	${loginInfo.userName }
	${loginInfo.userID }
	${loginInfo.userPW }
	${loginInfo.userEmail }
	${loginInfo.result ? '정상' : '' }
	${loginInfo.message }
	
	<a href="<%=request.getContextPath() %>/11/logoutProc.jsp">로그아웃</a>
</pre>
<%} %>
</body>
</html>