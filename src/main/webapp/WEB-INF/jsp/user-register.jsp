<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<div class="row">
	<form:form commandName="user" cssClass="form-horizontal col-md-offset-2">
		<c:if test="${param.success eq  true}">
			<div class="alert alert-success">
				Success!
			</div>
		</c:if>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Name:</label>
			<div class="col-sm-6">
				<form:input path="name" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="username" class="col-sm-2 control-label">Username:</label>
			<div class="col-sm-6">
				<form:input path="username" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email:</label>
			<div class="col-sm-6">
				<form:input path="email" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">Password:</label>
			<div class="col-sm-6">
				<form:password path="password" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-9 center">
				<input type="submit" value="Save" class="btn btn-lg btn-primary"/>
			</div>
		</div>
	</form:form>
</div>