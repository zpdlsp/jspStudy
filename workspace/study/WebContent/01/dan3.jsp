<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	구구단을 외워보도록 하자
	<br>
	<%
		String name = "오하영";
		//name = request.getParameter("name");
	%>
	<%=name%>
	<form action="<%=request.getContextPath()%>/01/dan3Proc.jsp" method="post">
		<table>
			<tr>
				<td> <input type="text" name="t1" value="3"> </td>
				<td> <input type="text" name="t2" value="3"> </td>
				<td> <button type="submit">버튼</button> </td>
			</tr>

		</table>
	</form>


</body>
</html>