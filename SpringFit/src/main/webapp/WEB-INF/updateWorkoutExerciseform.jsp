<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

<head>
<meta charset="UTF-8">
<title>Update Exercise</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

	<%@ include file="navbar.jsp"%>


	<main>

		<div class="container mt-5">



			<c:forEach var="exercise" items="${workoutExercises}"
				varStatus="status">
				<form action="updateWorkoutExercise.do" method="POST">
					<input type="hidden" name="workoutId"
						value="${exercise.workout.id}"> <input type="hidden"
						name="workoutExerciseId" value="${exercise.id}"> <input
						type="hidden" name="workoutExercises[${status.index}].id"
						value="${exercise.id}">
					<h4>${exercise.exercise.name }</h4>
					<div class="mb-3">
						<label for="notes" class="form-label">Notes:</label> <input
							type="text" class="form-control" id="notes" name="notes"
							value="${exercise.notes}">
					</div>

					<div class="mb-3">
						<label for="units${status.index}" class="form-label">Units:</label>
						<input type="number" class="form-control"
							id="units${status.index}" name="units" value="${exercise.units}">
					</div>

					<div class="mb-3">
						<label for="sets${status.index}" class="form-label">Sets:</label>
						<input type="number" class="form-control" id="sets${status.index}"
							name="sets" value="${exercise.sets}">
					</div>

					<button type="submit" class="btn btn-primary">Update
						Exercise</button>

				</form>
				<form action="deleteExercise.do" method="POST">
					<input type="hidden" name="exerciseId" value="${exercise.id}" />
					<button type="submit" class="btn btn-sm btn-outline-secondary">Delete</button>
				</form>
			</c:forEach>
				<form action="addMoreExercise.do" method="GET">
					<input type="hidden" name="workoutId" value="${workout.id}" />
					<button type="submit" class="btn btn-sm btn-outline-secondary">Add exercise</button>
				</form>

			<!-- <button type="button" class="btn btn-info" data-bs-toggle="collapse"
				data-bs-target="#addWorkout" aria-expanded="false"
				aria-controls="addWorkout">Add New Exercise</button> -->

			<!-- <a href="addExercise.do" class="btn btn-primary">Add exercise</a> -->
			
			<a href="profile.do" class="btn btn-primary">Finish update</a>


<%-- <div class="collapse mt-2" id="addWorkout">
    <c:choose>
      
        <c:when test="${not empty exercises}">
            <form action="addExercise.do" method="POST">
                <input type="hidden" value="${workoutId}" name="workoutId" />

                
                <ul class="dropdown-menu position-static d-grid gap-1 p-2 rounded-3 mx-0 shadow w-220px" data-bs-theme="light">
                    <li>
                        <select name="exerciseId" class="form-select">
                            <c:forEach var="exercise" items="${exercises}">
                                <option value="${exercise.id}">${exercise.name}</option>
                            </c:forEach>
                        </select>
                    </li>
                </ul>

              
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" name="units" placeholder="Rep">
                    <label for="floatingInput">Repetition</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" name="sets" placeholder="Set">
                    <label for="floatingInput">Set</label>
                </div>

             
                <button class="btn btn-lg btn-primary" type="submit">Add exercise</button>
            </form>
        </c:when>

     
        <c:when test="${not empty exerciseTypes}">
            <form action="GetWorkoutPage.do" method="GET">
                <input type="hidden" value="${workoutId}" name="workoutId" />
           
                <select name="exerciseType" class="form-select">
                    <option>Choose the type</option>
                    <c:forEach var="type" items="${exerciseTypes}">
                        <option value="${type.id}">${type.name}</option>
                    </c:forEach>
                </select>

                <button class="btn btn-lg btn-primary mt-2" type="submit">Submit</button>
            </form>
        </c:when>
    </c:choose>
</div>
 --%>







		</br>
		<%@ include file="footer.jsp"%>
	</main>






	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>