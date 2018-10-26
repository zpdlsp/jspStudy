<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록</title>
</head>
<body>
<h1>회원 등록</h1>

<c:url var="insertProc" value="/member/memberInsertProc.do"></c:url>
	<form action="${insertProc }" method="post">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memId" value="${memberItem.memId }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memPw" value="${memberItem.memPw }" ></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memName" value="${memberItem.memName }" ></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="memNickname" value="${memberItem.memNickname }" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="memAddr" value="${memberItem.memAddr }"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
					<c:url var="listUrl" value="/member/memberList.do" />
					<a href="${listUrl }">
						<button type="button">목록</button>
					</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	
</body>
</html>