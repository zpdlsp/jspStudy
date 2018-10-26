<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h1> 회원 목록 </h1>
	
	<form action="/member/memberList.do">	
	<table class="table">
		<thead>
			<tr>
				<th colspan="4">
					<select name="searchType">
						<option value="mem_id"
							${param.searchType eq 'mem_id' ? 'selected="selected"' : ''}
						>아이디</option>
						<option value="mem_name"
							${param.searchType eq 'mem_name' ? 'selected="selected"' : ''}
						>이름</option>
					</select>
					<input type="text" name="searchText" value="${param.searchText }">
					<button type="submit">검색</button>
				</th>
			
			</tr>
		
			<tr>
				<th>순번</th>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="memberVo" items="${memberList }">
			<c:url var="viewUrl" value="/member/memberView.do">
				<c:param name="memId" value="${memberVo.memId }"></c:param>
			</c:url>
			<tr>
				<td>
					<a href="${viewUrl }">
						${memberVo.num }
					</a>
				</td>
				<td>
					<a href="${viewUrl }">
						${memberVo.memId }
					</a>
				</td>
				<td>${memberVo.memName }</td>
				<td>${memberVo.regDate }</td>				
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<a href="<c:url value="/member/memberInsert.do" />">
						<button type="button">회원 등록</button>
					</a>
				</td>
			</tr>
		</tfoot>
	</table>	
</form>

</body>
</html>