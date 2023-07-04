<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Board</title>
<jsp:include page="/common/Head.jsp" />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<jsp:include page="/WEB-INF/views/kanban/style.jsp" />
<style>
      p {
        cursor: pointer;
      }
      .jbBox {
        border: 1px solid #bcbcbc;
        padding: 20px;
        background-color:#4b49ac;
      }
</style>
</head>

<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">

				<!-- modal -->
				<div class="modal">
					<div class="modal_body">
										모달 테스트 창<br><br><br><br>
					사원<br> <select id="nameList">
					<option value="0">선택</option>
					</select>
					<br><br> <br><br> <br>
						업무 내용<br>
						<input type="text" placeholder="입력" id="todo-input" /> <br> <br>
						<!-- <a type=button class="addModalBtn" style="text-decoration:none; color:black"><button>add</button></a> -->
						<br><br><br><br><br><br>  
						<a id="addBtn" href="${pageContext.request.contextPath}/getProjectDetail.do" style="text-decoration:none; color:black">Add Test</a>
						<br><br><br>
						<button class="btn btn-primary w-100" id="modalClose">cancel</button>
					</div>
				</div>
				<div class="board">
					<form id="todo-form">
						<button class="modalBtn">add</button>
<!-- 						<br> <br> <input type="text" placeholder="업무 입력" id="todo-input" /> -->
<!-- 						<button type="submit">추가</button> -->
						<button id="saveBtn">save</button>
						<button id="delBtn">del</button>
						<button><a href="${pageContext.request.contextPath}/getProjectDetail.do" style="text-decoration:none; color:black">refresh</a></button><br>
	<!-- 					<button id="refreshBtn" href="${pageContext.request.contextPath}/getProjectDetail.do">refresh</button> -->
					</form>

					<div class="lanes">
						<div class="swim-lane" id="todo-prev">
							<h3 class="heading">할일</h3>
							<c:forEach var="plist" items="${plist}">
								<p class="task" draggable="true" id='${plist.sched_num}'>${plist.sched_info}</p>
							</c:forEach>
						</div>

							<div class="swim-lane" id="todo-curr">
							<h3 class="heading">진행중</h3>

							<c:forEach var="clist" items="${clist}">
								<p class="task" draggable="true" id='${clist.sched_num}'>${clist.sched_info}</p>
							</c:forEach>
						</div>

						<div class="swim-lane" id="todo-next">
							<h3 class="heading">완료</h3>
							<c:forEach var="nlist" items="${nlist}">
								<p class="task" draggable="true" id='${nlist.sched_num}'>${nlist.sched_info}</p>
							</c:forEach>
						</div>
					</div>
				</div>

				<jsp:include page="/WEB-INF/views/kanban/js.jsp" />
</body>
</html>