<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>mypage</title>
    <jsp:include page="/common/Head.jsp" />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
    <script>
        function updateEmpInfo() {
            var emp = {
                user_id: ${emp.user_id}, // 해당 사용자의 ID 값
                password: document.getElementById("password").value,
                emp_pic: document.getElementById("emp_pic").files[0]
            };

            var formData = new FormData();
            formData.append("emp", JSON.stringify(emp));

            fetch("/mypage/update.do", {
                method: "PUT",
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw new Error("Update failed");
                }
            })
            .then(data => {
                console.log(data); // 성공적으로 업데이트된 경우의 처리
            })
            .catch(error => {
                console.error(error); // 업데이트 실패한 경우의 처리
            });
        }
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
                            <canvas id="chart-line" width="299" height="200" class="chartjs-render-monitor"
                                style="display: block; width: 400px; height: 250px;"></canvas>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">Update Employee Info</div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" class="form-control" id="password">
                                </div>
                                <div class="form-group">
                                    <label for="emp_pic">Employee Picture:</label>
                                    <input type="file" class="form-control-file" id="emp_pic">
                                </div>
                                <button type="button" class="btn btn-primary" onclick="updateEmpInfo()">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
