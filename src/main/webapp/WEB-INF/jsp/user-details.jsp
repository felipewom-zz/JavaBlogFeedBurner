<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-4">
							<p>
							<h1><c:out value="${fn:toUpperCase(fn:substring(user.name, 0, 1))}${fn:toLowerCase(fn:substring(user.name, 1,fn:length(user.name)))}"></c:out></h1>
							</p>
							<p>ID: ${user.id}</p>
							<p>Username: <c:out value="${user.username}"/></p>
							<p>Email: <c:out value="${user.email}"/></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div role="tabpanel">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<c:forEach items="${user.blogs}" var="blog">
					<li role="presentation"><a href="#blog_${blog.id}"
						aria-controls="home" role="tab" data-toggle="tab">
							<c:out value="${blog.name}"></c:out> </a></li>
				</c:forEach>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<c:forEach items="${user.blogs}" var="blog">
					<div role="tabpanel" class="tab-pane" id="blog_${blog.id}">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-2">
											<h2>
												<a href="<spring:url value="${blog.url}" />">
													<c:out value="${blog.name}"></c:out> </a>
											</h2>
										</div>
										<div class="col-sm-offset-11">
											<a class="btn btn-danger triggerRemove"
												href='<spring:url value="/blog/remove/${blog.id}.html"></spring:url>'>
												<span class="glyphicon glyphicon-trash"></span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th class="center">Date</th>
											<th class="center">Content</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${blog.items}" var="item">
											<tr>
												<td class="center">
													<c:out value="${item.publishedDate}"></c:out>
												</td>
												<td class="center">
													<div id="wrapperColumn" class="col-sm-12 contained_div">
														<i class="small pull-left">ID: ${item.id}</i>
														<p></p>
														<br>
														<div title="<c:out value="${item.title}"></c:out>" > 
															<strong>
																<a href="<c:out value="${item.link}"></c:out>" target="_blank">
																	<c:out value="${item.title}"/>
																</a>
															</strong>
														</div>
														<br>
														<div class="column img_class">
															<blockquote cite="${item.link}"> 
																${item.description}
															</blockquote>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
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
				<h4 class="modal-title" id="myModalRemoveLabel">Remove Blog</h4>
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
		$('.nav-tabs a:first').tab('show');
		$(".triggerRemove").click(function(e){
			e.preventDefault();
			$("#myModalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#myModalRemove").modal();
		});			
	});
</script>
