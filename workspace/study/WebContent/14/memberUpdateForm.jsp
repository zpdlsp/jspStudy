<%@page import="kr.or.nextit.mber.service.MberVo"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memID = request.getParameter("memID");
MberService mberService = new MberServiceImpl();
MberVo mberVo = mberService.getMemberItem(memID);

request.setAttribute("userInfo", mberVo );

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<form action="<%=request.getContextPath() %>/14/memberUpdateProc.jsp" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userID" readonly="readonly" value="${userInfo.memID }"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPW" value="${userInfo.memPW }"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName" value="${userInfo.memName }"></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="userNickname" value="${userInfo.memNickname }"></td>
					</tr>
					<tr>
						<td>집주소</td>
						<td><input type="text" name="userAddr" value="${userInfo.memAddr }"></td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">수정</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>