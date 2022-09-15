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
<title>Welcome Page</title>
</head>
<body class="light">
	<t:background />
	<div class="container">
		<t:navbar />

		<div class="row d-flex justify-content-between align-items-center">
			<h2 class="my-2 col-6">
				Welcome,
				<c:out value="${currentUser.username}"></c:out>
			</h2>
			<a class="btn btn-secondary col-2 fs-6 m-2" href="/newChatRoom">Create
				Your Own Chat Room</a>
		</div>
		<div class="row opacity-50">

			<h3 class="card-header">Active Chat Rooms</h3>
			<table
				class="table table-striped table-bordered table-hover table-responsive table-secondary opacity-75">
				<thead>
					<tr>
						<th>Chat Room Name</th>
						<th>Language</th>
						<!-- <th># Online</th> -->
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${chatRooms}" var="chatRoom">
						<tr>
							<td><a href="/chatRoom/${chatRoom.id}">${chatRoom.roomName}
							</a></td>
							<td>${chatRoom.language}</td>
							<%-- <td>${chatRoom.online.size()}</td> --%>
							<td>${chatRoom.description}</td>
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
</body>
</html>