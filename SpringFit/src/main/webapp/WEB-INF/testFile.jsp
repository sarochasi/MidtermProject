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



	<table class="table table-striped">
				<thead>
					<tr>
						<th>Workout name</th>
						<th>Description</th>
						<!-- <th>Image URL</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="workout" items="${myWorkouts}">
						<tr>
							<td>${workout.name}</td>
							<td>${workout.description}</td>
							<td>${workout.imageUrl}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
















<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>
