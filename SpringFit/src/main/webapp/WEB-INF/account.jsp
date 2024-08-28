<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
.scrolling-wrapper {
	overflow-x: auto;
	white-space: nowrap;
	padding: 10px 0;
}

.scrolling-wrapper .card {
	display: inline-block;
	width: 200px;
	margin-right: 10px;
}
</style>

</head>


<body>

	<%@ include file="navbar.jsp"%>
	<%--Edit the file nav.jsp to change nav links (navbar code to be contained in navbar; will only need to plug into each jsp)--%>
	<%-- <jsp:include page="nav.jsp" /> --%>

	<main>

		<div class="container col-xl-10 col-xxl-8 px-4 py-5">

			<!-- <h2>Account Details</h2> -->
			<h2>Welcome ${loggedInUser.firstName}!</h2>
			<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->

			<!-- SESSION  -->
			<c:choose>
				<c:when test="${not empty sessionScope.loggedInUser}">

					<div class="container-fluid">
						<div class="d-flex justify-content-between align-items-center">
							<h3>Your Workouts</h3>

							<form action="IntializeWorkout.do" method="GET">
								<button type="button" class="btn btn-info"
									data-bs-toggle="collapse" data-bs-target="#createWorkoutForm"
									aria-expanded="false" aria-controls="createWorkoutForm">Create
									New Workout</button>
							</form>
						</div>
					</div>

					<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->

					<div class="collapse mt-2" id="createWorkoutForm">
						<div class="card card-body">

							<form action="InitializeWorkout.do" method="GET">
								<div class="mb-3">
									<label for="workoutName" class="form-label">Workout
										name</label> <input type="text" class="form-control" id="workoutName"
										name="name" required>
								</div>

								<div class="mb-3">
									<label for="workoutDescription" class="form-label">Description</label>
									<input type="text" class="form-control" id="workoutDescription"
										name="description">
								</div>

								<div class="mb-3">
									<label for="imageUrln" class="form-label">Image url</label> <input
										type="text" class="form-control" id="imageUrl" name="imageUrl">
								</div>

								<button type="submit" class="btn btn-primary w-100">Create
									workout</button>
							</form>
						</div>
					</div>

					<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
					<!--  USER  -->

					<div class="card-container">
						<div class="row">
							<c:forEach var="workout" items="${myWorkouts}">
								<div class="col-md-4 mb-4">
									<div class="card" style="width: 18rem;">
										<div class="card-body">
											<h5 class="card-title">${workout.name}</h5>
											<h6 class="card-subtitle mb-2 text-body-secondary">
												<strong>Created by: </strong>${user.firstName}
											</h6>
											<p class="card-text">
												<strong>Description: </strong>${workout.description != null ? workout.description : 'N/A'}
											</p>
											<a class="btn btn-outline-info" data-bs-toggle="collapse"
												href="#collapse${workout.id}" role="button"
												aria-expanded="false" aria-controls="collapse${workout.id}">
												View Exercises </a> <a href="#" class="btn btn-outline-info">Edit</a>


											<form action="deleteWorkout.do" method="POST">
												<input type="hidden" name="workoutId" value="${workout.id}" />
												<button type="submit" class="btn btn-outline-info">Delete</button>
											</form>

											<div class="collapse mt-2" id="collapse${workout.id}">
												<div class="card card-body">
													<ul>
														<c:if test="${not empty workout.workoutExercises}">
															<c:forEach var="exercise"
																items="${workout.workoutExercises}">
																<li><strong>${exercise.exercise.name}</strong><br />
																	Units: ${exercise.units}<br /> Sets: ${exercise.sets}<br />
																	Notes: ${exercise.notes != null ? exercise.notes : 'N/A'}<br />
																</li>
															</c:forEach>
														</c:if>
														<c:if test="${empty workout.workoutExercises}">
															<li>No exercises found for this workout.</li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

				</c:when>

				<c:otherwise>
					<p>Please log in to see the profile</p>
					<button class="btn btn-link active" type="button"
						data-bs-toggle="collapse" data-bs-target="#loginFormInProfile"
						aria-expanded="false" aria-controls="loginFormInProfile">Log
						in</button>
				</c:otherwise>

			</c:choose>


			<!-- ----------------------------------------------------------------WILL NEED TO UPDATE ONCE WE HAVE FAV FUNCTIONING--------------------------------- -->
			<!-- FAVORITE -->
			<h3>Your Favorite Workouts</h3>
			<div class="card-container">
				<div class="row">
					<c:forEach var="workout" items="${myWorkouts}">
						<div class="col-md-4 mb-4">
							<div class="card" style="width: 18rem;">
								<div class="card-body">
									<h5 class="card-title">${workout.name}</h5>
									<h6 class="card-subtitle mb-2 text-body-secondary">
										<strong>Created by: </strong>${user.firstName}
									</h6>
									<p class="card-text">
										<strong>Description: </strong>${workout.description != null ? workout.description : 'N/A'}
									</p>
									<a class="btn btn-outline-info" data-bs-toggle="collapse"
										href="#collapse${workout.id}" role="button"
										aria-expanded="false" aria-controls="collapse${workout.id}">
										View Exercises </a> <a href="#" class="btn btn-outline-info">Edit</a>


									<form action="deleteWorkout.do" method="POST">
										<input type="hidden" name="workoutId" value="${workout.id}" />
										<button type="submit" class="btn btn-outline-info">Delete</button>
									</form>

									<div class="collapse mt-2" id="collapse${workout.id}">
										<div class="card card-body">
											<ul>
												<c:if test="${not empty workout.workoutExercises}">
													<c:forEach var="exercise"
														items="${workout.workoutExercises}">
														<li><strong>${exercise.exercise.name}</strong><br />
															Units: ${exercise.units}<br /> Sets: ${exercise.sets}<br />
															Notes: ${exercise.notes != null ? exercise.notes : 'N/A'}<br />
														</li>
													</c:forEach>
												</c:if>
												<c:if test="${empty workout.workoutExercises}">
													<li>No exercises found for this workout.</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
			<!-- Today's Numbers / Health? -->

			<h3>Weight & Nutrition</h3>
			<table class="table table-bordered">
				<thead></thead>

				<tbody>
					<tr>
						<!-- <td>Current Weight</td> -->
						<td>
							<form action="submitWeight.do" method="POST">
								<input type="number" class="form-control" name="weight"
									placeholder="Enter your weight" required>
								<button type="submit" class="btn btn-outline-info">Submit
									Weight</button>
							</form>


							<form action="openWeight.do" method="POST">
								<button class="btn btn-info" type="submit">Open weight</button>
							</form>
						</td>
					</tr>
				</tbody>
			</table>

			<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
			<!-- ---------------------------------------------------NUTRITION------------------------------------------------------------------------------ -->
			<!-- <td>Track your macros!</td> -->
			<td><legend class="form-label"></legend>
				<form action="addNutrition.do" method="POST">

					<div class="col-md-4">
						<label for="zip" class="form-label"></label> <input type="date"
							class="form-control" id="dateEaten" name="dateEaten"
							placeholder="YYYY-MM-DD">
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="name" name="name"
							value="Breakfast"> <label class="form-check-label"
							for="name">Breakfast</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="name" name="name"
							value="Lunch"> <label class="form-check-label"
							for="lunch">Lunch</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="name" name="name"
							value="Dinner"> <label class="form-check-label"
							for="lunch">Dinner</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="name" name="name"
							value="Snack"> <label class="form-check-label"
							for="lunch">Snack</label>
					</div>

					<input type="number" class="form-control" name="gramsCarbohydrates"
						placeholder="Enter carbohydrates (in grams)" required>
					<!-- <button type="submit" class="btn btn-info">Submit
									Carbohydrates</button> -->
					<input type="number" class="form-control" name="gramsFat"
						placeholder="Enter fat (in grams)" required>
					<!-- <button type="submit" class="btn btn-info">Submit Fat</button> -->
					<input type="number" class="form-control" name="gramsProtein"
						placeholder="Enter protein (in grams)" required>
					<button type="submit" class="btn btn-info">Submit</button>
				</form></td>
			</tr>
			</tbody>
			</table>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->



		<!-- Footer -->
		<%@ include file="footer.jsp"%>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>



</html>


