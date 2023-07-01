
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
<style>
 {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: sans-serif;
	-ms-overflow-style: none; 
	scrollbar-width: none;  
}

*::-webkit-scrollbar {
	display: none;
}

.board {
	width: 100%;
	height: 100vh;
	overflow: scroll;
	background-position: center;
	background-size: cover;
}


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



/* ---- BOARD ---- */
.lanes {
	display: flex;
	align-items: flex-start;
	justify-content: start;
	gap: 16px;
	padding: 24px 32px;
	overflow: scroll;
	height: 100%;
}

.heading {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 8px;
}

.swim-lane {
	display: flex;
	flex-direction: column;
	gap: 12px; 
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	padding: 12px;
	border-radius: 4px;
	width: 225px;
	min-height: 120px;
	flex-shrink: 0;
}

.task {
	background: white;
	color: black;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
	padding: 12px;
	border-radius: 4px;
	font-size: 16px;
	cursor: move;
}

.is-dragging {
	scale: 1.05;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: rgb(50, 50, 50);
	color: white;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
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
						Modal<br> <br> 
						<input type="text" placeholder="입력" id="todo-input" /> <br> <br>
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




	<script>
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
        	console.log('addBtn modal !Click!');
        	
/*         	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);    */
        	
    		const param = {
			};
        	
    		$.ajax({
    			url : "test.action",
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
    				alert("error");
    			}
    		});
        	
        	
        });
        	
        	
/* 	        $.ajax({
	            url: "insertProc.do",
	            type: "POST",
	            data: $('#frm').serialize(),
	            success: function(data){
	                location.href="listUser.do";
	            },
	            error: function(){  alert("신규등록 error");  }
	        });
        	 */
        	
/*     	    ajax("sendAjax.vo", param);
        });

/*    
        const ajax = function(url, data){
            console.log("ajax", url, data);
            const xhr = new XMLHttpRequest();
            xhr.open("POST", url);
            xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8;");
            xhr.responseType = "json";
            xhr.onload = function(e) {
                console.log(this, e);
            };
            xhr.send(JSON.stringify(data));
        }  
    		 */
    		
/*     		$.ajax({
    			type : 'POST',
    			url : "add.ajax",
    			dataType:"json",
    			contentType : "application/json",
    			data :{    				
    				sched_num: 1, sched_info: 'test',
    				sched_prog:0, sched_seq:3,
    				project_num:10
    			},
/*     			data : JSON.stringify(dataArray), 
   			 success:function(data){
 				alert("성공");
 				 print(data)
 			 },
 			 error:function(request,status,error){
 			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			 }
    		});
        	
        }); */
/*         const addModalBtn = document.querySelector('.addModalBtn');
        addModalBtn.addEventListener('click', () => {
        	console.log('addBtn modal Click!');
        	
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	
    		const dataArray = {

    		}; 
    		
    		$.ajax({
    			type : 'POST',
    			url : "add.ajax",
    			dataType:"json",
    			data :{    				
    				sched_num: 0, 
    				sched_info: inputInfo.value,
    				sched_prog:0,
    				sched_seq:0,
    				project_num: 10
    			},
    			data : JSON.stringify(dataArray),
   			 success:function(data){
 				alert("성공");
 				 print(data)
 			 },
 			 error:function(request,status,error){
 			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			  }
    		});
        	
        }); */
/*         const addModalBtn = document.querySelector('.addModalBtn');
        addModalBtn.addEventListener('click', () => {
        	console.log('addBtn modal Click!');
        	
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	
    		const dataArray = {
    				sched_num: 0, 
    				sched_info: inputInfo.value,
    				sched_prog:0,
    				sched_seq:0,
    				project_num: 10
    		}; 
    		
    		$.ajax({
    			url : "add.ajax",
    			type : 'POST',
    			data : JSON.stringify(dataArray),
    			contentType: 'application/json',
    			success : function(data) {
    				console.log("data: " + data);
    			}
    		});
        	
        }); */
      </script>

	<script type="text/javascript">
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


</body>
</html>