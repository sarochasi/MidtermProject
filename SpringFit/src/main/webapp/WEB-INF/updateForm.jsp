<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Workout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Workout</h2>
        
        <form action="updateWorkout.do" method="POST">
            <!-- Workout ID (Hidden) -->
            <input type="hidden" name="id" value="${workout.id}">

            <!-- Workout Name -->
            <div class="mb-3">
                <label for="workoutName" class="form-label">Workout Name</label>
                <input type="text" class="form-control" id="workoutName" name="name" value="${workout.name}" required>
            </div>

            <!-- Workout Description -->
            <div class="mb-3">
                <label for="workoutDescription" class="form-label">Description</label>
                <input type="text" class="form-control" id="workoutDescription" name="description" value="${workout.description}">
            </div>

            <!-- Image URL -->
            <div class="mb-3">
                <label for="imageUrl" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${workout.imageUrl}">
            </div>

            <!-- Workout Exercises -->
            <div id="exerciseList">
                <h4>Exercises</h4>
                <c:forEach var="exercise" items="${workout.workoutExercises}">
                    <div class="exercise-item mb-4">
                        <h5>Exercise ${exercise.index + 1}</h5>

                        <!-- Exercise ID (Hidden) -->
                        <input type="hidden" name="exercises[${exercise.index}].id" value="${exercise.id}">

                        <!-- Exercise Name -->
                        <div class="mb-3">
                            <label for="exerciseName${exercise.index}" class="form-label">Exercise Name</label>
                            <input type="text" class="form-control" id="exerciseName${exercise.index}" name="exercises[${exercise.index}].name" value="${exercise.exercise.name}" readonly>
                        </div>

                        <!-- Sets -->
                        <div class="mb-3">
                            <label for="exerciseSets${exercise.index}" class="form-label">Sets</label>
                            <input type="number" class="form-control" id="exerciseSets${exercise.index}" name="exercises[${exercise.index}].sets" value="${exercise.sets}" required>
                        </div>

                        <!-- Units -->
                        <div class="mb-3">
                            <label for="exerciseUnits${exercise.index}" class="form-label">Units</label>
                            <input type="text" class="form-control" id="exerciseUnits${exercise.index}" name="exercises[${exercise.index}].units" value="${exercise.units}" required>
                        </div>

                        <!-- Notes -->
                        <div class="mb-3">
                            <label for="exerciseNotes${exercise.index}" class="form-label">Notes</label>
                            <input type="text" class="form-control" id="exerciseNotes${exercise.index}" name="exercises[${exercise.index}].notes" value="${exercise.notes}">
                        </div>
                    </div>
                </c:forEach>
            </div>

            <button type="submit" class="btn btn-primary">Update Workout</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
