<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member View</title>
</head>
<body>

	<table class="table">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberItem.memId }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberItem.memName }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${memberItem.memNickname }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${memberItem.memAddr }</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${memberItem.regDate }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:url var="updateUrl" value="/member/memberUpdate.do" >
						<c:param name="memId" value="${memberItem.memId }" />
					</c:url>
					<a href="${updateUrl }">
						<button>수정</button>
					</a>
					<c:url var="deleteUrl" value="/member/memberDelete.do" >
						<c:param name="memId" value="${memberItem.memId }" />
					</c:url>
					<a href="${deleteUrl }">
						<button>삭제</button>
					</a>
					<c:url var="listUrl" value="/member/memberList.do" />
					<a href="${listUrl }">
						<button>목록</button>
					</a>
				</td>
			</tr>
		</tbody>
	</table>

</body>
</html>