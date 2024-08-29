
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

<head>
<meta charset="UTF-8">
<title>Update Exercise</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

	<%@ include file="navbar.jsp"%>


	<main>

		<div class="container mt-5">



			<c:forEach var="exercise" items="${workoutExercises}"
				varStatus="status">
				<form action="updateWorkoutExercise.do" method="POST">
					<input type="hidden" name="workoutId"
						value="${workout.id}"> <input type="hidden"
						name="workoutExerciseId" value="${exercise.id}"> <input
						type="hidden" name="workoutExercises[${status.index}].id"
						value="${exercise.id}">
					<h4>${exercise.exercise.name }</h4>
					<div class="mb-3">
						<label for="notes" class="form-label">Notes:</label> <input
							type="text" class="form-control" id="notes" name="notes"
							value="${exercise.notes}">
					</div>

					<div class="mb-3">
						<label for="units${status.index}" class="form-label">Units:</label>
						<input type="number" class="form-control"
							id="units${status.index}" name="units" value="${exercise.units}">
					</div>

					<div class="mb-3">
						<label for="sets${status.index}" class="form-label">Sets:</label>
						<input type="number" class="form-control" id="sets${status.index}"
							name="sets" value="${exercise.sets}">
					</div>

					<button type="submit" class="btn btn-primary">Update
						Exercise</button>

				</form>
				
				
				<form action="deleteWorkoutExercise.do" method="POST">
					<input type="hidden" name="workoutExerciseId"
						value="${exercise.exercise.id}" /> 
						<input type="hidden" name="workoutId" value="${workout.id}" />
					<button type="submit" class="btn btn-sm btn-outline-secondary">Delete</button>
				</form>
			</c:forEach>


			<a href="profile.do" class="btn btn-primary">Finish update</a> </br>
			<%@ include file="footer.jsp"%>
	</main>






	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>
