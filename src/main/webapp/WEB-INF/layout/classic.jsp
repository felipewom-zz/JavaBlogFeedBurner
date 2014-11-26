<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- DON'T CHANGE DECLARATIONS POSITIONS  -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/application.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><tiles:getAsString name="title" /></title>
	</head>
<body>
	<tilesx:useAttribute name="current_page"/>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand title" href='<spring:url value="/" />'>JBA</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="${current_page == 'index' ? 'active' : ''}">
						<a href='<spring:url value="/" />'>Home</a>
					</li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li class="${current_page == 'users' ? 'active' : ''}">
							<a href='<spring:url value="/users.html" />'>Users</a>
						</li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li class="${current_page == 'user' ? 'active' : ''}">
							<a href='<spring:url value="/account.html" />'>My account</a>
						</li>
					</security:authorize>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<security:authorize access="! isAuthenticated()">	
						<li class="${current_page == 'register' ? 'active' : ''}">
							<a href='<spring:url value="/register.html" />'>Register</a>
						</li>
						<li class="${current_page == 'login' ? 'active' : ''}">
							<a href='<spring:url value="/login.html" />'>Login</a>
						</li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href='<spring:url value="/logout" />'>Logout</a></li>
					</security:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
	<div class="alert alert-warning" role="alert">current_page: ${current_page}</div>
	
		<tiles:insertAttribute name="body" />
	</div>
	<div class="center">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>