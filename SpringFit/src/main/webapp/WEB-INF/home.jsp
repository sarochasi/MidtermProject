<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Spring Fit</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

	<div class="container mt-4">
		<main>
			<div class="d-block mx-auto mb-4">
				<h1 class="text-center">Welcome to Spring Fit</h1>

				<%-- ${SMOKETEST} --%>
			</div>
			<div class="row g-5">

				<!-- LEFT -->
				<div class="col-md-6 col-lg-7">
					<p>Welcome to Springfit – your ultimate companion in achieving
						your fitness goals. At Springfit, we’re dedicated to providing you
						with the tools and insights you need to lead a healthier, more
						active lifestyle. Our cutting-edge platform offers comprehensive
						tracking features, so you can monitor your workouts, set goals,
						and celebrate your progress every step of the way.</p>
					<p>Personalized Fitness Tracking is at the heart of what we do.
						Whether you’re a seasoned athlete or just starting your fitness
						journey, Springfit caters to all levels of experience. Our
						intuitive dashboard allows you to log workouts, track nutrition,
						and assess your overall performance. With detailed analytics and
						real-time feedback, you’ll have everything you need to optimize
						your routine and stay motivated.</p>
					<p>Join our vibrant community of fitness enthusiasts and
						professionals. At Springfit, we believe in the power of connection
						and support. Engage with like-minded individuals, share your
						achievements, and get inspired by others’ stories. Together, we’ll
						push the boundaries of fitness and reach new milestones. Start
						your journey with Springfit today and discover a smarter, more
						connected way to stay fit.</p>
				</div>

				<!-- RIGHT -->
				<div class="col-md-5 col-lg-4 order-md-last">
					<form action="login.do" method="POST">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-primary">Log in</span>
						</h4>
						<div class="mb-3">
							<label for="username" class="form-label">Username:</label> <input
								type="text" id="username" name="username" class="form-control"
								required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password:</label> <input
								type="password" id="password" name="password"
								class="form-control" required>
						</div>
						<button type="submit" class="btn btn-primary">Log In</button>
					</form>
					<form action="registerForm.do" method="GET">
						<p>
							Not a member?
							<button type="submit" class="btn btn-link">Sign up</button>
						</p>
					</form>
				</div>

			</div>
			<!-- WILL LATER DISPLAY PHOTOS/LOGOS OF CORRESPONDING MUSCLE GROUP (HREF - THERE IS AN IMAGES DIRECTORY IN PROJECT) -->
			<!-- NEAR BOTTOM -->

<hr class="featurette-divider">

			<div class="row">
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/leg.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Legs</button>
					</form>
				</div>
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/arm.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Arms</button>
					</form>
				</div>
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/chest.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Chest</button>
					</form>
				</div>
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/back.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Back</button>
					</form>
				</div>
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/abs.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Core</button>
					</form>
				</div>
				<div class="col-lg-2 text-center">
					<div class="rounded-circle"
						style="width: 140px; height: 140px; overflow: hidden; position: relative;">
						<img src="images/cardio.png" alt="Legs Exercise"
							style="width: 100%; height: 100%; object-fit: cover;" />
					</div>
					<form action="showExercise.do" method="POST">
						<button type="submit" class="btn btn-link">Cardio</button>
					</form>
				</div>

			
			</div>
			<!-- /.col-lg-4 -->









	<div class="mt-5 text-center">
		<div class="btn-group" role="group"
			aria-label="Basic outlined example">
			<button type="button" class="btn btn-outline-primary">Legs</button>
			<button type="button" class="btn btn-outline-primary">Arms</button>
			<button type="button" class="btn btn-outline-primary">Chest</button>
			<button type="button" class="btn btn-outline-primary">Back</button>
			<button type="button" class="btn btn-outline-primary">Core</button>
			<button type="button" class="btn btn-outline-primary">Cardio</button>
		</div>
	</div>
	</main>
	</div>

	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>



