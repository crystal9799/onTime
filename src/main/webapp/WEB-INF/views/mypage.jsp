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
		
		$('#submit').click(
				async () => {
 					const emp = {user_id: ${emp.user_id},password:$("#password").val(),emp_pic:$('#emp_pic')[0].files[0].name};
					var form = $('#userfrom')[0];
					var formData = new FormData(form);
					formData.append('file', $('#emp_pic')[0].files[0]);
					formData.append('key', new Blob([JSON.stringify(emp)], {type: 'application/json'}));
					
					 for (var key of formData.keys()) {
						    console.log(key);
						  }
						  for (var value of formData.values()) {
						    console.log(value);
						  }
					
					$.ajax({
						url : "mypage/update.do",
						type : 'POST',
						data : formData,
					    processData:false,
					    contentType:false,
						success : function(data) {
							console.log("mypageUpdate : " + data);
						},
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n"
									+ "message:" + request.responseText + "\n"
									+ "error:" + error);
						},
						complete: function() {
							//location.reload();
						}

					});
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
					<div class="flex">
						<div class="card">
							<div class="card-header">Pie chart</div>
							<div class="card-body" style="height: 320px">
								<canvas id="chart-line" width="299" height="200"
									class="chartjs-render-monitor"
									style="display: block; width: 400px; height: 250px;"></canvas>
							</div>
						</div>
						<div class="card">
							<div class="card-header">Update Employee Info</div>
							<div class="card-body">
								<form id="userFrom" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="password">Password:</label> <input type="password"
											class="form-control" id="password">
									</div>
									<div class="form-group">
										<label for="emp_pic">Employee Picture:</label> <input
											type="file" name="file" class="form-control-file"
											id="emp_pic">
									</div>
									<button type="button" class="btn btn-primary" id="submit">Update</button>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>