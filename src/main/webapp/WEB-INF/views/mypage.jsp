<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/common/Head.jsp" />
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
									<img id="fileImg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAMFBMVEXFxcX////CwsLGxsb7+/vT09PJycn19fXq6urb29ve3t7w8PDOzs7n5+f5+fnt7e30nlkBAAAFHUlEQVR4nO2dC5qqMAyFMTwUBdz/bq+VYYrKKJCkOfXmXwHna5uTpA+KwnEcx3Ecx3Ecx3Ecx3Ecx3Ecx3Ecx3Ecx3EcA2iO9cdIc5PUdO257y+BU39u66b4HplE3fk6VIcnqmNfl1+gksr6+iIucjl3WYukor7+re6Hoe1y1UhNO3zUd+fUFRmKpOa0Tt6dY5ubRCrOG/QFLk1WGmnt/JxzykcjdZ/jyxJDLlOV2l36AtcsJJb9boG3YcR3DuqODIE3ztYKPkDdmwRmpUToUaSaq++AvRgZMWbOpbQW8hdCAm8ZDugoikzREdCJ2okJPBx6azFLNOwoOgcxojJ98JkaTSJxMpklKrCAKhZGI0drTY/wU5lXoJYibannV9NYy4oozNEAkPHTjop+DTDxVGkIgYJNoyQQJtiIW+EMjGAjm649AjGIaqswcEFQKJ2QPlJbqytki6ZXAAZRJ52J2McaUowzAfs+uFzrYhnzaapphiPWdaJWShqxjqa6kTTQ205TVbsfMa6htL0iYOsXpJrQjHSmCkv1QGPtiHqlYcQ21Gj7fcDU8xOEUuNgSltPzexh+HqFlanCBHZ4OLhCV+gK/3OF6vWvucLv98MUOY2pwu/PS/+D2qJU7pYGbOvDFDW+bbON9p3o3oRxn0bfLgZTgSn6pSfrtr56qLHemtHPTK2319SzGvtjQ9qeb39WgS66Cm073nd0U1PzDdJCO3Gzn6TKpl9Zq7ujGWsQhlA3NwWIMwG9zM08Y/tBrR9VWeczv5CSQuuUNKIUTk23ZJ5RKfVhjnkXotfWIlgX2BSCDYbZR+QTcLhb3dKZDUY2M0d4KWItwhHRah/zsrOgKw4wycwjcgEVcgQDQo23CqSiWEJkFAfod2oE1uIFdA1OsCPqFXYNTjCfb8Ez+iX2x5sKLlVbhtqdDcar9ZevhnbZxoBUD35k23t0d304LYs1ELVbnfFaZ/REJJX9niP8Q19moZGo3m8XR/yBvOnjFfsXcI2c8ZuNo7WMP5HQh6yRGrlmFOJTnyTcT+zRlqPUBI2gTVWNUzUna1ERgecgF4GpNBQ38jGqxVLzQA1A31Rrhk6Yz9QEh/WND0GnuG9huhiTXJkxfAizTHLr6cbJKN6UCU6x/2DTRE1xEeEXi3O0ZUqBN4nJRzHhFB1JPlFTBZlI2kQ8zc3KJ1Le8DIRmFJiknuVS6RK4Ej/JtBfJErDSzOBiY4wJHX6Z1I4v1GUmdCPNirnLLeg3oJLcbX5PcpHNbRvOa1A956QmRPOUXVF+zkaUJynpkYR0bOMJH2nNej1pqyV/aKkz9jr5yj5vrXXz1F5SQLACiMapmierj2ikLyleKdlA/I/2oFxiglxx9B+mHwz0lf34IZQfhDRhlD6bhvgEAoPYooHkTczSIZTLC+cEExsoNKZiGBiY9cCfo/Y/SjIOBMQizWWTe73CMUasJx7jlD+DdKdWUKoY4PRYFtGpO0G1Lx4RaadgTtJhf4fiGqGIwKWCGuGIwKWqP+7IxYCzygjR9IAO5pC7Da9g70TBVpWRNgFBlgT8RV2WxHbKwJMv4BOaEaYaU2K16yZMN/qgV+G7IWIvwyZCxHeDQMsR8wg0DBDDXB5H2EV+hkEGmaoySHQsEJNFoGGFWrAq98JRhUMX1iMMMqLLEIpK5jCbd4vw9nSt/72lewXiN6jmdjfq8Hdknlk92ZwJnbIMMRM7JBhiFlUFoHd1UWaP1QKsPsHA5mkNB+Smn9JqV3wskatnQAAAABJRU5ErkJggg==" alt="userImage" />
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
										class="form-control" id="confirmPassword" placeholder="password">
								</div>
								<button type="button" class="btn btn-primary w-100" id="submit">변경사항 저장</button>
							</form>
						</div>
					</div>
					<div class="card">
						<div class="card-header">Pie chart</div>
						<div class="card-body">
							<canvas id="chart-line" width="299" height="200"
								class="chartjs-render-monitor"
								style="display: block; width: 400px; height: 250px;"></canvas>
						</div>
					</div>
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
					const password = document.getElementById('password').value;
					const empPic = (fileChange==true) ? `$('#emp_pic')[0].files[0].name` : `${emp.emp_pic}`;
						const emp = {user_id: ${emp.user_id}, password: $('#passwordChange').val(), emp_pic: empPic};
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