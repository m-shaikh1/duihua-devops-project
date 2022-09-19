<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

<div class="row fs-5">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-light bg-light rounded"> <a
				class="navbar-brand" href="/">DuiHua</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<span class="navbar-text"> Discover the world. </span>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/profileDetails/${currentUser.profile.id}">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/">Chat
							Rooms</a></li>
					<li class="nav-item"><a class="nav-link" href="/discover">Discover
							Users</a></li>
					<li class="nav-item"><a class="nav-link" href="#!" id="aboutToast">About</a></li>
					<li class="nav-item"><form class="form-inline" id="logoutForm" method="POST"
							action="/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input class="form-control mr-sm-2 btn-secondary" type="submit" value="Logout" />
						</form></li>
				</ul>

			</div>
			</nav>
		</div>

	<jsp:doBody />


</body>
</html>