<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<div class="row">
	<form:form commandName="user" cssClass="form-horizontal col-md-offset-2 registrationForm" >
		<c:if test="${param.success eq  true}">
			<div class="alert alert-success">
				Success!
			</div>
		</c:if>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Name:</label>
			<div class="col-sm-6">
				<form:input path="name" cssClass="form-control"/>
				<form:errors path="name"/>
			</div>
		</div>
		<div class="form-group">
			<label for="username" class="col-sm-2 control-label">Username:</label>
			<div class="col-sm-6">
				<form:input path="username" cssClass="form-control"/>
				<form:errors path="username"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email:</label>
			<div class="col-sm-6">
				<form:input path="email" cssClass="form-control"/>
				<form:errors path="email"/>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">Password:</label>
			<div class="col-sm-6">
				<form:password path="password" cssClass="form-control"/>
				<form:errors path="password"/>
			</div>
		</div>
		<div class="form-group">
			<label for="passwordConfirmation" class="col-sm-2 control-label">Password Confirmation:</label>
			<div class="col-sm-6">
				<input type="password" name="passwordConfirmation" id="passwordConfirmation" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-9 center">
				<input type="submit" value="Save" class="btn btn-lg btn-primary"/>
			</div>
		</div>
	</form:form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$(".registrationForm").validate(
				{
					rules:{
						name: {	
								required: true,
								minlength: 4
								},
						email: {required: true,
								email: true,
								remote:{
									url: "<spring:url value='/register/available.html'/>",
									type: "GET",
									data: {
										username: "",
										email: function(){
												return $("#email").val();
												}	
										}
									}
								},
						username: {	required: true,
									minlength: 4,
									remote:{
										url: "<spring:url value='/register/available.html'/>",
										type: "GET",
										data: {
											username: function(){
													return $("#username").val();
													},
											email: ""	
											}
										}
									},
						password: {required: true,
									minlength: 6
									},
						passwordConfirmation: {required: true,
									equalTo: "#password"
									}
						},
						highlight: function(element){
							$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
						},
						unhighlight: function(element){
							$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
						},
						messages: {
							username: {
								remote: "Such username already exists!"
								},
							email: {
								remote: "Such email already exists!"
								}
						}
	
					}
		);
	});
</script>