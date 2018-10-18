<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.function.MemberUtil"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	MemberUtil utils = new MemberUtil();

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
	<form action="/04/memberProc2.jsp" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td>아 이 디</td>
					<td><input type="text" name="userID" class="form-control"></td>
				</tr>			
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPW" class="form-control"></td>
				</tr>
				<tr>
					<td>이    름</td>
					<td><input type="text" name="userName" class="form-control"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="userHP" class="form-control"></td>
				</tr>
				<tr>
					<td>성    별</td>
					<td>
					<%
						List<CommCodeVo> sitems = utils.getSexItems();
					%>
						<select name="userSex" class="form-control">
						<% for(CommCodeVo item : sitems){ %>	
							<option value="<%=item.getKey() %>"><%=item.getValue() %></option>
						<% }  %>							
						</select>
					</td>
				</tr>
				<tr>
					<td>취    미</td>
						<td>
							<%
								List<CommCodeVo> items = MemberUtil.getHobbyItems();
								for (CommCodeVo item : items) {
							%> <input type="checkbox" name="userHobby" value="<%=item.getKey()%>" >
							<%=item.getValue()%> <br> <%
 								}
 							%>
						</td>
					</tr>
				<tr>
					<td>e-mail</td>
					<td><input type="email" name="userEmail" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-default">가입</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	</div>
</body>
</html>