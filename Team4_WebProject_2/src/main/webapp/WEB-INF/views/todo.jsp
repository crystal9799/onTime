<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Todo List</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: function(start, end, timezone, callback) {
          fetch('/todo')
                  .then(response => response.json())
                  .then(data => {
                    var events = [];
                    data.forEach(item => {
                      events.push({
                        title: item.title,
                        start: item.startDate,
                        end: item.endDate
                      });
                    });
                    callback(events);
                  });
        },
        selectable: true,
        select: function(start, end) {
          $('#modal').modal('show'); // 모달 열기

          // 폼 제출 이벤트
          $('#createBtn').click(function() {
            var title = $('#titleInput').val();
            if (title) {
              var eventData = {
                title: title,
                startDate: start.format('YYYY-MM-DD'),
                endDate: end.format('YYYY-MM-DD')
              };
              fetch('/todo', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(eventData)
              })
                      .then(response => {
                        $('#modal').modal('hide'); // 모달 닫기
                        $('#calendar').fullCalendar('refetchEvents');
                      });
            }
          });

          $('#calendar').fullCalendar('unselect');
        }
      });
    });
  </script>
</head>
<body>
<div id="calendar"></div>

<!-- 생성 모달 -->
<div id="modal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">일정 생성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="createForm">
          <div class="form-group">
            <label for="titleInput">일정 제목</label>
            <input type="text" class="form-control" id="titleInput" required>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="createBtn">생성</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
