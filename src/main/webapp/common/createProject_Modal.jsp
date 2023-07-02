<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-multiselect.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-multiselect.js"></script>

<script type="text/javascript">
    
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
                            <input class="form-check-input" type="radio" name="colorRadio" id="color" value="CornflowerBlue">
                            <label class="form-check-label" for="colorRed">CornflowerBlue</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="colorRadio" id="color" value="DarkCyan">
                            <label class="form-check-label" for="colorBlue">DarkCyan</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="colorRadio" id="colorGreen" value="green">
                            <label class="form-check-label" for="colorGreen">Green</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <select id="multiselect_gamePlatform" multiple="multiple" name="gamePlatform">
						  <option value="PC">PC</option>
						  <option value="SWITCH">SWITCH</option>
						  <option value="PS3">PS3</option>
						  <option value="PS4">PS4</option>
						  <option value="PS5">PS5</option>
						  <option value="Xbox 360">Xbox 360</option>
						  <option value="Xbox One">Xbox One</option>
						  <option value="Xbox Series X">Xbox Series X</option>
						  <option value="Xbox Series S">Xbox Series S</option>
						</select>
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
    $('#multiselect_gamePlatform').multiselect();        

});
</script>
