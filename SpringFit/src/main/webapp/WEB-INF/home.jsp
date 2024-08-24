<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Spring Fit</title>
	
</head>

<body>

	<!-- Bring in the NAVBAR -->
	<%-- <jsp: include page="navbar.jsp"/> --%>
	<%-- <jsp:include page="nav.jsp" /> --%> 

	<h1>Welcome to Spring Fit</h1>
	
	<!-- 1 row of ~5 (Circle buttons w/ ((IMAGE HREF)) legs, arms, chest, back, core, cardio TO BE CHANGED -->
	<div class="btn-group" role="group" aria-label="Basic outlined example">
  		<button type="button" class="btn btn-outline-primary">Legs</button>
  		<button type="button" class="btn btn-outline-primary">Arms</button>
  		<button type="button" class="btn btn-outline-primary">Chest</button>
  		<button type="button" class="btn btn-outline-primary">Back</button>
  		<button type="button" class="btn btn-outline-primary">Core</button>
  		<button type="button" class="btn btn-outline-primary">Cardio</button>
	</div>
	
	<p>PARAGRAPH ABOUT </p>
	
	<p>PARAGRAPH ABOUT </p>
	
	<p>PARAGRAPH ABOUT </p>
	
	<form action="login.do" method="POST">	<!--  Will need to add login.do and/or a "landing page" within UserController -->
        
        <label for="username">Username:</label>
        <input type="text" id="username" name="username">
        <br></br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password">
        <br></br>

        <input type="submit" value="Log In">
    </form>
	
	
	<!--  Log In LAB EXAMPLE -->
	<!-- <form action="login.do" method="POST">
	Error messages
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > --> 
	
	
	</form>


</body>


</html>

