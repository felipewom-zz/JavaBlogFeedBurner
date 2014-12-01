<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<div class="center">
	<h1>Latest news from the Java world:</h1>
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
			<c:forEach items="${items}" var="item">
				<tr>
					<td class="center col-sm-2">
						<c:out value="${item.publishedDate}"/>
						<br>
						<h3><c:out value="${item.blog.name}"></c:out></h3>
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
							<div class="column img_class" >
								${item.description == '' || item.description == null ? "<i style='width: 100% !important;font-size: 8px'>No content</i>" : item.description}
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
