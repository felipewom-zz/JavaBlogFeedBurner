<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
			href="/resources/css/signin.css" />
<div class="container">
	<form class="form-signin" role="form" action="/j_spring_security_check" method="POST">
		<h2 class="form-signin-heading">Please sign in</h2>
		<input type="text" name="j_username" class="form-control"	placeholder="Username" required autofocus> 
		<input type="password" name="j_password" class="form-control" placeholder="Password" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
	</form>
</div>