<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/common/Head.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>

</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="cardWrapper">
					<div class="mypageCard">
						<!-- <div class="card-header">마이페이지</div> -->
						<div class="mypageCardHeader">${dept.dname}</div>
						<div class="userAvaterWrapper">
							<div class="userAvater">
								<input id="fileImageUpload" class="userImage" type="file" accept="image/*" /> 
								<label class="userImageLabel" for="fileImageUpload"> 
									<img id="fileImg" src="${emp.emp_pic}" alt="userImage" />
								</label>
								<div id="imageButtonWrapper" class="imageButtonWrapper">
									<i class="fa-regular fa-pen-to-square"></i>
								</div>
							</div>
						</div>
						<div class="mypageCardbody">
							<form class="mypageForm">
								<div class="form-group">
									<label for="password">아이디(사원번호)</label> <input type="password"
										class="form-control border rounded-4" id="password" placeholder="${emp.user_id}" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="password">변경 비밀번호</label> <input type="password"
										class="form-control" id="passwordChange" placeholder="password">
								</div>
 								<div class="form-group">
									<label for="password">비밀번호 확인</label> <input type="password"
										class="form-control" id="passwordConfirm" placeholder="password">
								</div>
								<button type="button" class="btn btn-primary w-100" id="submit">변경사항 저장</button>
							</form>
						</div>
					</div>
					<se:authorize access="hasRole('ROLE_USER')">
					<div class="card">
						<div class="card-header">Pie chart</div>
						<div class="card-body">
							<canvas id="chart-line" width="299" height="200"
								class="chartjs-render-monitor"
								style="display: block; width: 400px; height: 250px;"></canvas>
						</div>
					</div>
					</se:authorize>
					<se:authorize access="hasRole('ROLE_ADMIN')">
						<div class="card">
						<div class="card-header">프로젝트별 진행 차트</div>
						<div class="card-body">
										<table class="table table-striped">
											<thead>
												<tr>
													<th width="37%">프로젝트명</th>
													<th width="63%">진행률</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="chart" items="${chart}">
													<tr>
														<td>${chart.projectName}</td>
														<td>
															<div class="grogressWrapper">
																<div class="progress mr-3">
																	<div class="progress-bar bg-success" role="progressbar"
																		style="width: ${chart.projectSchedulePercent}%"
																		aria-valuenow="${chart.projectSchedulePercent}"
																		aria-valuemin="0" aria-valuemax="100"></div>
																	<span>${chart.projectSchedulePercent}%</span>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
						</div>
					</div>
					</se:authorize>
				</div>
			</div>
		</div>
	</div>

	<script>
 	const fileInput = document.getElementById('fileImageUpload');
 	const fileInputButton = document.getElementById('fileImageUpload').files;
	const preview = document.getElementById('fileImg');
	const imageUploadButton = document.getElementById('imageButtonWrapper');
	var fileChange = false;
	
	fileInput.addEventListener('change', (event) =>{
		const file = event.target.files[0];
		console.log(file);
		const reader = new FileReader();
		fileChange = true;
	
		reader.onload = (e) => {
			preview.src = e.target.result;
		};
		
		reader.readAsDataURL(file);
	});
	
	imageUploadButton.addEventListener('click', (event) =>{
		fileInput.click();
	});
	
	$(document).ready(function() {
		// 회원정보 수정 기능
		$('#submit').click(function () {
					console.log("회원정보 수정 클릭");
					console.log($('#passwordChange').val());
					
					 var passwordValue = $("#passwordChange").val();
					 var num = passwordValue.search(/[0-9]/g);
					 var eng = passwordValue.search(/[a-z]/ig);
					 var spe = passwordValue.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

					
					if ($("#passwordChange").val() == "" && $("#passwordConfirm").val() == "" && fileChange == true) {
						const empPic = `$('#emp_pic')[0].files[0].name`;
						const emp = {user_id: ${emp.user_id}, password: `${emp.password}`, emp_pic: empPic};
						var form = $('#userfrom')[0];
						var formData = new FormData(form);
						formData.append('file', $('#fileImageUpload')[0].files[0]);
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
						    enctype:'multipart/form-data',
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
						Swal.fire('변경 완료','변경되었습니다.', 'success');
						return false;
					} else if(($("#passwordChange").val() == "" && fileChange == false) || ($("#passwordConfirm").val() == "" && fileChange == false)) {
						Swal.fire('변경 실패','비밀번호를 입력해주세요', 'warning');
						return false;
					} else if (passwordValue.length < 8 || passwordValue.length > 20){
						 Swal.fire('변경 실패','8자리 ~ 20자리 이내로 입력해주세요.', 'warning');
					  return false;
					 }else if(passwordValue.search(/\s/) != -1){
						 Swal.fire('변경 실패','비밀번호는 공백 없이 입력해주세요.', 'warning');
					  return false;
					 }else if(num < 0 || eng < 0 || spe < 0 ){
						 Swal.fire('변경 실패','영문,숫자,특수문자를 혼합하여 입력해주세요.', 'warning');
					  return false;
					 } else if ($("#passwordChange").val() != $("#passwordConfirm").val() ) {
						 Swal.fire('변경 실패','변경 비밀번호와 확인 비밀번호가 일치하지 않습니다.', 'warning');
					 } else {					 
						const empPic = (fileChange==true) ? `$('#emp_pic')[0].files[0].name` : `${emp.emp_pic}`;
						const emp = {user_id: ${emp.user_id}, password: passwordValue, emp_pic: empPic};
						var form = $('#userfrom')[0];
						var formData = new FormData(form);
						formData.append('file', $('#fileImageUpload')[0].files[0]);
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
						    enctype:'multipart/form-data',
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
						Swal.fire('변경 완료','변경되었습니다.', 'success');
						return true;
					 }
				});
		
		
		/* chart */
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
</body>
</html>