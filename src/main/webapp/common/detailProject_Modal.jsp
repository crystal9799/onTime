<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="eventModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body">
				<label for="project_num">Project Number</label> <input type="number"
					class="form-control" id="project_num2" name="id"
					disabled="disabled"> <label for="project_name">Project
					Name</label> <input type="text" class="form-control" id="project_name2"
					name="title" disabled="disabled"> <label for="project_info">Project
					Info</label>
				<textarea class="form-control" id="project_info2"
					name="project_info" rows="3" disabled="disabled"></textarea>

				<label for="project_start">Project Start</label> <br> <input
					type="date" id="start2" name="start" disabled="disabled"> <br>
				<label for="project_end">Project End</label> <br> <input
					type="date" id="end2" name="end" disabled="disabled">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
				<a type="button" class="btn btn-success" id="toschedule">toSchedule</a>
			</div>
		</div>
	</div>
</div>