<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<table class="table">
		<tbody>
			<tr>
				<c:forEach var="i" begin="2" end="9">
					<td>
					<c:forEach var="j" begin="1" end="9">
							<table class="table">
								<tbody>
									<tr>
										<td>${i } * ${j } = ${i*j }</td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
						</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>

		<table class="table">
			<tbody>

				<c:forEach var="j" begin="1" end="9">
					<tr>
						<c:forEach var="i" begin="2" end="9">
							<td>${i } * ${j } = ${i*j }</td>
						</c:forEach>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>
</body>
</html>