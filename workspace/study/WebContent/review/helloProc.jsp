<%@page import="kr.or.nextit.function.service.CommCodeVo"%>
<%@page import="kr.or.nextit.review.service.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.nextit.review.service.ReviewService" %>
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
<%
ReviewService paramService = new ReviewService();
HashMap<String, Object> hashMap = paramService.getRequestParamsTest(request);

out.println(hashMap.get("uName"));
out.println(hashMap.get("uAge"));

out.println(request.getParameter("userName"));		// request는 Map객체와 거의 같다
out.println(request.getParameter("userAge"));

List<CommCodeVo> hobby = (List<CommCodeVo>) hashMap.get("hobbyList");

String[] uHobby = request.getParameterValues("userHobby");
for(String item : uHobby){
	for(CommCodeVo value : hobby){
		if(item.equals(value.getKey())){
			out.println(String.format("%s (%s) <- 님 선택", value.getValue(), value.getKey()));
			break;
		} else {
			//out.println(String.format("%s (%s)", value.getValue(), value.getKey()));
		}
	}
}
%>

===================================================
코드목록
<%
ReviewService.getRequestCodeTest(request);
List<ReviewVo> cList = (List<ReviewVo>)request.getAttribute("codeList");
for(ReviewVo value : cList){
	String cd = String.format("%s (%s)", value.getName(), value.getCode());	//값이 2개, 형식을 정해주고 출력
	out.println(cd);
}
%>
===================================================
회원목록
<%
ReviewService service = new ReviewService();
service.getRequestTest(request);
List<String> mList = (List<String>)request.getAttribute("memberList");
for(String value : mList){
	out.println(value);
}
%>

===================================================
나이 3인 녀석이 넘어오면 "이벤트 당첨 !!" 문구 출력
<%
int age = Integer.parseInt(request.getParameter("userAge"));
if(age == 3){
	out.println(String.format("%d살 이벤트 당첨", age));
} else {
	out.println(String.format("%d살은 다음 기회에", age));
}
String result = (age==3 ? "축하" : "다음에"); /*(식 ? true : false) 값 반환*/
out.println(result);
%>

표현식 : <%=(age==3 ? "축하" : "다음에") %>
el == ${param.userAge == 3 ? "경축" : "꽝" }	
===================================================
이름
request.getParameter: <%=request.getParameter("userName") %>
el tag : ${param.userName }
===================================================
나이
request.getParameter: <%=request.getParameter("userAge") %>
el tag : ${param.userAge }

<%
request.setAttribute("testName", "맛있는 녀석들");
%>
request.setAttribute : <%=request.getAttribute("testName") %>
el request.setAttribute : ${testName }


</pre>


</body>
</html>