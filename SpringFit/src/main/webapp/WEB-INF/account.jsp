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

	<%--Edit the file nav.jsp to change nav links (navbar code to be contained in navbar; will only need to plug into each jsp)--%>
	<%-- <jsp:include page="nav.jsp" /> --%>

	<!-- ================================= Navbar================================================= -->

	<header class="p-3 mb-3 border-bottom">

		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do"> <img
					src="images/springFit_transparent-.png" alt="Logo" width="70"
					height="30" class="d-inline-block align-text-top">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>


				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="home.do">Home</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Exercise </a>
							<ul class="dropdown-menu">
								<!-- TESTING LINK FUNCTIONALITY WITH LEG -->
								<!-- <li><a class="dropdown-item" href="searchByType.do?exerciseType=1">Leg</a></li> -->
								<li><a class="dropdown-item" href="#">Leg</a></li>
								<li><a class="dropdown-item" href="#">Arm</a></li>
								<li><a class="dropdown-item" href="#">Chest</a></li>
								<li><a class="dropdown-item" href="#">Back</a></li>
								<li><a class="dropdown-item" href="#">Core</a></li>
								<li><a class="dropdown-item" href="#">Cardio</a></li>

							</ul></li>

					</ul>

					<c:choose>
						<c:when test="${not empty loggedInUser}">
							<div class="dropdown">

								<a href="#"
									class="d-block link-body-emphasis text-decoration-none dropdown-toggle show"
									data-bs-toggle="dropdown" aria-expanded="true"> <img
									src="images/account.png" alt="mdo" width="32" height="32"
									class="rounded-circle"> ${loggedInUser.username }
								</a>



								<ul class="dropdown-menu text-small "
									style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(0px, 34px);"
									aria-labelledby="accountDropdown">
									<li><a class="dropdown-item" href="profile.do">Profile</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="logout.do">Log out</a></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<button class="btn btn-link nav-link active" type="button"
								data-bs-toggle="collapse" data-bs-target="#loginForm"
								aria-expanded="false" aria-controls="loginForm">Log in</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>


	<!-- Collapsible login form -->
	<div class="collapse position-absolute" id="loginForm"
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
						type="password" class="form-control" id="password" name="password"
						required>
				</div>
				<button type="submit" class="btn btn-primary w-100">Log in</button>
			</form>
		</div>
	</div>
	<!-- ================================= Navbar================================================= -->
	<main>


		<div class="container col-xl-10 col-xxl-8 px-4 py-5">


			<!-- <h2>Account Details</h2> -->
			<h2>Welcome ${loggedInUser.firstName}!</h2>

			<!-- (From the LoginLab) -->
			<!--  	Update account.jsp to output escaped (c:out) user data if the user is logged in 
			(i.e. in session, accessible on the JSP page with the sessionScope variable), 
			or "Not Logged In." otherwise. 		-->

			<%-- Output user details --%>
			<%-- 	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<ul>
				<li>Username: <c:out
						value="${sessionScope.loggedInUser.username}" /></li>
				<p>Password: <c:out value="${sessionScope.loggedInUser.password}"/></p>
				<li>First Name: <c:out
						value="${sessionScope.loggedInUser.firstName}" /></li>
				<li>Last Name: <c:out
						value="${sessionScope.loggedInUser.lastName}" /></li>
			</ul>
		</c:when>
		<c:otherwise>
			<p>Not Logged In.</p>
		</c:otherwise>
	</c:choose> --%>
			<%-- Output user details --%>
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
				</c:when>
				<c:otherwise>
					<p>Not Logged In.</p>
				</c:otherwise>

			</c:choose>

			<!-- USER's Workouts -->
			<!-- Will need to be updated once (maybe for each/cycle through) we have logic sorted out & more workouts/data entered into MySQL Workbench DB -->
			<div class="container-fluid">
				<div class="d-flex justify-content-between align-items-center">
					<h3>Your Workouts</h3>
					<form action="GetWorkoutPage.do" method="GET">
						<button type="submit" class="btn btn-primary btn-custom">Create
							New Workout</button>
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

			<!-- FAVORITE -->
			<!-- Will need to be updated once (maybe for each/cycle through) we have logic sorted out & more workouts/data entered into MySQL Workbench DB -->
			<div class="container-fluid mt-4">
				<div class="d-flex justify-content-between align-items-center">
					<h3>Your Favorite Workouts</h3>
					<form action="GetWorkoutPage.do" method="GET">
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


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
</body>



</html>





