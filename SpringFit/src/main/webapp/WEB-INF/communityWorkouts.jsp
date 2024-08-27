<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

<head>
<meta charset="UTF-8">
<title>Community - Workouts</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<main>
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">

			<!-- For each workout, that has been associated with a user, display that workout -->
			<h1>Community</h1>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>Workout name</th>
						<th>Description</th>
						<!-- <th>Image URL</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="workout" items="${allWorkouts}">
						<tr>
							<td>${workout.name}</td>
							<td>${workout.description}</td>
							<%-- <td>${workout.imageUrl}</td> --%>
							<td><a class="btn btn-info btn-sm"
								href="showExercisesWithinWorkout.do?workoutId=${workout.id}">Workout
									Details</a></td>
							<!-- Should a workout's details display on seperate jsp? -->
							<%-- href="details.do?id=${workout.id}">View Details</a></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>

<%-- 			<c:forEach var="workout" items="${allWorkouts}">
    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title">${workout.name}</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">${workout.user.firstName}</h6>
            <p class="card-text">${workout.description}</p>
            <a href="#" class="card-link">See detail</a>
            <button type="button" class="btn btn-link active"
                data-bs-toggle="collapse"
                data-bs-target="#workoutDetail${workout.id}"
                aria-expanded="false" aria-controls="workoutDetail${workout.id}">See workout</button>
        </div>
    </div>

    <div class="collapse mt-2" id="workoutDetail${workout.id}">
        <div class="card card-body">
            <c:if test="${not empty workout.workoutExercises}">
                <c:forEach var="exercise" items="${workout.workoutExercises}">
                    <div class="mb-3">
                        <label class="form-label">${exercise.name}</label>
                        <p>${exercise.description}</p>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty workout.workoutExercises}">
                <p>No exercises available for this workout.</p>
            </c:if>
        </div>
    </div>
</c:forEach> --%>



			<!-- ================================================================================= -->

			<%@ include file="footer.jsp"%>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>




</html>