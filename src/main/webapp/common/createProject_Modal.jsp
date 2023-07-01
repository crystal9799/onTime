<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    fetch("http://192.168.0.33:8090/Team4_WebProject_2/admin/createProject.do?deptno=10")
	        .then(res => res.json())
	        .then(data => {
	            const empList = document.querySelector('#empList');
	
	            // Clear existing options
	            empList.innerHTML = '';
	
	            // Append new options
	            data.forEach(emp => {
	                const option = document.createElement('option');
	                option.text = emp.ename;
	                empList.add(option);
	            });
	        });
	});
</script>

<button type="button" class="custom-btn btn-8" data-toggle="modal" data-target="#createProjectModal">
    Create Project
</button>
<style>
	.datepicker table tr td, .datepicker table tr th {
    font-size: 0.875em !important;
	}
</style>
<div class="modal fade" id="createProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create Project</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="project_name">Project Name</label>
                        <input type="text" class="form-control" id="project_name">
                    </div>
                    <div class="form-group">
                        <label for="project_info">Project Info</label>
                        <textarea class="form-control" id="project_info" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="project_start">Project Start</label>
                        <input type="text" class="form-control datepicker" id="project_start">
                    </div>
                    <div class="form-group">
                        <label for="project_end">Project End</label>
                        <input type="text" class="form-control datepicker" id="project_end">
                    </div>
                    <div class="form-group">
                        <label for="color">Color</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="colorRadio" id="colorRed" value="red">
                            <label class="form-check-label" for="colorRed">Red</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="colorRadio" id="colorBlue" value="blue">
                            <label class="form-check-label" for="colorBlue">Blue</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="colorRadio" id="colorGreen" value="green">
                            <label class="form-check-label" for="colorGreen">Green</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empList">Employees</label>
                        <div class="form-control" id="empList">
                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd'
    });
});
</script>
