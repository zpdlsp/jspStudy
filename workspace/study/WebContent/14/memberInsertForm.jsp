<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<h4>${title }</h4>
		<h4>${title2 }</h4>
		<form action="<%=request.getContextPath() %>/14/memberInsertProc.jsp" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userID"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPW"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="userNickname"></td>
						<!-- email로 대체 -->
					</tr>
					<tr>
						<td>집주소</td>
						<td><input type="text" name="userAddr"></td>
						<!-- HP로 대체 -->
					</tr>
					<tr>
						<td colspan="2"><button type="submit">회원가입</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>