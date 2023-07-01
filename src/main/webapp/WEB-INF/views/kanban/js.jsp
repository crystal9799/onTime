<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	  window.onload = function(){
		  console.log('load');

		  
	  };
	  
	  
	 /* name list load*/
  	const enamelistBtn = document.querySelector('.enamelistBtn');
  	enamelistBtn.addEventListener('click', () => {
    	console.log(' enamelistBtn Click!');

		$.ajax({
			url: "projectemplist.ajax",
			type: "GET", dataType:"json",
			success : function(data){
		    	console.log("ajax sucess data: "+data);
		    	ajaxtest(data);
				},
			error :function(){
				alert("request error!");
				}
		}); 
    });
  	
  	
 	/* insert ajax */
 	/* param 객체로 전달하기 */
 	/*scheduleBoard*/
	 	/* seleted:name data */
	 	/* boardInfo data */
 	/*schedule*/
	 	/* seleted:name data */
  	
	 	
	 	

	 /*클라이언트 값 매핑 필요*/
  	function ajaxtest(data){
 	console.log("testmethod; "+data);
 	
 	
/* 	const dataArray = { 
 			user_id : "1",
 			project_num : "2",
 			sched_info : "업무내용"
			};
		$.ajax({
			url : "ajadd.ajax",
			type : 'POST',
			data : JSON.stringify(dataArray),
			contentType: 'application/json',
			success : function(data) {
				console.log("data: " + data);
			} 
		});
 	 */
		$.ajax({
			url : "uaddSchedule.ajax",
			type : "post",
			data : {
				user_id : "test",
				project_num : "28",
				sched_info : "여자"
			},
			success : function(data) {
						
		     },
			error : function() {
				alert("error");
			}
		});
		
 	
	 	}
 	
 	
/* 	 	var data = {};
	 	  data["user_id"] = "2";
	 	  data["project_num"] = "1";
	 	  data["sched_info"] = "업무내용";
	   
	  $.ajax({
	    type: "POST",
	    url : "goAjax5.do",
	    data : JSON.stringify(data),
	    dataType: "json",
	    contentType:"application/json;charset=UTF-8",
	    async: false,
	    success : function(data, status, xhr) {
	      console.log(data);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      alert("error= " + errorThrown);
	    }
	  }); */
 	
/*  	$.ajax({
 		url : "test.ajax",
 		type : "post",
 		dataType:"json",
 		data : {
 			user_id : "1",
 			project_num : "2",
 			sched_info : "업무내용"
 		},
 		success : function(data) {
 			console.log(data);
 	     },
 		error : function() {
 			alert("error");
 		}
 	}); */
/* 
 	$.ajax({
		url :'Url',
		type : 'post',
		dataType : 'json',
		data : {
			nickName : '닉네임',
		},
		success: function(data){
			console.log("성공");
		}
	});
 	 */
 	
/*  	const dataArray = {
 			"user_id" : "1",
 			"project_num" : "2",
 			"sched_info" : "업무내용"
			};
		$.ajax({
			url : "t.ajax",
			type : 'POST',
			data : JSON.stringify(dataArray),
			contentType: 'application/json',
			success : function(data) {
				console.log("data: " + data);
			}
		});
   */
 	  

 
/*  	
 	
    $.ajax({
		 type:"post",
		 url:"t.ajax",
		 dataType:"json", 
		 data:{
	 			user_id : "1",
	 			project_num : "2",
	 			sched_info : "업무내용"
		 },
		 success:function(data){
			alert("성공");
			 print(data)
		 },
		 error:function(request,status,error){
		     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  }
	}); 
 	 
 	 
 	 
 	  */
 	 
 	 
 	 
 	 
 	  
  	
  	
  	
  	
  	
  	
  	
  	
	
        const body = document.querySelector('body');
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.modalBtn');
  
        btnOpenPopup.addEventListener('click', () => {
          modal.classList.toggle('show');
  
          if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
          }
        });
  
        modal.addEventListener('click', (event) => {
          if (event.target === modal) {
            modal.classList.toggle('show');
  
            if (!modal.classList.contains('show')) {
              body.style.overflow = 'auto';
            }
          }
        });
 
       	const addModalBtn = document.querySelector('.addModalBtn');
        addModalBtn.addEventListener('click', () => {
        	console.log(' modal Click!');
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	const dataArray = {
        			sched_num: 1, sched_info: inputInfo.value,
        			sched_prog:0, sched_seq:3,
        			project_num:10
        			};
        		$.ajax({
        			url : "addt.ajax",
        			type : 'POST',
        			data : JSON.stringify(dataArray),
        			contentType: 'application/json',
        			success : function(data) {
        				console.log("data: " + data);
        			}
        		});
			
/*         	var memberId = $("#memberId").val();
        	var memberPass = $("#memberPass").val();
        	
        	var param = {
        			"sched_num": 1, "sched_info": 'test',
        			"sched_prog":0, "sched_seq":3,
        			"project_num":10}
/*         			"memberId":memberId, "memberPass":memberPass */
/*             console.log(param);
        	
        	$.ajax({
        		url : "addtest.ajax",
        		type : "post",
        		data : {
        			sched_num: 1, sched_info: 'test',
        			sched_prog:0, sched_seq:3,
        			project_num:10
        		},
        		success : function(data) {
        					console.log(data);
        	     },
        		error : function() {
        			alert("errorrrrr");
        		}
        	}); */ 
                
        }); 
/*         	
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	
    		const dataArray = {
			};
    		
    		$.ajax({
    			type : 'POST',
    			url : "add.ajax",
    			dataType:"json",
    			data :{    				
    				sched_num: 1, sched_info: 'test',
    				sched_prog:0, sched_seq:3,
    				project_num:10
    			},
    			data : JSON.stringify(dataArray),
   			 success:function(data){
 				alert("성공");
 				 print(data)
 			 },
 			 error:function(request,status,error){
 			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			 }
    		}); */
        	
 
 
		const form = document.getElementById("todo-form");
		const input = document.getElementById("todo-input");
		const todoLane = document.getElementById("todo-lane");
		
		form.addEventListener("submit", (e) => {
		  e.preventDefault();
		  const value = input.value;
		
		  if (!value) return;
		
		  const newTask = document.createElement("p");
		  newTask.classList.add("task");
		  newTask.setAttribute("draggable", "true");
		  newTask.innerText = value;
		
		  newTask.addEventListener("dragstart", () => {
		    newTask.classList.add("is-dragging");
		  });
		
		  newTask.addEventListener("dragend", () => {
		    newTask.classList.remove("is-dragging");
		  });
		
		  todoLane.appendChild(newTask);
		
		  input.value = "";
		});
		
		const draggables = document.querySelectorAll(".task");
		const droppables = document.querySelectorAll(".swim-lane");
		
		draggables.forEach((task) => {
		  task.addEventListener("dragstart", () => {
		    task.classList.add("is-dragging");
		  });
		  task.addEventListener("dragend", () => {
		    task.classList.remove("is-dragging");
		  });
		});
		
		droppables.forEach((zone) => {
		  zone.addEventListener("dragover", (e) => {
		    e.preventDefault();
		
		    const bottomTask = insertAboveTask(zone, e.clientY);
		    const curTask = document.querySelector(".is-dragging");
		
		    if (!bottomTask) {
		      zone.appendChild(curTask);
		    } else {
		      zone.insertBefore(curTask, bottomTask);
		    }
		  });
		});
		
		const insertAboveTask = (zone, mouseY) => {
		  const els = zone.querySelectorAll(".task:not(.is-dragging)");
		
		  let closestTask = null;
		  let closestOffset = Number.NEGATIVE_INFINITY;
		
		  els.forEach((task) => {
		    const { top } = task.getBoundingClientRect();
		
		    const offset = mouseY - top;
		
		    if (offset < 0 && offset > closestOffset) {
		      closestOffset = offset;
		      closestTask = task;
		    }
		  });
		
		  return closestTask;
		};

    </script>
