<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav>

<!-- 	<a href"home.do">
		<img src="images/Logo_screenshot.png" alt="Springfit logo">
	</a> -->

	<!-- HYPERLINK (home) -->
	<a href="home.do">Home</a>
	
	<!--  LOGIN LINK DISPLAYS -> ONLY if user is NOT logged in. -->
	<%-- <c:if test="${empty sessionScope.loggedInUser }">
		<a href="login.do">Login</a>
	</c:if> --%>
	
	<!--  ACCOUNT  -->
	<%-- <c:if test="${not empty sessionScope.loggedInUser }">
		<a href="account.do">My Account</a>
	</c:if> --%>

	<!--  LOGOUT  -->
	<%-- <c:if test="${not empty sessionScope.loggedInUser }">
		<a href="logout.do">Logout</a>
	</c:if> --%>
	
	
</nav>