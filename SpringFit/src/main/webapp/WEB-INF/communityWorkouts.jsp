<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Community - Workouts</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>

<body>
	<%@ include file="navbar.jsp"%>

	<!-- For each workout, that has been associated with a user, display that workout -->
	<h1>Community</h1>

	<table class="table table-striped">
		<thead>
			<tr>
				<th>Workout name</th>
				<th>Description</th>
				<th>Image URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="workout" items="${showAllWorkouts}">
				<tr>
					<td>${workout.name}</td>
					<td>${workout.description}</td>
					<%-- <td>${workout.imageUrl}</td> --%>
					<td><a class="btn btn-info btn-sm"
						href="performworkout.do?id=${workout.id}">Start Exercise</a></td>
						<!-- Should a workout's details display on seperate jsp? -->
						<%-- href="details.do?id=${workout.id}">View Details</a></td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>




</html>