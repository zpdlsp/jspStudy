<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false" %>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buffer Test</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<pre>
		out.isAutoFlush() : <%=out.isAutoFlush() %>
<%
	out.flush();
	out.clearBuffer();
	out.print(String.format("버퍼사이즈 %d", out.getRemaining()));
	out.flush();
	out.clearBuffer();
%>
<%
	for (int i = 2; i < 10; i++) {
		for (int j = 1; j < 10; j++) {

			out.println(String.format(" %d * %d = %d", i, j, (i * j)));
			if (i == 5) {
				out.flush();
			} else {
				out.clearBuffer();
			}
		}
	}
%>
		</pre>
		
		<%
			for(int i = 0; i < 1000; i++){
				out.println(out.getRemaining());
				out.println(i+"오늘은 월요일");
				if((i % 5) == 0){
					out.clearBuffer();
				} else {
					out.flush();
					//out.clearBuffer();
				}
			}
		%>
		여기부분에 내용을 작성
	</div>

</body>
</html>