<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang=ko">
<head>
	<title>Home</title>
	<jsp:include page="/common/Head.jsp" />
 	<link href="https://unpkg.com/fullcalendar@5.10.1/main.min.css" rel='stylesheet' />
    <script src="https://unpkg.com/fullcalendar@5.10.1/main.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Project.css">
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        fetch("http://localhost:8090/Team4_WebProject_2/admin/async")
	            .then(res => res.json())
	            .then(data => {
	                var calendarEl = document.getElementById('calendar');
	                var calendar = new FullCalendar.Calendar(calendarEl, {
	                    initialView: 'dayGridMonth',
	                    events: data
	                });
	                calendar.render();
	            })
	    });
    </script>
</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<jsp:include page="/common/createProject_Modal.jsp" />
				<div id='calendar'></div>
			</div>
		</div>
	</div>
</body>
</html>