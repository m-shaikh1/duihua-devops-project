<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caladea&display=swap" rel="stylesheet"> 
<link href="/css/style.css" rel="stylesheet">
<title>Registration Page</title>
</head>
<body>

	<div class="container">
		<div class="row mx-auto">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded"> <a
				class="navbar-brand" href="#">Duihua</a> `<span class="navbar-text">
				Discover the world. </span> </nav>
		</div>
		<div class="row mt-2">
			<div class="col-6" id="splash-pic">
				<img
					src="https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
					class="img-fluid rounded float-left" alt="Responsive image" />
			</div>
			<div class="card col-6">
				<div class="card-header">
					<h2 class="card-title">Register for an Account</h2>
				</div>
				<p>
					<form:errors path="user.*" />
				</p>

				<form:form class="card-body" method="POST" action="/registration"
					modelAttribute="user">
					<p class="form-group">
						<form:label path="username">Username:</form:label>
						<form:input path="username" />
					</p>
					<p class="form-group">
						<form:label path="email">Email:</form:label>
						<form:input path="email" />
					</p>
					<p class="form-group">
						<form:label path="password">Password:</form:label>
						<form:password path="password" />
					</p>
					<p class="form-group">
						<form:label path="passwordConfirmation">Password Confirmation:</form:label>
						<form:password path="passwordConfirmation" />
					</p>
					<input class="btn btn-primary" type="submit" value="Register" />
				</form:form>
				<p class="card-body">
					<a class="card-text" href="/login">Return to login</a>
				</p>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>