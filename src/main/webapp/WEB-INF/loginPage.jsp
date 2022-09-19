<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Caladea&display=swap"
	rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<title>Login Page</title>
</head>
<body class="bg-light">
	<div class="container">
		<div class="row mx-auto">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded"> <a
				class="navbar-brand" href="#">Duihua</a> `<span class="navbar-text">
				Discover the world. </span> </nav>
		</div>
		<div class="row mx-auto mt-3">
			<div class="col-6" id="splash-pic">
				<img
					src="https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
					class="img-fluid rounded float-left" alt="Responsive image" />
			</div>
			<div class="card col-6">
				<div class="card-header">
					<c:if test="${logoutMessage != null}">
						<c:out value="${logoutMessage}"></c:out>
					</c:if>
					<h3>Login</h3>
					<c:if test="${errorMessage != null}">
						<c:out value="${errorMessage}"></c:out>
					</c:if>
				</div>
				<form class="card-body" method="POST" action="/login">
					
					<p class="form-group">
						<label for="username">Username</label> <input type="text"
							class="form-control" id="username" name="username" />
					</p>
					<p class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password" />
					</p>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input class="btn btn-primary"
						type="submit" value="Login" />
				</form>
				<p class="card-body">
					<a class="card-text" href="/registration">New around here? Sign up</a>
				</p>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>