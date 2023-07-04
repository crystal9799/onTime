<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	        fetch('http://192.168.0.33:8090/Team4_WebProject_2/admin/async')
	            .then(res => res.json())
	            .then(data => {
	                var calendarEl = document.getElementById('calendar');
	                var calendar = new FullCalendar.Calendar(calendarEl, {
	                    initialView: 'dayGridMonth',
	                    navLinks: true, //month,week,day 선택
	                    events: data,
	                    eventClick: function(info){
	                    	
	                    	var event = info.event;
	                    	
	                        console.log(event.id); // Log each field to the console
	                        console.log(event.title);
	                        console.log(event.extendedProps.project_info);
	                        console.log(event.start.toISOString().slice(0, 10));
	                        console.log(event.end.toISOString().slice(0, 10));
	                    	
	                    	$('#project_num2').val(event.id);
	                    	$('#project_name2').val(event.title);
	                    	$('#project_info2').text(event.extendedProps.project_info);
	                    	$('#start2').val(event.start.toISOString().slice(0, 10));
	                    	$('#end2').val(event.end.toISOString().slice(0, 10));

	                        // 모달을 보여줍니다.
	                        $('#eventModal').modal('show');
	                        $('#eventModal').on('shown.bs.modal', function (event) {
	                            let defaultLink = "/Team4_WebProject_2/schedule.do?project_num=";
	                            let project_num = $('#project_num2').val();
	                            let hrefLink = defaultLink + project_num;
	                            console.log(hrefLink);
	                            $('#toschedule').attr("href", hrefLink);
	                        });
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