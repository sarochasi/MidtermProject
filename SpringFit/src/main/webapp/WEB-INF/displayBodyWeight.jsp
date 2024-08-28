<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>


<title>Insert title here</title>





<style>
.scrolling-wrapper {
	overflow-x: auto;
	white-space: nowrap;
	padding: 10px 0;
}

.scrolling-wrapper .card {
	display: inline-block;
	width: 200px; /* Adjust as needed */
	margin-right: 10px; /* Space between cards */
}
</style>

</head>

<body>

<%@ include file="navbar.jsp"%>

<h1>Body Weights Data</h1>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Date Weighed</th>
            <th>Weight</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="bodyWeight" items="${ bodyWeightListByUser}">
            <tr>
                <td>${bodyWeight.dateWeighted}</td>
                <td>${bodyWeight.weight}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>

</html>