<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false" %> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>인덱스 메인(/index.do)</title>
</head>
<body>
	<h1 class="page-header">인덱스 메인(/index.do)</h1>
	<pre>
	${name }
	${param.name2 }
	${serverTime}
	============================================
	${testTitle }
	</pre>
</body>
</html>
