<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../layout/taglib.jsp"%>

<div class="table-responsive">
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th class="center">ID</th>
				<th class="center">Name</th>
				<th class="center">Username</th>
				<th class="center">Password</th>
				<th class="center">Email</th>
				<th class="center"><span class="glyphicon glyphicon-edit"
						aria-hidden="true""></span></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td class="center"> 
						${user.id}
					</td>
					<td>
						<a href="<spring:url value="/user/${user.id}.html" />">
							<span class="glyphicon glyphicon-user" 	aria-hidden="true">
							</span> 
							${user.name}
						</a>
					</td>
					<td class="text-muted center" style="vertical-align: middle;">
						${user.username}
					</td>
					<td class="text-muted center" style="vertical-align: middle;">
						${user.password}
					</td>
					<td class="text-muted">
						<a href="mailto:${user.email}?subject=JavaBlog
							&body=This is just a test from Javablog! ">
							<span class="glyphicon glyphicon-inbox" aria-hidden="true">
							</span>
							${user.email}
						</a>
					</td>
					<td class="center">
						<a href="<spring:url value="/user/${user.id}.html" />">
							<span class="glyphicon glyphicon-edit"aria-hidden="true">
							</span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
