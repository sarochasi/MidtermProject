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





			<!-- ================================================================================= -->

			<%@ include file="footer.jsp"%>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>




</html>