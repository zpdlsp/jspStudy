<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	List<LoginVo> memberList = new ArrayList();
	memberList.add(new LoginVo("고길동","master","12345","master@nextit.or.kr"));
	memberList.add(new LoginVo("이관리","admin","12345","admin@nextit.or.kr"));
	memberList.add(new LoginVo("사용인","user","12345","user@nextit.or.kr"));
	memberList.add(new LoginVo("사업자","biz","12345","biz@nextit.or.kr"));
	memberList.add(new LoginVo("김실험","test","12345","test@nextit.or.kr"));


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
	out.println(session.getCreationTime());
	out.println(session.getLastAccessedTime());

	for(LoginVo loginInfo : memberList){
		out.println(loginInfo.getUserID());
		out.println(loginInfo.getUserPW());
		if(userID.equals(loginInfo.getUserID()) && userPW.equals(loginInfo.getUserPW())){
			loginInfo.setResult(true);
			loginInfo.setMessage("로그인 성공");
			
			session.setAttribute("loginInfo", loginInfo);
			
			// request.getSession().setAttribute("loginInfo", loginInfo);	// 선호방식, request객체에서 세션은 받아와서 설정
			//아이디와 비밀번호가 일치합니다
			break;
		} else {
			// session을 완전히 초기화(반복문 안에서는 절대 하면 안됨)
			// session.invalidate();
			session.setAttribute("loginInfo", null);
			session.removeAttribute("loginInfo");
		}
	}
	
	response.sendRedirect(String.format("%s/11/loginForm.jsp", request.getContextPath()));
	
%>

${userName }
${userName2 }
</pre>

</body>
</html>