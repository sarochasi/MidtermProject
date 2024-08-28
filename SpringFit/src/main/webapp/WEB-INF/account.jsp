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
	width: 200px; /* Adjust as needed */
	margin-right: 10px; /* Space between cards */
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

			<!-- Can later decide to remove username / full name (could be moved to a "settings".jsp -->
			<c:choose>
				<c:when test="${not empty sessionScope.loggedInUser}">
					<ul>
						<li>Username: <c:out
								value="${sessionScope.loggedInUser.username}" /></li>
						<%-- <p>Password: <c:out value="${sessionScope.loggedInUser.password}"/></p> --%>
						<li>${sessionScope.loggedInUser.firstName}
							${sessionScope.loggedInUser.lastName}</li>
					</ul>

					<div class="container-fluid">
						<div class="d-flex justify-content-between align-items-center">
							<h3>Your Workouts</h3>

							<form action="IntializeWorkout.do" method="GET">
								<button type="button" class="btn btn-link active"
									data-bs-toggle="collapse" data-bs-target="#createWorkoutForm"
									aria-expanded="false" aria-controls="createWorkoutForm">Create
									New Workout</button>
							</form>
						</div>
					</div>


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

					<!-- ==================================================== -->
					<%-- 	<c:when test="${not empty workout }"> --%>

					<%-- 					<c:forEach var="workout" items="${myWorkouts}">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">${workout.name}</h5>
								<h6 class="card-subtitle mb-2 text-body-secondary">${loggedInUser.firstName}</h6>
								<p class="card-text"></p>
								<a href="#" class="card-link">View</a> <a href="#"
									class="card-link">Edit</a>
							</div>
						</div>
					</c:forEach> --%>

				</c:when>

				<%-- 	</c:when> --%>
				<c:otherwise>
					<p>Not Logged In.</p>
				</c:otherwise>
			</c:choose>

			<div class="container-fluid mt-4">
				<div class="d-flex justify-content-between align-items-center">
					<h3>Your Workouts</h3>
					<form action="InitializeWorkout.do" method="GET">
						<button type="submit" class="btn btn-primary btn-custom">Create
							New Workout</button>
					</form>
				</div>

			<!-- USER's WORKOUTS (horizontal scroll) -->
				<div class="scrolling-wrapper">
					<c:forEach var="workout" items="${myWorkouts}">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${workout.name}</h5>
								<p class="card-text">${workout.description}</p>
								<a href="showExercisesWithinWorkout.do?workoutId=${workout.id}"
									class="btn btn-primary">View</a> <a
									href="editWorkout.do?workoutId=${workout.id}"
									class="btn btn-secondary">Edit</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- FAVORITE -->
			<!-- Will need to be updated once we have liked/favorite functional -->
			<div class="container-fluid mt-4">
				<div class="d-flex justify-content-between align-items-center">
					<h3>Your Favorite Workouts</h3>
					<form action="showAllWorkouts.do" method="GET">
						<button type="submit" class="btn btn-primary btn-custom">Explore
							all workouts!</button>
					</form>
				</div>

				<div class="scrolling-wrapper">
					<c:forEach var="workout" items="${myWorkouts}">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${workout.name}</h5>
								<p class="card-text">${workout.description}</p>
								<a href="showExercisesWithinWorkout.do?workoutId=${workout.id}"
									class="btn btn-primary">View</a> <a
									href="editWorkout.do?workoutId=${workout.id}"
									class="btn btn-secondary">Edit</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<!-- Today's Numbers / Health? -->
			<div class="container-fluid">
				<h3>Today's Numbers</h3>
				<table class="table table-bordered">
					<thead></thead>

					<tbody>
						<tr>
							<td>Current Weight</td>
							<td>
								<form action="submitWeight.do" method="POST">
									<input type="number" class="form-control" name="weight"
										placeholder="Enter your weight" required>
									<button type="submit" class="btn btn-primary mt-2">Submit
										Weight</button>
								</form>

								<form action="openWeight.do" method="POST">
									<button class="btn btn-lg btn-primary" type="submit">Open
										weight</button>
								</form>


							</td>
						</tr>
						<tr>
							<td>Total Calories Consumed Today</td>
							<td>
								<form action="submitCalories.do" method="POST">
									<input type="number" class="form-control" name="calories"
										placeholder="Enter total calories" required>
									<button type="submit" class="btn btn-primary mt-2">Submit
										Calories</button>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
			</div>



			<button formaction="workoutByUser.do" class="btn btn-lg btn-primary"
				type="button">test file</button>

			<!-- Footer -->
			<%@ include file="footer.jsp"%>


			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>
</body>



</html>





