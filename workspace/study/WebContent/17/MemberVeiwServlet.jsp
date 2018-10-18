<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세 정보</title>
<c:import url="/inc/lib.jsp"></c:import>
</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
		<h2>회원정보</h2>
<%-- 		<c:forEach var="rs" items="${memberList }"> --%>
<%-- 			${rs } --%>
<%-- 		</c:forEach> --%>
		\${memberInfo }
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${memberInfo.userID }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${memberInfo.userName }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${memberInfo.userHP }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${memberInfo.userEmail }</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${memberInfo.regDate }</td>
				</tr>
				<tr>
					<td colspan="2">
						<button>수정</button>
						<button>삭제</button>
					</td>
				</tr>
			</tbody>
		</table>

	</div>
</body>
</html>