<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	
		fetch("${pageContext.request.contextPath}/admin/projectlist.do?user_id="+${emp.user_id})
						.then(res => res.json())
						.then(data => {
							const defaultLink = "${pageContext.request.contextPath}/getProjectDetail.do?project_num=";
							let linklist = [];
							for(let i in data){
								linklist.push(defaultLink+data[i].PROJECT_NUM);
								//네브바 만들기
					        	let newProject = $("<li></li>").addClass("nav-item");
					        	newProject.appendTo($('.nav.flex-column.sub-menu'));
		
					        	console.log("Creating newLink");
					        	let newLink = $("<a></a>")
					        	    .addClass("nav-link")
					        	    .attr("href", linklist[i])
					        	    .text(data[i].PROJECT_NAME);
		
					        	newLink.appendTo(newProject);
							}
						})
					}); 
</script>