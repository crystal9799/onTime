
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
						<button class="modalBtn">모달 창 테스트 중</button>
						<br> <br> <input type="text" placeholder="업무 입력"
							id="todo-input" />
						<button type="submit">추가</button>
						<button id="saveBtn">save</button>
					</form>
					<div class="lanes" id="content">
						<div class="swim-lane">
							<h3 class="heading">업무 시작 전</h3>
							<div id="todo-prev"></div>
						</div>

						<div class="swim-lane" >
							<h3 class="heading">업무 진행 중</h3>
							<div id="todo-curr">
						</div>
						</div>
						<div class="swim-lane">
							<h3 class="heading">업무 완료</h3>
							<div id="todo-next"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<jsp:include page="/WEB-INF/views/kanban/js.jsp" />

</body>
</html>