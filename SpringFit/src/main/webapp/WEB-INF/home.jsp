<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

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

<%@ include file="navbar.jsp" %>


		<!-- ==================================================================================== -->
<main>
		<div class="b-example-divider"></div>

		<div class="container col-xl-10 col-xxl-8 px-4 py-5">
			<div class="row align-items-center g-lg-5 py-5">
				<div class="col-lg-7 text-center text-lg-start">
					<h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Welcome
						to SpringFit</h1>
					<p class="col-lg-10 fs-4">Your journey to fitness starts here.
						Whether you're a seasoned athlete or just beginning your fitness
						journey, our platform is here to support you every step of the
						way. Explore personalized exercise guides, create custom workout
						plans, and track your progress effortlessly. Join our community of
						fitness enthusiasts today and unleash your full potential!</p>
				</div>


				<c:choose>
					<c:when test="${empty loggedInUser}">
						<div class="col-md-10 mx-auto col-lg-5">
							<form action="login.do" method="POST"
								class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
								<h1 class="fw-bold mb-0 fs-2">Log in</h1>
								<br>
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="floatingInput"
										name="username" placeholder="username"> <label
										for="floatingInput">Username</label>
								</div>
								<div class="form-floating mb-3">
									<input type="password" class="form-control"
										id="floatingPassword" name="password" placeholder="Password">
									<label for="floatingPassword">Password</label>
								</div>
								<hr class="my-4">

								<button class="w-100 btn btn-lg btn-primary" type="submit">Log
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
					</c:when>
					<c:otherwise>
					
					
					
						<div class="col-md-10 mx-auto col-lg-5 center">
							

							<ul class="d-grid gap-4 my-5 list-unstyled small centered-ul">

								<li class="d-flex justify-content-center">
									<form action="profile.do" method="GET">
										<button type="submit"
											class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" style="height:100px;width:1000px">
											<img src="images/profile.png" width="48" height="48"
												alt="Account">
											<div>
												<h5 class="mb-0">See your profile</h5>
											</div>
										</button>
									</form>

								</li>
								
								<li class="d-flex justify-content-center">
									<form action="" method="GET">
										<button type="submit"
											class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" style="height:100px;width:1000px">
											<img src="images/commu.png" width="48" height="48"
												alt="Account">
											<div>
												<h5 class="mb-0">Community board</h5>
											</div>
										</button>
									</form>

								</li>


							</ul>

						</div>
					</c:otherwise>
				</c:choose>



			</div>



		</div>









		<!-- ==================================================================================== -->


		<hr class="featurette-divider">
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">
			<div class="row align-items-center g-lg-5 py-5">

				<div class="row">
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/leg.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="1" />
							<button type="submit" class="btn btn-link">Legs</button>
						</form>
					</div>
					
					
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/arm.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="2" />
							<button type="submit" class="btn btn-link">Arms</button>
						</form>

					</div>
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/chest.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="3" />
							<button type="submit" class="btn btn-link">Chest</button>
						</form>
					</div>
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/back.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="4" />
							<button type="submit" class="btn btn-link">Back</button>
						</form>
					</div>
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/abs.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="5" />
							<button type="submit" class="btn btn-link">Core</button>
						</form>
					</div>
					<div class="col-lg-2 text-center">
						<div class="rounded-circle"
							style="width: 140px; height: 140px; overflow: hidden; position: relative;">
							<img src="images/cardio.png" alt="Legs Exercise"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</div>
						<form action="searchByType.do" method="GET">
						<input type="hidden" name="typeId" value="6" />
							<button type="submit" class="btn btn-link">Cardio</button>
						</form>
					</div>


				</div>



			</div>
		</div>

		<!-- ==================================== feature ============================================ -->


		<hr class="featurette-divider">
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">
			<div
				class="row featurette d-flex align-items-center justify-content-center">
				<div class="col-md-7">
					<h2 class="featurette-heading fw-normal lh-1">Personalized
						Workout Plans</h2>
					<p class="lead">At FitnessTracker, we offer Personalized
						Workout Plans tailored to your unique fitness goals. Create
						customized regimens based on your preferences, whether you want to
						lose weight, build muscle, or enhance overall health. With options
						to adjust exercises, sets, and schedules, you can easily stay
						motivated and track your progress as you work towards your fitness
						objectives.</p>
				</div>
				<div class="col-md-5">
					<img src="https://www.dmoose.com/cdn/shop/articles/Main_Image_c34524b2-86f3-4c60-92fa-2e9d67beccf5.jpg?v=1668438961"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="300" height="300" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
					
					</img>
				</div>
			</div>

			<hr class="featurette-divider">
			<div
				class="row featurette d-flex align-items-center justify-content-center">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading fw-normal lh-1">Progress
						Tracking Dashboard</h2>
					<p class="lead">Stay motivated with our Progress Tracking
						Dashboard, which provides a clear overview of your fitness
						journey. Monitor key metrics like weight, body measurements, and
						exercise history with visual graphs and charts.</p>
				</div>
				<div class="col-md-5 order-md-1">
					<img src="https://www.verywellfit.com/thmb/jB9WezPXQ3Ou8QBImfbY03ziUjw=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Pushups-5680bb925f9b586a9edf3927.jpg"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="300" height="300" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
					
				</div>
			</div>
			<hr class="featurette-divider">

			<div
				class="row featurette d-flex align-items-center justify-content-center">
				<div class="col-md-7">
					<h2 class="featurette-heading fw-normal lh-1">Exercise Library
						and Tutorials</h2>
					<p class="lead">Explore our extensive Exercise Library and
						Tutorials to learn new exercises and perfect your form. Featuring
						a wide range of categorized exercises with instructional videos
						and safety tips, you can easily find options that suit your skill
						level.</p>
				</div>
				<div class="col-md-5">
					<img src="https://cdn.shedefined.com.au/wp-content/uploads/2023/07/04233631/How-shy-girl-workouts-help-women-get-fit-and-gain-confidence-in-gym-960x540-1.jpg"
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="300" height="300" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
					
				</div>
			</div>
		</div>


		<!-- ==================================== feature ============================================ -->


<%@ include file="footer.jsp" %>
	</main>






	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>



