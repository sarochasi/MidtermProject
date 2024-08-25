<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Account Profile - could customize with '$''s Account</title>
	
</head>


<body>

	<%-- Add NAVBAR later --%>
	<%-- <jsp:include page="navbar.jsp"/> --%>

	<h2>Account Details</h2>

	<!--  	Update account.jsp to output escaped (c:out) user data if the user is logged in 
			(i.e. in session, accessible on the JSP page with the sessionScope variable), 
			or "Not Logged In." otherwise. 		-->
	
	<%-- Output user details --%>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<ul>
            		<li>Username: <c:out value="${sessionScope.loggedInUser.username}"/></li>
           	 	<%-- <p>Password: <c:out value="${sessionScope.loggedInUser.password}"/></p> --%>
            		<li>First Name: <c:out value="${sessionScope.loggedInUser.firstName}"/></li>
            		<li>Last Name: <c:out value="${sessionScope.loggedInUser.lastName}"/></li>
            	</ul>
        </c:when>

        <c:otherwise>
            <p>Not Logged In.</p>
        </c:otherwise>
        
    </c:choose>
	
<form action = "GetWorkoutPage.do" method="GET">
	<input type="submit" value="Create New Workout"/>
</form>
	
	
</body>



</html>
















