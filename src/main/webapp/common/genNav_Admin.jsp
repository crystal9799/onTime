<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	
		fetch("${pageContext.request.contextPath}/admin/projectlist_Admin.do?deptno="+${emp.deptno})
						.then(res => res.json())
						.then(data => {
							const defaultLink = "${pageContext.request.contextPath}/getProjectDetail.do?project_id=";
							let linklist = [];
							for(let i in data){
								console.log(defaultLink+data[i].PROJECT_NUM);
								linklist.push(defaultLink+data[i].PROJECT_NUM);
								//네브바 만들기
					      		console.log("Creating newProject");
					        	let newProject = $("<li></li>").addClass("nav-item");
					        	console.log("newProject:", newProject);
		
					        	newProject.appendTo($('.nav.flex-column.sub-menu'));
		
					        	console.log("Creating newLink");
					        	let newLink = $("<a></a>")
					        	    .addClass("nav-link")
					        	    .attr("href", linklist[i])
					        	    .text(data[i].PROJECT_NAME);
		
					        	console.log("newLink:", newLink);
		
					        	newLink.appendTo(newProject);
		
					        	console.log("newProject after append:", newProject);
							}
						})
					});
</script>