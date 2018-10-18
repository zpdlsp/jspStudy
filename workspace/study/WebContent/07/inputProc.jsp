<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	이름  : ${param.userName }
	취미  : <%
				String[] hobbys = request.getParameterValues("userHobby");
				for(String hobby : hobbys){
					out.println(hobby);
				}
	
			%>
	혈액형 : <%
				String blood = request.getParameter("userBlood");
				out.println(blood);
				StringBuilder path = new StringBuilder();
				
				switch (blood){
					case "A" :
						out.print("A형입니다.");
						//path = request.getContextPath() + "/07/A.jsp";
						path.append(request.getContextPath());
						path.append("/07/A.jsp");
						
					break;
					case "B" :
						out.print("B형입니다.");
						path.append(request.getContextPath());
						path.append("/07/B.jsp");
						
						break;
					case "O" : 
						out.print("O형입니다.");
						break;
					case "AB" :
						out.print("AB형입니다.");
					default :
						out.print("모르는 혈액형");
				}
				
				//path = request.getContextPath() + "/07/" + blood +".jsp?blood=" + blood;
				path.setLength(0);
				path = new StringBuilder();
				
				path.append(request.getContextPath());
				path.append("/07/");
				path.append(blood);
				path.append(".jsp?blood=");
				path.append(blood);
				
				
				response.sendRedirect(path.toString());
			%>
			

			
</pre>
</body>
</html>