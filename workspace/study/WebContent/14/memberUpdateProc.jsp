<%@page import="kr.or.nextit.mber.service.MberVo"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String memID = request.getParameter("userID");
String memPW = request.getParameter("userPW");
String memName = request.getParameter("userName");
String memNickname = request.getParameter("userNickname");
String memAddr = request.getParameter("userAddr");

MberService mber = new MberServiceImpl();
MberVo mberVo = mber.updateMemberItem(memID, memPW, memName, memNickname, memAddr);

// out.println(mberVo);

if(mberVo.isState()){
	StringBuilder url = new StringBuilder();
	url.append(request.getContextPath());
	url.append("/14/memberViewForm.jsp");
	url.append("?memID=");
	url.append(mberVo.getMemID());
					
	response.sendRedirect(url.toString());
}


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<%
		
		if(!mberVo.isState()){
		%>
			<pre>
			다음과 같은 에러가 발생하였습니다.<br>
			<%=mberVo.getMessage() %>
			</pre>
			<script type="text/javascript">
				var message = '<%=mberVo.getMessage() %>'; 
				alert(message);
			</script>
			
		<%
		}
		%>




	</div>



</body>
</html>