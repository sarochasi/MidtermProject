<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Create Routine</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
.scrolling-wrapper {
	overflow-x: auto;
	white-space: nowrap;
	padding: 10px 0;
}

.scrolling-wrapper .card {
	display: inline-block;
	width: 200px;
	margin-right: 10px;
}
</style>
</head>
<body>
<div class="container col-xl-10 col-xxl-8 px-4 py-5">

	<%@ include file="navbar.jsp"%>
	<h1>Routine: ${routine.name}</h1>
	<!-- --------------------------------------------------------------------------------------------------------------------  -->
	<h2>Workouts</h2>
	<c:forEach var="routineWorkout" items="${routine.routineWorkouts}">
	<li>${routineWorkout.workout.name } ${routineWorkout.dayNumber }</li>
	</c:forEach>
	<!--------------------------------------------------workout selection ------------------------------------------------ -->
	<c:if test="${not empty workouts}">

<!-- 		<form action="recieveRoutineDayAndWorkoutAndCreateRoutineWorkout.do" method="GET"> -->
		<form action="addWorkoutToRoutine.do" method="POST">
			<input type="hidden" name="routineId" value="${routineId}" />
			 <select name="workout.id">
				<c:forEach var="w" items="${workouts }">
					<option selected="selected" value="${w.id }">${w.name }</option>
				</c:forEach>
			</select>
			
			 <select name="dayNumber">
					<option selected="selected" value=1>Sunday</option>
					<option selected="selected" value=2>Monday</option>
					<option selected="selected" value=3>Tuesday</option>
					<option selected="selected" value=4>Wednesday</option>
					<option selected="selected" value=5>Thursday</option>
					<option selected="selected" value=6>Friday</option>
					<option selected="selected" value=7>Saturday</option>
			</select><br /> 
			
			<input type="submit" value="Submit" />


		</form >

			
		<!--Return to account.jsp  -->
		<form action="profile.do" method="get">
			<input type="submit" value="Workout Complete" />
		</form>
	</c:if>
	<!-- --------------------------------------------------------------------------------------------------------------------  -->
</div>
</body>
</html>