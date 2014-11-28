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
					<td class="center single-lined">
						${user.id}
					</td>
					<td class="single-lined" title="<c:out value="${user.name}"/>">
						<a href="<spring:url value="/users/${user.id}.html" />">
							<span class="glyphicon glyphicon-user" aria-hidden="true">
							</span> <c:out value="${user.name}"/>
						</a>
					</td>
					<td title="<c:out value="${user.username}"/>" class="text-muted center single-lined" style="vertical-align: middle;">
						<c:out value="${user.username}"/></td>
					<td title="<c:out value="${user.password}"/>" class="text-muted center single-lined" style="vertical-align: middle;">
						<c:out value="${user.password}"/></td>
					<td class="text-muted single-lined" title="<c:out value="${user.email}" />"><a 
						href="mailto:${user.email}?subject=JavaBlog
							&body=This is just a test from Javablog! ">
							<span class="glyphicon glyphicon-inbox" aria-hidden="true">
						</span> <c:out value="${user.email}" />
					</a></td>
					<td class="center single-lined"><a
						href="<spring:url value="/user/${user.id}.html" />"> <span
							class="glyphicon glyphicon-edit" aria-hidden="true"> </span>
					</a> <a href="<spring:url value="/user/remove/${user.id}.html"/>">
							<span class="glyphicon glyphicon-trash warning triggerRemove"
							aria-hidden="true"> </span>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- Modal Delete -->
<div class="modal fade" id="myModalRemove" tabindex="-1" role="dialog"
	aria-labelledby="myModalRemoveLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalRemoveLabel">Remove User</h4>
			</div>
			<div class="modal-body">Really want to remove?</div>
			<div class="modal-footer">
				<a href="" class="btn btn-danger removeBtn">Confirm</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".triggerRemove").click(function(e){
			e.preventDefault();
			$("#myModalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#myModalRemove").modal();
		});			
	});
</script>

