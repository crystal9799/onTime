<!-- index.jsp -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Todo List</title>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />--%>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
</head>
<body>
<h1>Todo List</h1>
<div id="calendar"></div>
<button onclick="openModal()">일정 생성</button>
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <form id="eventForm">
      <label for="title">일정 제목:</label>
      <input type="text" id="title" name="title"><br><br>
      <label for="start">시작일:</label>
      <input type="datetime-local" id="start" name="start"><br><br>
      <label for="end">종료일:</label>
      <input type="datetime-local" id="end" name="end"><br><br>
      <input type="button" value="생성하기" onclick="createEvent()">
    </form>
  </div>
</div>

<script>
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      events: '/events',
      editable: true,
      eventDrop: function(event, delta, revertFunc) {
        // 이벤트를 드래그해서 날짜를 변경한 경우
        // 변경된 일정을 서버로 전송하여 업데이트 처리
        updateEvent(event);
      },
      eventResize: function(event, delta, revertFunc) {
        // 이벤트의 길이를 조절한 경우
        // 변경된 일정을 서버로 전송하여 업데이트 처리
        updateEvent(event);
      }
    });
  });

  function openModal() {
    document.getElementById('myModal').style.display = 'block';
  }

  function closeModal() {
    document.getElementById('myModal').style.display = 'none';
  }

  function createEvent() {
    var title = document.getElementById('title').value;
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;

    var event = {
      title: title,
      start: start,
      end: end
    };

    // 생성한 일정을 서버로 전송하여 DB에 저장
    fetch('/createEvent', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(event)
    })
            .then(function(response) {
              if (response.ok) {
                closeModal();
                $('#calendar').fullCalendar('refetchEvents');
              }
            })
            .catch(function(error) {
              console.log(error);
            });
  }

  function updateEvent(event) {
    // 변경된 일정을 서버로 전송하여 업데이트 처리
    fetch('/updateEvent', {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(event)
    })
            .then(function(response) {
              if (!response.ok) {
                revertFunc(); // 업데이트 실패 시 원래대로 되돌리기
              }
            })
            .catch(function(error) {
              console.log(error);
              revertFunc(); // 업데이트 실패 시 원래대로 되돌리기
            });
  }
</script>
</body>
</html>
