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
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="<!-- App Logo -->" alt=""
					width="72" height="57">
				<h2>Registration form</h2>
			</div>



			<hr class="my-4">
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
	
	


	</main>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>