<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Workouts Page</h1>
	<h2>Add New Workout</h2>
	<form action = "showAllExercices.do" method = "GET" >
	Need to add another method to Exercise Controller that performs a find all exercises and returns "workout"
			<select name="exercise">
				<c:forEach var="exercise" items = "${allExercises }">
					<option  value = "${exercise.name }">${exercise.name }</option>
					
				
				</c:forEach>

			</select><br />
			
			
	</form>
	
				<c:forEach var="exercise" items = "${allExercises }">
					<p> "${exercise.name }" ${exercise.name }</p>
					
				
				</c:forEach>
</body>
</html>


<!-- 				<option  value = "exercise1">EXERCISE1</option>
				<option value = "exercise2">EXERCISE2</option> -->