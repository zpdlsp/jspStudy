<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	CookieBox cookieBox = new CookieBox(request);
	String userRemember = request.getParameter("userRemember");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	
	if ("Y".equals(userRemember)) {
		Cookie cID = CookieBox.createCookie("userID", userID);
		response.addCookie(cID);
		Cookie cRemember = CookieBox.createCookie("userRemember", userRemember);
		response.addCookie(cRemember);
	} else {
		Cookie cID = CookieBox.createCookie("userID", "", "/", 0);
		response.addCookie(cID);
		Cookie cRemember = CookieBox.createCookie("userRemember", "", "/", 0);
		response.addCookie(cRemember);
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tb_member1 ");
		sql.append(" WHERE mem_id = ? ");
		sql.append("   AND mem_pw = ? ");
		
		pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, request.getParameter("userID"));	
		pstmt.setString(2, userPW);							// 위에 userPW 선언되있음
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			LoginVo loginInfo = new LoginVo();
			loginInfo.setUserID(rs.getString("mem_id"));
			loginInfo.setUserPW(rs.getString("mem_pw"));
			loginInfo.setUserName(rs.getString("mem_name"));
			loginInfo.setUserEmail(rs.getString("mem_nickname"));	// email일 필드가 없어서 nickname 대체
			loginInfo.setResult(true);
			loginInfo.setMessage("정상적으로 로그인 하셨습니다.");
			
			session.setAttribute("loginInfo", loginInfo);
			
		} else {
			session.invalidate();
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
요청하신 ID : ${param.userID }
요청하신 PW : ${param.userPW }
요청하신 저장유무 : ${param.userRemember }
<%
	out.println(session.getId());
//	out.println(session.getCreationTime());
//	out.println(session.getLastAccessedTime());

	response.sendRedirect(String.format("%s/13/loginForm.jsp", request.getContextPath()));
%>

${userName }
${userName2 }
</pre>

</body>
</html>