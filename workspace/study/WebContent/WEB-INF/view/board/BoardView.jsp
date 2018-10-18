<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<c:import url="/inc/lib.jsp"></c:import>
</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
		<table class = "table">
			<tbody>
				<tr>
					<th>제목</th>
					<td>${boardView.title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${boardView.regUser }</td>
					<th>작성일</th>
					<td>${boardView.regDate }</td>
				</tr>
				<tr>
					<th>수정자</th>
					<td>${boardView.upUser }</td>
					<th>수정일</th>
					<td>${boardView.upDate }</td>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4">
					<textarea rows="15" cols="50" readonly>${boardView.contents }
					</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<a href="<c:url value="/board/boardList.do"/>">
							<button type="button">목록</button>
						</a>
						<c:url var="updatePage" value="/board/boardUpdateForm.do">
							<c:param name="seqNo" value="${boardView.seqNo }" />
						</c:url>
						<a href="${updatePage }">
							<button type="button">수정</button>
						</a>		
						<c:url var="deleteProc" value="/board/boardDeleteProc.do">
							<c:param name="seqNo" value="${boardView.seqNo }" />
						</c:url>
						<a href="${deleteProc }">
							<button type="button">삭제</button>
						</a>			
					</td>
				</tr>
			</tbody>
		</table>
		
		
	</div>
</body>
</html>