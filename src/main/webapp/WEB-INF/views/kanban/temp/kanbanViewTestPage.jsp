
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kanban test page</title>
<jsp:include page="/common/Head.jsp" />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<jsp:include page="/WEB-INF/views/kanban/style.jsp" />
</head>

<script>

</script>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">

				<div class="modal">
					<div class="modal_body">
						업무 내용<br>
						<input type="text" placeholder="입력" id="todo-input" /> <br> <br>
						
						
						
						<button class="enamelistBtn" >ename load</button>
						<button class="addModalBtn" >add</button>
					</div>
				</div> 
				<div class="board">
					<!-- form 안에 css적용 -->
					<form id="todo-form">
						<button class="modalBtn">모달 창 테스트 중</button><br><br>
						<input type="text" placeholder="업무 입력" id="todo-input" />
						<button type="submit">추가</button> 
					</form> 
					<div class="lanes">
						<div class="swim-lane" id="todo-lane">
							<h3 class="heading">할일</h3>

							<p class="task" draggable="true">업무1</p>
							<p class="task" draggable="true">업무2</p>
							<p class="task" draggable="true">업무3</p>
						</div>

						<div class="swim-lane">
							<h3 class="heading">진행중</h3>

							<p class="task" draggable="true">업무4</p>
						</div> 
						<div class="swim-lane">
							<h3 class="heading">완료</h3> 
							<p class="task" draggable="true">업무5</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<jsp:include page="/WEB-INF/views/kanban/js.jsp" />

</body>
</html>