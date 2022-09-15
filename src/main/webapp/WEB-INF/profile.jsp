<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caladea&display=swap" rel="stylesheet"> 
<link href="/css/style.css" rel="stylesheet">
<title>Profile Page</title>
</head>
<body>
<t:background />
<div class="container">

<t:navbar />

<div class="card col-md-6 mx-auto mt-3">
			<div class="card-header ">
				<h3 class="">${oneProfile.user.username}</h3>
			</div>
			<div class="card-body">
				<p class="card-text"><strong>Languages Spoken: </strong> ${oneProfile.languagesSpoken}</p>
				<p class="card-text"><strong>Languages Learning: </strong>${oneProfile.languagesLearning}</p>
				<p class="card-text"><strong>Interests:</strong> 
				${oneProfile.interests}</p>
				<p class="card-text"><strong>Description:</strong> 
				${oneProfile.description}</p>
				<div class="btn-group">
					  <c:if test="${currentUser.profile.id==oneProfile.id}">
						<a class="btn btn-primary mx-2" role="button"
							href="/editProfile/${oneProfile.id}">Edit</a>
						<form:form action="/deleteProfile/${oneProfile.id}" method="delete">
							<button class="btn btn-danger mx-2">Delete Profile</button>
						</form:form>
					  </c:if>
				</div>
				
				
				<div class="m-2"></div>
			</div>
		</div>
</div>

<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>
</body>
</html>