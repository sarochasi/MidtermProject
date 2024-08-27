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

				</c:when>

				<%-- 	<c:when test="${not empty workout }"> --%>

				<%-- 	</c:when> --%>
				<c:otherwise>
					<p>Not Logged In.</p>
				</c:otherwise>
			</c:choose>

			<!-- USER's Workouts -->
			<!-- Will need to be updated once (maybe for each/cycle through) we have logic sorted out & more workouts/data entered into MySQL Workbench DB -->

		<table class="table table-striped">
				<thead>
					<tr>
						<th>Workout name</th>
						<th>Description</th>
						<!-- <th>Image URL</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="workout" items="${myWorkouts}">
						<tr>
							<td>${workout.name}</td>
							<td>${workout.description}</td>
							<td>${workout.imageUrl}</td>
							<td><a class="btn btn-info btn-sm"
								href="performworkout.do?id=${workout.id}">Start Exercise</a></td>
							<!-- Should a workout's details display on seperate jsp? -->
							href="details.do?id=${workout.id}">View Details</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>




	<%-- 		<div class="album py-5 bg-body-tertiary">
				<div class="container">

					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach var="workout" items="${myWorkouts}">
							<div class="card" style="width: 18rem;">
								<div class="card-body">
									<h5 class="card-title">${workout.name}</h5>
									<h6 class="card-subtitle mb-2 text-body-secondary">${workout.user.firstName}</h6>
									<p class="card-text"></p>
									<!-- <a href="#" class="card-link">View</a> <a href="#"
										class="card-link">Edit</a> -->
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div> --%>


			<!-- <div class="scrolling-wrapper">

					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>

				</div>
			</div>
 -->
			<!-- FAVORITE -->
			<!-- Will need to be updated once (maybe for each/cycle through) we have logic sorted out & more workouts/data entered into MySQL Workbench DB -->
			<div class="container-fluid mt-4">
				<div class="d-flex justify-content-between align-items-center">
					<h3>Your Favorite Workouts</h3>
					<form action="showAllWorkouts.do" method="GET">
						<button type="submit" class="btn btn-primary btn-custom">Explore
							all workouts!</button>
					</form>
				</div>
				<div class="scrolling-wrapper">

					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>
					<div class="card">
						<img src="image" class="card-img-top" alt="image href">
						<div class="card-body">
							<h5 class="card-title">1</h5>
							<p class="card-text">1</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<br>

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
							<button formaction="openWeight.do" class="btn btn-lg btn-primary" type="submit">Open weight</button>

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


		<h3>Misc. (to be deleted)</h3>
		<p>Updated "Account Details" to (Welcome, user's name). A
			"Settings" button already exists under the user drop down (top right)</p>
		<p>Maybe create logic that will display the user's info, only IF
			they would like to display that information publicly. (user would
			have the choice?) - first name, last name, height, gender (but might
			not display as ex. First Name: Bob, rather "Bob")</p>
		<p>Where should we display user's graphs? What will the graphs
			output/track?</p>
		<p>Will need to revisit ManyToMany (toStrings)</p>
		<p>How many jsps? 1 for exercises and 1 for workouts?</p>




		<!-- Footer -->
		<%@ include file="footer.jsp"%>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
</body>



</html>





