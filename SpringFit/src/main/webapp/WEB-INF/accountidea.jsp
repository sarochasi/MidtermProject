<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>

<body>

	<h1>Nutrition Summary</h1>

	<form action="addNutrition.do" method="POST">
	<!-- FORM ACTION - handle in User Controller? -->
	<!-- For the code below, add to account.jsp? Separate weight and nutrition into 2 tables? -->
		
		<div class="mb-3">
			<label for="dateEaten" class="form-label">Date</label> <input
				type="date" class="form-control" id="dateEaten" name="dateEaten"
				required>
		</div>
		
		<!-- CHECKBOXES -->
		<legend class="form-label">Select: </legend>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="breakfast"
					name="mealType" value="Breakfast"> <label
					class="form-check-label" for="breakfast">Breakfast</label>
			</div>

			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="lunch"
					name="mealType" value="Lunch"> <label
					class="form-check-label" for="lunch">Lunch</label>
			</div>
			
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="dinner"
					name="mealType" value="Dinner"> <label
					class="form-check-label" for="dinner">Dinner</label>
			</div>
			
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="snack"
					name="mealType" value="Snack"> <label
					class="form-check-label" for="snack">Snack</label>
			</div>
			
		</form>











			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>
</body>



</html>




