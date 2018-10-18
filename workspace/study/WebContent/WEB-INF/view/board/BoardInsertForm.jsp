<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/inc/lib.jsp"></c:import>
</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
	
		<form action="/board/boardInsertProc.do">
			<table class="table">
				<tbody>
					<tr>
						<th>게시판 종류</th>
						<td>
							<select name="serviceType">
								<option value="NOTICE">NOTICE</option>
								<option value="QNA">Q&A</option>
								<option value="FAQ">FAQ</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value=""></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="15" cols="50" name="contents"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">등록</button></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
	</div>
</body>
</html>