<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	
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
	
	<div class="container">
		<main>
			<div class="py-5 ">
				<img class="d-block mx-auto mb-4" src="images/springFit_transparent-.png" alt=""
					width="200" height="80">
				<h3>Registration form</h3>
			</div>

			<!-- <hr class="my-4"> -->
			<div class="row g-5">
				<form action="Register.do" method="POST">
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="firstName" class="form-label">First name</label> <input
								type="text" class="form-control" id="firstName" name="firstName" placeholder=""
								value="" required="">
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>

						<div class="col-sm-6">
							<label for="lastName" class="form-label">Last name</label> <input
								type="text" class="form-control" id="lastName" name="lastName" placeholder=""
								value="" required="">
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>

						<div class="col-12">
							<label for="username" class="form-label">Username</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="username" name="username"
									placeholder="Username" required="">
								<div class="invalid-feedback">Your username is required.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="username" class="form-label">Password</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="Password" required="">
								<div class="invalid-feedback">Your password is required.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">Email <span
								class="text-body-secondary">(Optional)</span></label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="you@example.com">
							<div class="invalid-feedback">Please enter a valid email
								address.</div>
						</div>


						<div class="col-md-4">
							<label for="country" class="form-label">Gender</label> <select
								class="form-select" id="country" name="gender" >
								<option value="">Choose...</option>
								<option>Male</option>
								<option>Female</option>
								<option>Other</option>
								<option>Prefer not to say</option>
							</select>
							<div class="invalid-feedback">Please select a valid gender.
							</div>
						</div>


					<div class="col-md-4">
						<label for="height" class="form-label">Height(in inches)</label> <input
							type="number" class="form-control" id="height" name="height" placeholder=""
							>
					</div>
					
					<div class="col-md-4">
						<label for="zip" class="form-label">DOB</label> <input
							type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="YYYY-MM-DD"
							>
					</div>
			</div>

			<hr class="my-4">


			<button class="w-100 btn btn-primary btn-lg" type="submit">Sign up</button>
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger">${errorMessage}</div>
					</c:if>
				</form>
	</div>
	
	
	
	<div class="b-example-divider"></div>


		<div class="container">
			<footer
				class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
				<div class="col-md-4 d-flex align-items-center">
					<a href="/"
						class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
						<img src="images/springFit_transparent-.png" alt="Logo" width="100"
						height="50">
					</a>
				</div>
				<p class="float-end"><a href="#">Back to top</a></p>
			</footer>
		</div>


	</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>