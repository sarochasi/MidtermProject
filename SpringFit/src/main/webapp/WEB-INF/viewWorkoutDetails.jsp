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


	<h1>${workout.name}</h1> rep, set

	<table class="table table-striped">
		<thead>
			<tr>
				<th>Exercises</th>
				<th>(Session/Recommended) Repetitions</th>
				<th>(Session/Recommended) Sets</th>
				<th>Repetitions</th>
				<th>Sets</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exercise" items="${workout.exercises}">
			
			<!-- here -->
				<tr>
					<td>${workout.name}</td>
					<td>${workout.description}</td>
					<td><a class="btn btn-info btn-sm"
						href="performworkout.do?id=${workout.id}">Start Exercise</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>


</html>



