<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create workout</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<main>
		<div class="container">

			<h3>Create new workout</h3>
			<c:choose>
				<c:when test="${not empty exercises}">
					<form action="addExercise.do" method="POST">

						<ul
							class="dropdown-menu position-static d-grid gap-1 p-2 rounded-3 mx-0 shadow w-220px"
							data-bs-theme="light">
							<li><select name="id">
									<c:forEach var="exercise" items="${exercises}">
										<option value="${exercise.id }">${exercise.name}</option>
									</c:forEach>
							</select> 
							<button class="w-100 btn btn-lg btn-primary" type="submit">Add exercise</button>
							
							</li>

						</ul>

					</form>
				</c:when>

				<c:when test="${not empty exerciseTypes}">
					<form action="GetWorkoutPage.do" method="GET">

						<select name="exerciseType">

							<option>Choose the type</option>
							<c:forEach var="type" items="${exerciseTypes }">

								<option value="${ type.id}">${type.name}</option>


							</c:forEach>
						</select>
						
						<button class="w-100 btn btn-lg btn-primary" type="submit">Submit</button>

					</form>

				</c:when>
			</c:choose>








		</div>

		<!-- ========================================================================= -->
		<%@ include file="footer.jsp"%>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>