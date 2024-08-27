<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>${workout.name}</title>

</head>

<body>

	<h1>${workout.name}</h1>

	<table class="table table-striped">
		<thead>
			<tr>
				<th>Exercises</th>
				<th>Repetitions</th>
				<th>Sets</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="workoutExercise" items="${workoutExercises}">
				<tr>
					<td>${workoutExercise.exercise.name}</td>
					<td>${workoutExercise.units}</td>
					<td>${workoutExercise.sets}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>


</html>



