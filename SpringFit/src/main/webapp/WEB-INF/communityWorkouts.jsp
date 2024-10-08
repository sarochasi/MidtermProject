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

	<%@ include file="navbar.jsp"%>

	<main>
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">

			<h1>Community Board</h1>

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
												View Exercises </a>

											<form action="likeWorkout.do" method="POST"
												style="display: inline;">
												<input type="hidden" name="workoutId" value="${workout.id}" />
												<button type="submit" class="btn btn-outline-success">Like
													(${workout.likeCount})</button>
											</form>

											<c:if test="${not empty workout.workoutComments}">
												<ul class="list-group mt-3">
													<c:forEach var="comment" items="${workout.workoutComments}">
														<li class="list-group-item"><strong>${comment.user.firstName}:</strong>
															${comment.content} <br /> <small class="text-muted">${comment.createDate}</small>
														</li>
													</c:forEach>
												</ul>
											</c:if>
											<c:if test="${empty workout.workoutComments}">
												<p>No comments yet. Be the first to comment!</p>
											</c:if>

											<form action="CreatingComment.do" method="POST">
												<input type="hidden" value="${workout.id }" name="workoutId" />
												<div class="form-floating mb-3">
													<input type="text" class="form-control" id="floatingInput"
														name="content" placeholder="comment"> <label
														for="floatingInput">Comment</label>
												</div>
												<button class="btn btn-lg btn-primary" type="submit">Comment</button>
											</form>

										</div>
									</div>

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
							</c:forEach>
						</div>
					</div>

				</c:when>

				<c:otherwise>
					<p>Please log in to see all exercise</p>
					<button class="btn btn-link active" type="button"
						data-bs-toggle="collapse" data-bs-target="#loginForm4"
						aria-expanded="false" aria-controls="loginForm">Log in</button>

				</c:otherwise>
			</c:choose>

			<div class="collapse" id="loginForm4"
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
					<form action="registerForm.do" method="GET">
						<p>
							Not a member?
							<button type="submit" class="text-body-secondary btn btn-link">Sign
								up</button>
						</p>
					</form>
				</div>

			</div>
			<!-- ================================================================================= -->

			<%@ include file="footer.jsp"%>
	</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>




</html>