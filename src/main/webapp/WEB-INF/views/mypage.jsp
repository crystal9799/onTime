<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<jsp:include page="/common/Head.jsp" />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script>
	$(document).ready(function() {
		var ctx = $("#chart-line");
		var totalnum = ${totalSchedNum};
		var doneNum = ${doneSchedNum};
		var resultDone = (doneNum/totalnum) * 100;
		var resultProg = 100 - resultDone;
		
		var myLineChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "완료", "진행중" ],
				datasets : [ {
					data : [ resultDone, resultProg ],
					backgroundColor : [ "#4b49ac", "#CDCDFF" ]
				} ]
			},
			options : {
				title : {
					display : true,
					text : '업무 진행도'
				}
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="col-sm-8 col-md-6">
					<div class="card">
						<div class="card-header">Pie chart</div>
						<div class="card-body" style="height: 320px">
							<canvas id="chart-line" width="299" height="200"
								class="chartjs-render-monitor"
								style="display: block; width: 400px; height: 250px;"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>