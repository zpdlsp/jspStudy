<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userID = "";
	CookieBox cookieBox = new CookieBox(request);
	if(cookieBox.exists("userID")){
		userID = cookieBox.getValue("userID");
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var result ='${loginInfo.result }';
if(result != null && result != ""){
	alert('${loginInfo.message }');
}
</script>
</head>
<body>

${result } 
${message }

	<form action="<%=request.getContextPath()%>/09/loginProc.jsp" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userID" value="<%=userID %>"></td>
					<%-- ${cookie.userRemember.value eq 'Y' ? cookie.userID.value : "" } --%>
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

</body>
</html>