<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>See exercises</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- ============================================================== -->

	<main>
		<div class="container">


			<h2>Exercises</h2>

			<hr class="featurette-divider">
			<c:choose>

				<c:when test="${not empty loggedInUser}">
					<c:forEach var="exercise" items="${exercises}">
						<div class="container col-xl-10 col-xxl-8 px-4 py-5">
							<div
								class="row featurette d-flex align-items-center justify-content-center">
								<div class="col-md-7">
									<h2 class="featurette-heading fw-normal lh-1">${exercise.name}</h2>
									<p class="lead">
										<strong>Instruction: </strong>${exercise.instructions}</p>
									<p class="lead">
										<strong>Calories per unit: </strong>${exercise.caloriesPerUnit}</p>
								</div>
								<div class="col-md-5">
									<img src="${exercise.imageUrl}"
										class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
										width="300" height="300" xmlns="http://www.w3.org/2000/svg"
										role="img" aria-label="Placeholder: 500x500"
										preserveAspectRatio="xMidYMid slice" focusable="false">
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>


				<c:otherwise>
					<c:forEach var="exercise" items="${exercises}" varStatus="status">
						<c:if test="${status.index == 0}">
							<div class="container col-xl-10 col-xxl-8 px-4 py-5">
								<div
									class="row featurette d-flex align-items-center justify-content-center">
									<div class="col-md-7">
										<h2 class="featurette-heading fw-normal lh-1">${exercise.name}</h2>
										<p class="lead">
											<strong>Instruction: </strong>${exercise.instructions}</p>
										<p class="lead">
											<strong>Calories per unit: </strong>${exercise.caloriesPerUnit}</p>


									</div>
									<div class="col-md-5">
										<img src="${exercise.imageUrl}"
											class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
											width="300" height="300" xmlns="http://www.w3.org/2000/svg"
											role="img" aria-label="Placeholder: 500x500"
											preserveAspectRatio="xMidYMid slice" focusable="false">
									</div>
								</div>
							</div>
						</c:if>

					</c:forEach>
					<p>Please log in to see all exercise</p>
					<button class="btn btn-link active" type="button"
						data-bs-toggle="collapse" data-bs-target="#loginForm2"
						aria-expanded="false" aria-controls="loginForm">Log in</button>

				</c:otherwise>
			</c:choose>

					<div class="collapse" id="loginForm2"
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



</div>
















		<!-- ========================================= Footer ============================== -->
		<%@ include file="footer.jsp"%>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>