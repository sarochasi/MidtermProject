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

		
			<header class="p-3 mb-3 border-bottom">

		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">LOGO</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Exercise </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Leg</a></li>
								<li><a class="dropdown-item" href="#">Arm</a></li>
								<li><a class="dropdown-item" href="#">Chest</a></li>
								<li><a class="dropdown-item" href="#">Back</a></li>
								<li><a class="dropdown-item" href="#">Core</a></li>
								<li><a class="dropdown-item" href="#">Cardio</a></li>

							</ul></li>
						<li class="nav-item"><a class="nav-link disabled"
							aria-disabled="true">Disabled</a></li>
					</ul>
					
					<c:choose>
                <c:when test="${not empty loggedInUser}">
                <div class="dropdown">
                
               <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle show" data-bs-toggle="dropdown" aria-expanded="true">
            <img src="images/account.png" alt="mdo" width="32" height="32" class="rounded-circle"> 
            ${loggedInUser.username }
        </a> 
                
                
                  
                        <ul class="dropdown-menu text-small " style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(0px, 34px);" aria-labelledby="accountDropdown">
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logout.do">Log out</a></li>
                        </ul>
                    </div>
					</c:when>
					<c:otherwise>
					<button class="btn btn-link nav-link active" type="button" data-bs-toggle="collapse" data-bs-target="#loginForm" aria-expanded="false" aria-controls="loginForm">
						Log in
					</button>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>
	
	
	<!-- Collapsible login form -->
	<div class="collapse position-absolute" id="loginForm" style="right: 0; width: 250px; z-index: 1000;">
		<div class="card card-body">
			<form action="login.do" method="POST">
				<div class="mb-3">
					<label for="username" class="form-label">Username</label>
					<input type="text" class="form-control" id="username" name="username" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
				<button type="submit" class="btn btn-primary w-100">Log in</button>
			</form>
		</div>
	</div>
	<main>
	<%-- 	<div class="container mt-4">
			<div class="d-block mx-auto mb-4">
				<h1 class="text-center">Welcome to Spring Fit</h1>

				${SMOKETEST}
			</div>
			<div class="row g-5">

				<!-- LEFT -->
				<div class="col-md-6 col-lg-6">
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
				<div class="col-md-4 col-lg-4 order-md-last">
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

			</div> --%>

			<!-- ==================================================================================== -->

<div class="b-example-divider"></div>
			<div class="container col-xl-10 col-xxl-8 px-4 py-5">
				<div class="row align-items-center g-lg-5 py-5">
					<div class="col-lg-7 text-center text-lg-start">
						<h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Welcome to SpringFit</h1>
						<p class="col-lg-10 fs-4">Your journey to fitness starts here.
							Whether you're a seasoned athlete or just beginning your fitness
							journey, our platform is here to support you every step of the
							way. Explore personalized exercise guides, create custom workout
							plans, and track your progress effortlessly. Join our community
							of fitness enthusiasts today and unleash your full potential!</p>
					</div>
					<div class="col-md-10 mx-auto col-lg-5">
						<form action="login.do" method="POST"
							class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
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



		</div>
		</div>
	
	</main>






	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>



