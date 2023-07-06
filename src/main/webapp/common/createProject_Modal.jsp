<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<!-- 셀렉터 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script
	src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script type="text/javascript">
$(document).ready(function(){
	$('#deptno').val(${emp.deptno});
    $('#createBttn').click(function() {
        let seq;
        //시퀀스
        fetch('${pageContext.request.contextPath}/admin/getSeq.do')
            .then(res => res.json())
            .then(data => {
                console.log(data.seq);
                seq = data.seq;
                $('#project_num').val(seq);
            })
    });
	
    fetch("${pageContext.request.contextPath}/admin/createProject.do?deptno=${emp.deptno}")
    .then(res => res.json())
    .then(data => {
        const select = document.getElementById("choices-multiple-remove-button");

        // 기존의 option 태그들을 모두 제거
        while(select.firstChild) {
            select.removeChild(select.firstChild);
        }

        data.forEach(emp=>{
            let option = document.createElement('option');
            option.text = emp.ename;
            option.value = emp.user_id;
            select.add(option);
        });

        var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
            removeItemButton: true,
            maxItemCount:10,
            searchResultLimit:8,
            renderChoiceLimit:8
        });

    })
    .catch(error => console.error('Error:', error));
	
    $('form').submit(function(event) {
        event.preventDefault();
		
        var formData = {};
        var projectData = {};
        var emplistData = [];
		const modal = document.getElementById("createProjectModal");
		var nav = document.createElement("li");
		let seq;
 		
 			
        // 프로젝트 정보
        projectData.id = $('#project_num').val();
        projectData.start = $('#start').val();
        projectData.end = $('#end').val();
        projectData.project_info = $('#project_info').val();
        projectData.title = $('#project_name').val();
        projectData.color = $('input[name="colorRadio"]:checked').val();
        projectData.deptno = ${emp.deptno};

        // 직원 목록
        $('#choices-multiple-remove-button option:selected').each(function() {
            var empData = {};
            empData.user_id = $(this).val();
            emplistData.push(empData);
        });

        formData.project = projectData;
        formData.emplist = emplistData;

        var jsonData = JSON.stringify(formData);

        // jsonData를 서버로 전송하는 코드 추가

        console.log(jsonData);
        
        fetch('/Team4_WebProject_2/admin/createProjectOk.do',{
        	method: 'POST',
        	headers: {
        		'Content-Type': 'application/json'
        	},
        	body: jsonData
        })
        .then(res => res.json())
        .then(data => {
        	console.log(data);
        	Swal.fire({
      		  position: 'center',
      		  icon: 'success',
      		  title: '프로젝트 생성 성공',
      		  showConfirmButton: false,
      		  timer: 1500
      		})

        })
        
        .catch(error =>{
        	console.error('Error:', error);
        	console.log("에러뜸");
        })
        
    });

    $('#save').click(function() {
    	Swal.fire(
    			{
    	    		  position: 'center',
    	    		  icon: 'success',
    	    		  title: '등록사원에게 메일전송 되었습니다.',
    	    		  showConfirmButton: false,
    	    		  timer: 1500
    	    		}
    			);
    	});

});
</script>
<se:authorize access="hasRole('ROLE_ADMIN')">
	<button type="button" class="custom-btn btn-12" data-toggle="modal"
		data-target="#createProjectModal" id="createBttn">
		<span>Gen</span><span>Create Project</span></button>
</se:authorize>
<style>
.datepicker table tr td, .datepicker table tr th {
	font-size: 0.4em !important;
}
</style>
<div class="modal fade" id="createProjectModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Create Project</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="createProjectForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="project_num">Project Number</label> <input
							type="number" class="form-control" id="project_num" name="id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="project_num">Dept No</label> <input
							type="number" class="form-control" id="deptno" name="id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="project_name">Project Name</label> <input type="text"
							class="form-control" id="project_name" name="title" required>
					</div>
					<div class="form-group">
						<label for="project_info">Project Info</label>
						<textarea class="form-control" id="project_info"
							name="project_info" rows="3" required></textarea>
					</div>
					<div class="form-group">
						<label for="project_start">Project Start</label> <br> <input
							type="date" id="start" name="start" required>
					</div>
					<div class="form-group">
						<label for="project_end">Project End</label> <br> <input
							type="date" id="end" name="end" required>
					</div>
					<div class="form-group">
						<label for="color">Color</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="colorRadio"
								id="color" value="CornflowerBlue"> <label
								class="form-check-label" for="colorRed">CornflowerBlue</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="colorRadio"
								id="color" value="DarkCyan"> <label
								class="form-check-label" for="colorBlue">DarkCyan</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="colorRadio"
								id="color" value="green"> <label
								class="form-check-label" for="colorGreen">Green</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="colorRadio"
								id="color" value="#4E4CAD"> <label
								class="form-check-label" for="Violet">Vilet</label>
						</div>
					</div>
					<div class="form-group">
						<div class="row d-flex justify-content-center mt-100">
							<div class="col-md-6">
								<select id="choices-multiple-remove-button" name="user_id"
									placeholder="Select Employee" multiple required>

								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">close</button>
					<button type="submit" class="btn btn-primary" id="regist">regist</button>
					<a href="${pageContext.request.contextPath}/main.do" type="button"
						class="btn btn-success" id="save">Save</a>
				</div>
			</form>
		</div>
	</div>
</div>