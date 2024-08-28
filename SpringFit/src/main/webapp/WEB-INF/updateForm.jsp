<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html data-bs-theme="Success">

<head>
<meta charset="UTF-8">
<title>Update workout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

<%@ include file="navbar.jsp" %>




    <div class="container mt-5">
        <h2>Update Workout</h2>
        
        <c:choose>
        <c:when test="${not empty workout}">
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
           
           <button type="submit" class="btn btn-primary">Update Workout</button>
        </form>
          
        </c:when>
        
        <c:otherwise>
			<p>${errorMsg }</p>
		</c:otherwise>
          </c:choose> 
            </div>

   <%@ include file="footer.jsp" %>
	</main>






	<!-- Bootstrap script src (bottom of body) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>


</html>