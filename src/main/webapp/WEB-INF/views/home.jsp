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
	        fetch("http://localhost:9090/WebProject_2/admin/async")
	            .then(res => res.json())
	            .then(data => {
	                var calendarEl = document.getElementById('calendar');
	                var calendar = new FullCalendar.Calendar(calendarEl, {
	                    initialView: 'dayGridMonth',
	                    navLinks: true, //month,week,day 선택
	                    events: data,
	                    eventClick: function(info){
	                    	
	                    	var event = info.event;
	                    	
	                    	$('#project_num').text(event.id);
	                    	$('#project_name').text(event.title);
	                    	$('#project_info').text(event.extendedProps.project_info);
	                    	$('#start').text(event.start.toISOString().slice(0, 10));
	                    	$('#end').text(event.end.toISOString().slice(0, 10));

	                        // 모달을 보여줍니다.
	                        $('#eventModal').modal('show');
	                    }
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
				<jsp:include page="/common/detailProject_Modal.jsp" />
				<div id='calendar'></div>
			</div>
		</div>
	</div>
</body>
</html>