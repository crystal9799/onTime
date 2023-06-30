<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang=ko">
<head>
	<title>Home</title>
	<jsp:include page="/common/Head.jsp" />
	<link href="https://unpkg.com/fullcalendar@5.10.1/main.min.css" rel='stylesheet' />
    <script src="https://unpkg.com/fullcalendar@5.10.1/main.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: ${projectlists},
                eventClick: function(info) {
                    alert('Event: ' + info.event.title);
                    info.jsEvent.preventDefault();
                }
            });
            
            calendar.render();
        });
    </script>
</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<div id='calendar'></div>
			</div>
		</div>
	</div>
</body>
</html>