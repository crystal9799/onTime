<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data test opage</title>
<jsp:include page="/common/Head.jsp" />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<style>
/* ---- FORM ---- */
#todo-form {
	padding: 32px 32px 0;
}

#todo-form input {
	padding: 12px;
	margin-right: 12px;
	width: 225px;
	border-radius: 4px;
	border: none;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: white;
	font-size: 14px;
	outline: none;
}

#todo-form button {
	padding: 12px 32px;
	border-radius: 4px;
	border: none;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: #ffffff;
	color: black;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
}
</style>


<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">

				<h2>Ajax CRUD</h2>
				
				<form id="todo-form">
					<input type="button" value="추가" id="addBtn"> <br>  <br>  <br> 
					 <br> 전체 목록  <br> 
					<input type="button" value="전" id="listBtn"> 
					<input type="button" value="중" id="list	Btn2"> 
					<input type="button" value="후" id="listBtn3"> <br>  <br>  <br> 
					
					삭제  <br> 
					<input type="button" value="삭제" id="delBtn">

				</form>	
				<table id="table">
					<p id="test"></p>
			</div>
		</div>
	</div>
</body>
</html>