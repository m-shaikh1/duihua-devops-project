<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Caladea&display=swap"
	rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<title>DuiHua Users</title>
</head>
<body>
	<t:background />
	<div class="container">
		<t:navbar />
	</div>
	<div class="row">
		<div class="col-10 offset-1 my-2">
			<h3 class="card-header">Discover Users</h3>
			<table class="table table-striped table-bordered table-hover table-responsive table-secondary opacity-75">
				<thead>
					<tr>
						<th>Username</th>
						<th>Languages Spoken</th>
						<th>Languages Learning</th>
						<th>User Interests</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allProfiles}" var="profile">
						<tr>
							<td><a href="/profileDetails/${profile.id}">${profile.user.username}
							</a></td>
							<td>${profile.languagesSpoken}</td>
							<td>${profile.languagesLearning}</td>
							<td>${profile.interests}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="/js/webTheme.js"></script>
</body>
</html>