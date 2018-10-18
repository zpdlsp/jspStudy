<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
<c:import url="/inc/lib.jsp"></c:import>
</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	<div class="container">
	
		<br><a href="/board/boardInsertForm.do">등록</a><br>

		<form action="">
			<table class="table">
				<thead>
					<tr>
						<th>
							<select name="whereType">
								<option value="title" 
									${param.whereType eq 'title' ? 'selected="selected"' : ''}>
									제목
								</option>
								<option value="contents" 
									${param.whereType eq 'contents' ? 'selected="selected"' : ''}>
									내용
								</option>
							</select>
						</th>
						<th colspan="4">
							<input type="text" name="searchText" value="${param.searchText }">
						</th>
					</tr>
					<tr>
						<th>
							<select name="serviceType">
								<option value="NOTICE" 
									${param.serviceType eq 'NOTICE' ? 'selected="selected"' : '' }>
									NOTICE
								</option>
								<option value="QNA"
									${param.serviceType eq 'QNA' ? 'selected="selected"' : '' }>
									Q&A
								</option>
								<option value="FAQ"
									${param.serviceType eq 'FAQ' ? 'selected="selected"' : '' }>
									FAQ
								</option>
								<option value="ALL" 
									${param.serviceType eq 'ALL' ? 'selected="selected"' : '' }>
									ALL
								</option>
							</select>
						</th>
						<th colspan="4">
							<button type="submit">검색</button>
						</th>
					</tr>
				</thead>
			</table>
		</form>


		<table	class="table">
			<thead>
				<tr>
					<th>순번</th>
					<th>${param.serviceType }</th>					
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rs" items="${boardList }" varStatus="status">
					<tr>
						<td>${status.index }</td>
						<td>${rs.serviceType }</td>
						<td>
							<c:url var="viewPage" value="/board/boardView.do">
								<c:param name="seqNo" value="${rs.seqNo }" />
							</c:url>
							<a href="${viewPage }">
								${rs.title }
							</a>
						</td>
						<td>${rs.regUser }</td>
						<td>${rs.regDate }</td>
						<td>${rs.viewCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	
	</div>
</body>
</html>