<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html lang=ko">
<head>

<title>Home</title>
<jsp:include page="/common/Head.jsp" />
<link href="https://unpkg.com/fullcalendar@5.10.1/main.min.css"
	rel='stylesheet' />
<script src="https://unpkg.com/fullcalendar@5.10.1/main.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Project.css">
<script>

    
	    document.addEventListener('DOMContentLoaded', function() {
	        fetch('${pageContext.request.contextPath}/admin/async')
	            .then(res => res.json())
	            .then(data => {
	                var calendarEl = document.getElementById('calendar');
	                var calendar = new FullCalendar.Calendar(calendarEl, {
	                    initialView: 'dayGridMonth',
	                    navLinks: true, //month,week,day 선택
	                    events: data,
	                    eventClick: function(info){
	                    	
	                    	var event = info.event;
	                    	
	                    	$('#project_num2').val(event.id);
	                    	$('#project_name2').val(event.title);
	                    	$('#project_info2').text(event.extendedProps.project_info);
	                    	$('#start2').val(event.start.toISOString().slice(0, 10));
	                    	$('#end2').val(event.end.toISOString().slice(0, 10));
							
	                        // 모달을 보여줍니다.
	                        $('#eventModal').modal('show');
	                        $('#eventModal').on('shown.bs.modal', function (event) {
	                            let defaultLink = "/Team4_WebProject_2/getProjectDetail.do?project_num=";
	                            let project_num = parseInt($('#project_num2').val());
	                            let toScheduleButton = $('#toSchedule');
	                            let hrefLink = defaultLink + project_num;
	                            console.log(hrefLink);
	                            //유저 프로젝트 리스트
	                            let getUserProjectList = ${getUserProjectList};
	                            //부서장 프로젝트 리스트
	                            let getDheaedProjectList = ${getDheaedProjectList};

	                         	// 유저의 권한에 따라 프로젝트 리스트 선택
	                            let projectList;
	                            <se:authorize access="hasRole('ROLE_ADMIN')">
	                              projectList = getDheaedProjectList;
	                            </se:authorize>
	                            <se:authorize access="hasRole('ROLE_USER')">
	                              projectList = getUserProjectList;
	                            </se:authorize>
	                            const result = projectList.includes(project_num);
	                            // 프로젝트 리스트에 project_num이 포함되어 있는지 확인
	                            console.log(projectList.includes(project_num));
	                             if (projectList.includes(project_num)) {
	                            	 $('#toschedule').attr("href", hrefLink);
	                            } else {
	                            	/* $('#toschedule').attr("href", "/Team4_WebProject_2/error"); */
	                            }
	                             $('#toschedule').click(function(e) {
	                            	    if (!result) {
	                            	        e.preventDefault();
	                            	        Swal.fire({
	                            	            position: 'center',
	                            	            icon: 'error',
	                            	            title: '배정받은 사원이 아닙니다.',
	                            	            showConfirmButton: false,
	                            	            timer: 2000
	                            	        }).then(() => {
	                            	            // 알림이 사라진 후에 페이지 로드를 진행합니다.
	                            	            window.location.reload();
	                            	        });
	                            	    }
	                            	});
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
	<script>

</script>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/vendor.bundle.base.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap4.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dataTables.select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/off-canvas.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/hoverable-collapse.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/template.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/todolist.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/Chart.roundedBarCharts.js"></script>

</html>