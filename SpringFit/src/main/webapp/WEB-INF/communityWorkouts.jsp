<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
<title>Community - Workouts</title>

</head>

<body>

	<%-- <%@ include file="navbar.jsp"%> --%>

	<main>
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">

			<h1>Community</h1>

			<c:choose>

				<c:when test="${not empty loggedInUser}">

					<div class="card-container">
						<div class="row">
							<c:forEach var="workout" items="${allWorkouts}">
								<div class="col-md-6 mb-6">
									<div class="card" style="width: 25rem;">
										<div class="card-body">
											<h5 class="card-title">${workout.name}</h5>
											<h6 class="card-subtitle mb-2 text-body-secondary">
												<strong>Created by: </strong>${workout.user.firstName}
											</h6>
											<p class="card-text">
												<strong>Description: </strong>${workout.description != null ? workout.description : 'N/A'}
											</p>
											<a class="btn btn-outline-success" data-bs-toggle="collapse"
												href="#collapse${workout.id}" role="button"
												aria-expanded="false" aria-controls="collapse${workout.id}">
												View Exercises </a> <a href="#" class="btn btn-outline-success">Like</a>
											<a href="#" class="btn btn-outline-success">Comment</a>

											<div class="collapse mt-2" id="collapse${workout.id}">
												<div class="card card-body"
													style="max-height: 150px; overflow-y: auto;">
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
					<p>Please log in to see the community</p>
					<button class="btn btn-link active" type="button"
						data-bs-toggle="collapse" data-bs-target="#loginForm3"
						aria-expanded="false" aria-controls="loginForm">Log in</button>



				</c:otherwise>


			</c:choose>

			<div class="collapse" id="loginForm3"
				style="right: 0; width: 250px; z-index: 1000;">
				<div class="card card-body">
					<form action="login.do" method="POST">
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Log
							in</button>
					</form>

				</div>
			</div>


			<!-- ================================================================================= -->

			<%-- <%@ include file="footer.jsp"%> --%>
	</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>




</html>