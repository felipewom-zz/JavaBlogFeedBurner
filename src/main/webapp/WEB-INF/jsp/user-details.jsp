<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<div class="panel panel-default">
	<div class="panel-body">
		<p>
			<h1>
				${fn:toUpperCase(fn:substring(user.name, 0, 1))}${fn:toLowerCase(fn:substring(user.name, 1,fn:length(user.name)))}
			</h1>
		</p>
		<p>ID: ${user.id}</p>
		<p>Username: ${user.username}</p>
		<p>Email: ${user.email}</p>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  <span class="glyphicon glyphicon-list-alt"></span>
		  New Blog
		</button>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">New Blog</h4>
      </div>
      <div class="modal-body">
      	<form:form commandName="blog" cssClass="form-horizontal">
      		<div class="form-group">
	      		<label for="name" class="col-sm-2 control-label">Name:</label>
	      		<div class="col-sm-4"> 
	      			<form:input path="name" cssClass="form-control"/>
	      		</div>
      		</div>
      		<div class="form-group">
	      		<label for="url" class="col-sm-2 control-label">URL:</label>
	      		<div class="col-sm-4"> 
	      			<form:input path="url" cssClass="form-control"/>
	      		</div>
      		</div>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="Save"/>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </form:form>
      </div>
    </div>
  </div>
</div>
<c:forEach items="${user.blogs}" var="blog">
	<div class="panel panel-default">
 			<div class="panel-heading">
			<h2><a href="<spring:url value="${blog.url}" />">${blog.name}</a></h2>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th class="center">ID</th>
						<th class="center">Title</th>
						<th class="center">Link</th>
						<th class="center">Description</th>
						<th class="center">Published Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${blog.items}" var="item">
						<tr>
							<td class="center">${item.id}</td>
							<td class="center">${item.title}</td>
							<td class="center"><a href="<spring:url value="${item.link}" />">${item.link}</a></td>
							<td class="center">${item.description}</td>
							<td class="center">${item.publishedDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
	</div>
</c:forEach>
