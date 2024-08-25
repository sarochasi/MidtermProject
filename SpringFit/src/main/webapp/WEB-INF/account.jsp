<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Account Profile - could customize with '$''s Account</title>
	
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
							aria-current="page" href="home.do">Home</a></li>

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
<!-- ================================= Navbar================================================= -->

	<h2>Account Details</h2>
	<p>Maybe label above with "Welcome "User's NAME" (and create a seperate jsp for account settings/update settings, etc.)</p>
	<p>Maybe create logic that will display the user's info, only IF they would like to display that information publicly. (user would have the choice?) - first name, last name, height, gender (but might not display as ex. First Name: Bob, rather "Bob") </p>

	<!--  	Update account.jsp to output escaped (c:out) user data if the user is logged in 
			(i.e. in session, accessible on the JSP page with the sessionScope variable), 
			or "Not Logged In." otherwise. 		-->
	
	<%-- Output user details --%>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<ul>
            		<li>Username: <c:out value="${sessionScope.loggedInUser.username}"/></li>
           	 	<%-- <p>Password: <c:out value="${sessionScope.loggedInUser.password}"/></p> --%>
            		<li>First Name: <c:out value="${sessionScope.loggedInUser.firstName}"/></li>
            		<li>Last Name: <c:out value="${sessionScope.loggedInUser.lastName}"/></li>
            	</ul>
        </c:when>

        <c:otherwise>
            <p>Not Logged In.</p>
        </c:otherwise>
        
    </c:choose>
	
<form action = "GetWorkoutPage.do" method="GET">
	<input type="submit" value="Create New Workout"/>
</form>
<br>
<br>
	
	
		<!-- Basic/general layout ideas -->
		<h3>Maybe more buttons / forms</h3>
			<p>Maybe a few additional buttons above (in addition to "Create New Workout", such as a "Health" table that allows a user to submit their weight and calories. (Would only need to include a POST if this is all handled within the account.jsp) </p>
		<h3>Your workouts</h3>
			<p>Maybe all of the user's saved workouts displays as a 1 row "table" that can scroll horizontally (left and right?) Will need to read more into Bootstrap responsive table in order to figure out how to implement.</p>
			
			<div class="table-responsive">
    			<table class="table table-bordered">
        			<thead>
            			<tr>
                			<th>Workout Name</th>
                			<th>Image</th>
            			</tr>
        			</thead>
        			
        			<tbody>
            			<c:forEach var="workout" items="${sessionScope.loggedInUser.workouts}">
                			<tr>
                    			<td><c:out value="${workout.name}" /></td>
                    			<td>
                        			<c:if test="${not empty workout.imageUrl}">
                            			<img src="<c:out value='${workout.imageUrl}'/>" alt="Workout Image" width="50" height="50">
                        			</c:if>
                    			</td>
                			</tr>
            			</c:forEach>
        			</tbody>
    			</table>
			</div>
			
		
		<h3>Your "favorite" (and/or liked/rated) workouts</h3>
			<p>Same as above, maybe a table that scrolls horizontally. These would be workouts that the user has interacted/saved. (i.e some other user's workout) that they wanted to save into theirs (instance of the other user's workout) - the user may be able to edit their "copy" but not the other user's original workout.</p>
			
	
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>



</html>
















