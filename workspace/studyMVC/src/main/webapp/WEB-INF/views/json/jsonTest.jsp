<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Json Test</title>
<script type="text/javascript">

</script>

</head>
<body>

	<a href='<c:url value="/json/responseEntity.json" />' target="_blank" >responseEntity Test</a>
	<a href='<c:url value="/json/responseEntity2.json" />' target="_blank">responseEntity2 Test</a>
	<a href='<c:url value="/json/responseEntity3.json" />' target="_blank">responseEntity3 Test</a>
	<a href='<c:url value="/json/responseEntity4.json" />' target="_blank">responseEntity4 Test</a>
	<br>
	<a href='<c:url value="/json/responseBody.json" />' target="_blank">responseBody Test</a>
	<a href='<c:url value="/json/responseBody2.json" />' target="_blank">responseBody2 Test</a>
	<a href='<c:url value="/json/responseBody3.json" />' target="_blank">responseBody3 Test</a>

</body>
</html>