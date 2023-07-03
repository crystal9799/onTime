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
</head>

<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">

				<div class="modal">
					<div class="modal_body">

						<select id="nameList">
							<option value="0">선택</option>
						</select> <br> <br> <br> <br> <br> 업무 내용<br>
						<input type="text" placeholder="입력" id="todo-input" /> <br>
						<br>

						<button class="addModalBtn">add</button>
					</div>
				</div>
				<div class="board">
					<!-- form 안에 css적용 -->
					<form id="todo-form">
						<input type="text" placeholder="New TODO..." id="todo-input" />
						<button type="submit">Add +</button>
						<button class="btn-open-popup">Modal add</button>
					</form>

					<div class="lanes">
						<div class="swim-lane" id="todo-lane">
							<h3 class="heading">할일</h3>
							<c:forEach var="plist" items="${plist}">
								<p class="task" draggable="true">${plist.sched_info}</p>
							</c:forEach>
						</div>

						<div class="swim-lane">
							<h3 class="heading">진행중</h3>

							<c:forEach var="clist" items="${clist}">
								<p class="task" draggable="true">${clist.sched_info}</p>
							</c:forEach>
						</div>

						<div class="swim-lane">
							<h3 class="heading">완료</h3>
							<c:forEach var="nlist" items="${nlist}">
								<p class="task" draggable="true">${nlist.sched_info}</p>
							</c:forEach>
						</div>
					</div>
				</div>




				<jsp:include page="/WEB-INF/views/kanban/js.jsp" />
</body>
</html>