<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>

	<%@ include file="navbar.jsp" %>

	<div class="container">
		<main>
		
		<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">${ExerciseType.name}</h1>
        
      </div>
    </div>
  </section>
  
  
  
  
  
   <h2>Exercises</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-warning">${error}</div>
    </c:if>

    <ul>
        <c:forEach var="exercise" items="${exercises}">
            <li>${exercise.name}</li>
        </c:forEach>
    </ul>
  
  
  
  
  
  
  
  
			<!-- <form action="GetWorkoutPage.do" method="GET">
				Create New Workout <input type="text" name="name" /> <input
					type="submit" value="Create New Workout" />
			</form>
 -->



















			<!-- ========================================= Footer ============================== -->
			<div class="b-example-divider"></div>


			<div class="container">
				<footer
					class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
					<div class="col-md-4 d-flex align-items-center">
						<a href="/"
							class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
							<img src="images/springFit_transparent-.png" alt="Logo"
							width="100" height="50">
						</a>
					</div>
					<p class="float-end">
						<a href="#">Back to top</a>
					</p>
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