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
                events: [
                    {
                    	project_id: '11',
                        title: 'Event 1',
                        start: '2023-07-01',
                        end: '2023-07-08',
                        color: 'tomato',
                    },
                    {
                        title: 'Event 2',
                        start: '2023-07-02',
                    },
                    {
                        title: 'Event 3',
                        start: '2023-07-03',
                    }
                ]
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