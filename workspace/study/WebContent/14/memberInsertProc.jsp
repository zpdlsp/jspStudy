<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
int rs = 0;

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
	
	StringBuilder sql = new StringBuilder();
	sql.append("INSERT INTO tb_member1 	(");
	sql.append(" 	mem_id,				 ");	
	sql.append(" 	mem_pw,				 ");
	sql.append("	mem_name,			 ");
	sql.append("	mem_nickname, 		 ");
	sql.append("	mem_addr,			 ");
	sql.append("	reg_date			 ");	
	sql.append(") VALUES (				 ");
	sql.append("	?,					 ");
	sql.append("	?,					 ");
	sql.append("	?,					 ");
	sql.append("	?,					 ");
	sql.append("	?,					 ");
	sql.append("	sysdate				 ");
	sql.append(")						 ");
	
	pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, request.getParameter("userID"));	
	pstmt.setString(2, request.getParameter("userPW"));							
	pstmt.setString(3, request.getParameter("userName"));							
	pstmt.setString(4, request.getParameter("userNickname"));							
	pstmt.setString(5, request.getParameter("userAddr"));							
	
	rs = pstmt.executeUpdate();
	
	out.print(rs);
	out.print(rs);
	out.print(rs);
	out.print(rs);
	out.print(rs);

	
} catch (Exception e) {
	out.print(e.getMessage());
	e.printStackTrace();
} finally {
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		conn.close();
	}
}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${param.userID }
${param.userPW }
${param.userName }
${param.userNickname }
${param.userAddr }

<%
response.sendRedirect(String.format("%s/13/loginForm.jsp", request.getContextPath()));

%>
</body>
</html>