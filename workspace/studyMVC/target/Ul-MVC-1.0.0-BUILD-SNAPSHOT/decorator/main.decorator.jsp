<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title><sitemesh:write property='title'/></title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.css" />">
<link rel="stylesheet" href="<c:url value="/css/dashboard.css" />">

<script src="<c:url value="/js/jquery-3.3.1.js" />"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="<c:url value="/js/bootstrap.js" />"></script>

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="<c:url value="/js/holder.js" />"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<c:url value="/js/ie10-viewport-bug-workaround.js" />"></script>
<script src="<c:url value="/js/ie-emulation-modes-warning.js" />"></script>

<sitemesh:write property='head'/>

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- 상위 메뉴 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/" />">Ul's Project</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/test/index.do" />">test SiteMesh</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<!-- 사이드 메뉴 -->
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<c:url value="/" />">Overview <span
							class="sr-only">(current)</span></a></li>
					<li><a href='<c:url value="/member/memberList.do" />'>회원관리</a></li>
					<li><a href="#">Analytics</a></li>
					<li><a href="#">Export</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<sitemesh:write property='body'/>
			</div>
		</div>
	</div>
	
</body>
</html>
