<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<nav class="sidebar sidebar-offcanvas flex" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main.do"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Mainpage</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic" >
				<i class="icon-layout menu-icon"></i> <span class="menu-title">Project</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/empManage.do?deptno=${emp.deptno}"> <i
				class="icon-paper menu-icon"></i> <span class="menu-title">DeptManage</span>
		</a></li>
		<li class="nav-item"><a id="test" class="nav-link"
			href="${pageContext.request.contextPath}/mypage.do?user_id=${emp.user_id}"> 
			<i class="icon-head menu-icon"></i> <span class="menu-title">Mypage</span></i>
		</a>
			</li>

	</ul>
</nav>
<script>
/* $(document).ready(function () {
	$("#test").on('click',function(){
		console.log("test 버튼클");
		window.location='${pageContext.request.contextPath}/mypage.do';
	})	
})
 */
</script>