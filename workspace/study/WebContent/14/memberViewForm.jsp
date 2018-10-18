<%@page import="kr.or.nextit.mber.service.MberVo"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");

MberService mber = new MberServiceImpl();

String memID = request.getParameter("memID");
MberVo result = mber.getMemberItem(memID);
// out.println(result);

request.setAttribute("result", result);
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세 정보</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<table class="table">
			<tbody>
				<tr>
					<th>아 이 디</th>
					<td>${result.memID }</td>
				</tr>
				<tr>
					<th>이    름</th>
					<td>${result.memName }</td>
				</tr>
				<tr>
					<th>닉 네 임</th>
					<td>${result.memNickname }</td>
				</tr>				
				<tr>
					<th>주    소</th>
					<td>${result.memAddr }</td>
				</tr>
				<tr>
					<th>가 입 일</th>
					<td>${result.regDate }</td>
				</tr>
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<td>
						<a href="<c:url value="/14/memberListForm.jsp" />">목록</a>
					</td>
					<td>
						<c:url var="updatePage" value="/14/memberUpdateForm.jsp">
							<c:param name="memID" value="${result.memID}" />
							<c:param name="memTest" value="테스트" />
						</c:url>
						<a href="${updatePage }">수정</a>
					</td>
					<td>
						<c:url var="deletePage" value="/14/memberDeleteForm.jsp">
							<c:param name="memID" value="${result.memID}" />
						</c:url>
						<a href="${deletePage }">삭제</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>