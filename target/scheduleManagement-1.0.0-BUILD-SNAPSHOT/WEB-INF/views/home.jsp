<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang=ko">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">

<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="resources/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="resources/images/favicon.png" />
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			titleFormat : function(date) {
				return `${date.date.year}„ ${date.date.month + 1}›”`;
			},
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
	<script src="resources/js/vendor.bundle.base.js"></script>
	<script src="resources/js/Chart.min.js"></script>
	<script src="resources/js/jquery.dataTables.js"></script>
	<script src="resources/js/dataTables.bootstrap4.js"></script>
	<script src="resources/js/dataTables.select.min.js"></script>
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/Chart.roundedBarCharts.js"></script>
</body>
</html>