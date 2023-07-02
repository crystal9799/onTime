<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 셀렉터 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" /> -->
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
	    
	    var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
	       removeItemButton: true,
	       maxItemCount:5,
	       searchResultLimit:5,
	       renderChoiceLimit:5
	    }); 
	    
	    
	});
</script>

<button type="button" class="custom-btn btn-8" data-toggle="modal" data-target="#createProjectModal">
    Create Project
</button>
<style>
	.datepicker table tr td, .datepicker table tr th {
    font-size: 0.4em !important;
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
                        <br>
                        <input type="date" id="birthday" name="Project_Start">
                    </div>
                    <div class="form-group">
                        <label for="project_end">Project End</label>
                        <br>
                        <input type="date" id="birthday" name="Project_End">
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
						<div class="row d-flex justify-content-center mt-100">
						    <div class="col-md-6"> <select id="choices-multiple-remove-button" placeholder="Select Employee" multiple>
						            <option value="1">철수</option>>
						            <option value="2">철수2</option>>
						            <option value="HTML">HTML</option>
						            <option value="Jquery">Jquery</option>
						            <option value="CSS">CSS</option>
						            <option value="Bootstrap 3">Bootstrap 3</option>
						            <option value="Bootstrap 4">Bootstrap 4</option>
						            <option value="Java">Java</option>
						            <option value="Javascript">Javascript</option>
						            <option value="Angular">Angular</option>
						            <option value="Python">Python</option>
						            <option value="Hybris">Hybris</option>
						            <option value="SQL">SQL</option>
						            <option value="NOSQL">NOSQL</option>
						        </select> </div>
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