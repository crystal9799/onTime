<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>


<script type="text/javascript">
$(document).ready(function() {
	$('#hidelist').click(function() {
    	$("#table").empty();
	});
	

	$('#addBtn').click(function() {
		console.log('addBtn');
		const dataArray = {
				sched_num: $("#sched_num").val(), sched_info: $("#sched_info").val(),
				sched_prog:$("#sched_prog").val(), sched_seq:$("#sched_seq").val(),
				project_num:$("#project_num").val()
				};
		console.log('addBtn Click!');
		$.ajax({
			url : "add.ajax",
			type : 'POST',
			data : JSON.stringify(dataArray),
			contentType: 'application/json',
			success : function(data) {
				console.log("data: " + data);
			} 
		});
	});
	
	$('#listBtn').click(function() {
		console.log('listBtn Click!');
		$.ajax({
			url: "listPrev.ajax",
			type: "POST", 
			success : function(data){
		    	console.log(data);
				},
			error :function(){
				alert("request error!");
				}
		}); 
	});
	$('#listBtn2').click(function() {
		console.log('listBtn2 Click!');
		$.ajax({
			url: "listCurr.ajax",
			type: "POST", 
			success : function(data){
		    	console.log(data);
				},
			error :function(){
				alert("request error!");
				}
		}); 
	});
	
	$('#listBtn3').click(function() {
		console.log('listBtn3 Click!');
		$.ajax({
			url: "listNext.ajax",
			type: "GET", 
			success : function(data){
		    	console.log(data);
				},
			error :function(){
				alert("request error!");
				}
		}); 
	});

	
	$('#fetchlist').click(function() {
		  const config = {
		    method: "post"
		  };
		  fetch("list.ajax", config)
		    .then(response => response.json())
		    .then(data => { 
		    	console.log(data);
		    })
		    .catch(error => console.log("fetch 에러!"));
});    
	
	$('#delBtn').click(function() {
		console.log('delBtn click!');
		  const config = {
		    method: "post"
		  };
		  fetch("delete.ajax", config)
		    .then(response => response.json())
		    .then(data => { 
		    	console.log(data);
		    })
		    .catch(error => console.log("fetch 에러!"));
});    

		
});

</script>



<body>
	<h2>Ajax CRUD</h2>
	<input type="button" value="추가" id="addBtn">

	<br> 전체 목록
	<input type="button" value="전" id="listBtn">
	<input type="button" value="중" id="list	Btn2">
	<input type="button" value="후" id="listBtn3">


	<br> 삭제
	<input type="button" value="삭제" id="delBtn">




	<!-- 	<input type="button" value="fetch 조회" id="fetchlist">
	<input type="button" value="숨김" id="hidelist"> -->
	<br>




	<table id="table">
		<p id="test"></p>
</body>
</html>