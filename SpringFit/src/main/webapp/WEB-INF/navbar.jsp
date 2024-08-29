<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!-- <header class="p-3 mb-3 border-bottom"> -->

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.do"> <img
			src="images/springFit_transparent-.png" alt="Logo" width="70"
			height="30" class="d-inline-block align-text-top">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.do">Home</a></li>
					
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="showAllWorkouts.do">Community</a></li>
					

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Exercise </a>
					<ul class="dropdown-menu">
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="1" />
                        <button type="submit" class="dropdown-item btn btn-link">Legs</button>
                    </form></li>
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="2" />
                        <button type="submit" class="dropdown-item btn btn-link">Arms</button>
                    </form></li>
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="3" />
                        <button type="submit" class="dropdown-item btn btn-link">Chest</button>
                    </form></li>
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="4" />
                        <button type="submit" class="dropdown-item btn btn-link">Back</button>
                    </form></li>
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="5" />
                        <button type="submit" class="dropdown-item btn btn-link">Core</button>
                    </form></li>
						<li><form action="searchByType.do" method="GET" style="margin: 0; padding: 0;">
                        <input type="hidden" name="typeId" value="6" />
                        <button type="submit" class="dropdown-item btn btn-link">Cardio</button>
                    </form></li>

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
							<li><a class="dropdown-item" href="showAllWorkouts.do">Community</a></li>
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


