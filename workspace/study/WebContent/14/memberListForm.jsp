<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			StringBuilder query = new StringBuilder();
			query.append("SELECT                    ");
			query.append("	mem_id,                 ");
			query.append("	mem_pw,                 ");
			query.append("	mem_name,               ");
			query.append("	mem_nickname,           ");
			query.append("	mem_addr,               ");
			query.append("	reg_date                ");
			query.append("FROM                      ");
			query.append("	tb_member1              ");
			query.append("ORDER BY reg_date DESC    ");
		%>
		<a href="<%=request.getContextPath() %>/14/memberInsertForm.jsp">회원등록</a>
		<table class="table">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>주소</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");

						pstmt = conn.prepareStatement(query.toString());
						
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							String memID = rs.getString("mem_id");
				%>
				<tr>

					<td>
						<c:url var="viewPage" value="/14/memberViewForm.jsp">
							<c:param name="memID" value="<%=memID %>" />							
						</c:url>
						
						<c:set var="memID" value="<%=memID %>" />
						<c:url var="viewPage2" value="/14/memberViewForm.jsp">
							<c:param name="memID" value="${memID }" />							
						</c:url>
						<%-- <a href="<%=request.getContextPath()%>/14/memberViewForm.jsp?memID=<%=rs.getString("mem_id") %>"> 
							<%=rs.getString("mem_id")%>
						</a> --%>
						<a href="${viewPage2 }">${memID }</a>
					</td>

					<td><%=rs.getString("mem_name")%></td>
					<td><%=rs.getString("mem_nickname")%></td>
					<td><%=rs.getString("mem_addr")%></td>
					<td><%=rs.getString("reg_date")%></td>
				</tr>
				<%
					}
					} catch (Exception e) {
						out.println(e.getMessage());
					} finally {
						if (rs != null) {
							try {
								rs.close();
							} catch (Exception e) {

							}
						}
						if (pstmt != null) {
							try {
								pstmt.close();
							} catch (Exception e) {

							}
						}
						if (conn != null) {
							try {
								conn.close();
							} catch (Exception e) {

							}
						}
					}
				%>
			</tbody>
		</table>


	</div>
</body>
</html>