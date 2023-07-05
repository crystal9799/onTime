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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<jsp:include page="/WEB-INF/views/kanban/style.jsp" />

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
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Create
								Schedule</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="createProjectForm">
							<div class="modal-body">
								<br>
								<div class="form-group">
									<label for="project_num">프로젝트 번호</label> <input type="number"
										class="form-control" id="project_num" name="id" value="11"
										disabled="disabled">
								</div>
								<br>
								<div class="form-group">
									<label for="project_num">사원 선택</label><br> <select
										id="nameList" class="form-control">
										<option value="0">선택</option>
									</select>
								</div>
								<br>
								<div class="form-group">
									<label for="project_name"> 업무 내용</label> <input type="text"
										class="form-control" id="todo-input" name="title" required>
								</div>
								<br>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" id="closeBtn">close</button>
								<a type="button" class="btn btn-success" id="addBtn">Save</a>
							</div>
						</form>
					</div>
				</div>

				<!-- board -->
				<div class="board">
					<form id="todo-form">
						<br>
					</form>
					<div class="btnClass">
						<div>
							<span> 
							<i class="fa fa-plus" id="modalBtn" aria-hidden="true" type="button"></i> 
							<i class="fa fa-floppy-o" aria-hidden="true" id="saveBtn" type="button"></i> 
							<a href="${pageContext.request.contextPath}/getProjectDetail.do?project_num=${project_num}"
								id="reBtn" class="fa fa-refresh" type="button"
								style="text-decoration: none; color: #4b49ac;"> </a>

							</span>
						</div>
					</div>
					<div class="lanes">
						<div class="swim-lane" id="todo-prev">
							<h3 class="heading">할 일</h3>
							<c:forEach var="plist" items="${plist}">
								<p class="btn btn-inverse-primary btn-fw" draggable="true"
									id='${plist.sched_num}'>${plist.sched_info}</p>
							</c:forEach>
						</div>

						<div class="swim-lane" id="todo-curr">
							<h3 class="heading">진행 중</h3>

							<c:forEach var="clist" items="${clist}">
								<p class="btn btn-inverse-primary btn-fw" draggable="true"
									id='${clist.sched_num}'>${clist.sched_info}</p>
							</c:forEach>
						</div>

						<div class="swim-lane" id="todo-next">
							<h3 class="heading">완료</h3>
							<c:forEach var="nlist" items="${nlist}">
								<p class="btn btn-inverse-primary btn-fw" draggable="true"
									id='${nlist.sched_num}'>${nlist.sched_info}</p>
							</c:forEach>
						</div>
						<div class="pro" id="todo-p">
							<c:forEach var="p" items="${p}">
								<h3 class="heading" href="#">
									[ P2023-0${p.project_num} ] : ${p.project_name}<i
										class="fa fa-trash" aria-hidden="true" id="delBtn"
										type="button"></i>
								</h3>
								<div class="p-inner">
									시작 일자 :
									<p>${p.project_start}</p>
									<br> 종료 일자 :
									<p>${p.project_end}</p>
									<br> 내 용 :
									<p>${p.project_info}</p>
									<br>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/kanban/js.jsp" />
</body>
</html>