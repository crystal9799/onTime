<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>d</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	defer></script>


<style>
/* ---- RESET/BASIC STYLING ---- */
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: sans-serif;
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
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
	background: #f4f4f4;
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
</style>

</head>

<!-- <script type="text/javascript">
window.onload=function(){
		const body = document.querySelector('body');
		const modal = document.querySelector('.modal');
		const btnOpenPopup = document.querySelector('.btn-open-popup');
		
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
			console.log('test');
		});
		
	}
</script> -->

<body>

	<a href="${pageContext.request.contextPath}/admin/viewtest.do">ModalPageTest</a><br>
	<a href="${pageContext.request.contextPath}/admin/kanbanviewtest.do">KanbanonlyViewPageTest</a><br>
	<a href="${pageContext.request.contextPath}/admin/scheduletest.do">ajaxDataTestPage</a>

	 




	<script type="text/javascript">
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

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



	</script>
</body>
</html>
