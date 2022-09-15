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
<link
	href="https://fonts.googleapis.com/css2?family=Caladea&display=swap"
	rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<title>Create a Chat Room</title>
</head>
<body>
	<t:background />
	<div class="container">
		<t:navbar />
		<div class="row mt-3">
			<div class="card col-6 offset-3">
				<div class="card-body">
					<h1 class="card-title">Create your Chat Room</h1>
					<form:form action="/createChatRoom" method="POST"
						modelAttribute="chatRoom">
						<div class="form-floating mb-3">
							<form:errors class="text-danger mb-5" path="roomName" />
							<form:input type="text" class="form-control" path="roomName"
								placeholder="Enter room name..." />
							<form:label path="roomName">Chat Room Name</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:errors class="text-danger" path="language" />
							<form:input type="text" class="form-control" path="language"
								placeholder="Language we will practice is..." />
							<form:label path="language">Chat Room Language</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:errors class="text-danger" path="description" />
							<form:textarea type="text" class="form-control"
								path="description" placeholder="This chat room is..." />
							<form:label path="description">Description of your chat room</form:label>
						</div>
						<!-- Hidden Input for userId -->
						<form:input type="hidden" value="${currentUser.id}" path="user" />

						<a href="/" role="button" class="btn btn-primary">Cancel</a>
						<input type="submit" class="btn btn-primary" value="Submit" />
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>
</html>