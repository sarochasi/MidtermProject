
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
		<div class="container col-xl-10 col-xxl-8 px-4 py-5">

			<h3>Create new workout</h3>
			
	<c:if test="${not empty workoutExercises}">
            <ul>
                <c:forEach var="workoutExercise" items="${workoutExercises}">
                    <li>${workoutExercise.exercise.name} - Sets: ${workoutExercise.sets}, Reps: ${workoutExercise.units}</li>
                </c:forEach>
            </ul>
        </c:if>
			
			<c:choose>
				<c:when test="${not empty exercises}">
					<form action="addExercise.do" method="POST">
						<input type="hidden" value="${workoutId }" name="workoutId" />

						<ul
							class="dropdown-menu position-static d-grid gap-1 p-2 rounded-3 mx-0 shadow w-220px"
							data-bs-theme="light">
							<li><select name="exerciseId">
									<c:forEach var="exercise" items="${exercises}">
										<option value="${exercise.id }">${exercise.name}</option>
									</c:forEach>
							</select>



								<div class="form-floating mb-3">
									<input type="number" class="form-control" id="floatingInput"
										name="units" placeholder="Rep"> <label
										for="floatingInput">Repetition or Time(mins)</label>
								</div>
								<div class="form-floating mb-3">
									<input type="number" class="form-control" id="floatingInput"
										name="sets" placeholder="Set"> <label
										for="floatingInput">Set</label>
								</div>
							<div class="form-floating mb-3">
									<input type="text" class="form-control" id="floatingInput"
										name="notes" placeholder="Note"> <label
										for="floatingInput">Note</label>
								</div>
								<button class="btn btn-lg btn-primary" type="submit">Add
									exercise</button>
									

						</ul>

					</form>
				</c:when>
				
			

				<c:when test="${not empty exerciseTypes}">
					<form action="GetWorkoutPage.do" method="GET">
						<input type="hidden" value="${workoutId }" name="workoutId" /> <select
							name="exerciseType">

							<option>Choose the type</option>
							<c:forEach var="type" items="${exerciseTypes }">

								<option value="${ type.id}">${type.name}</option>


							</c:forEach>
						</select>

						<button class="btn btn-outline-primary" type="submit">Select Exercise</button>

						<button formaction="profileAfterWorkout.do" class="btn btn-lg btn-primary" type="submit">Finish workout</button>

					</form>

				</c:when>








			</c:choose>
			
			
<%-- 			<c:if test="${not empty workoutId.workoutExercise}">
                <h4>Exercises in this Workout:</h4>
                <ul class="list-group">
                    <c:forEach var="exercise" items="${workoutId.workoutExercise}">
                        <li class="list-group-item">
                            ${exercise.exercise.name} - ${exercise.sets} sets, ${exercise.reps} reps
                        </li>
                    </c:forEach>
                </ul>
            </c:if> --%>



	<%-- 		<c:if test="${not empty workoutExercise}">

					<c:forEach var="workoutExercise" items="workoutExercise">

						<ul>
							<li>
								<p>${workoutExercise.name}
								<p>
							</li>

						</ul>


					</c:forEach>


				 </c:if>  --%>







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
