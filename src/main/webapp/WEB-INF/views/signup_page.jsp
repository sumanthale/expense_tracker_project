<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/signup.css" />

<title>Expense</title>
</head>
<body>
	<form:form action="/verifySignup" modelAttribute="newUser"
		method="post" cssClass="form-signin position-absolute">
		<h1 class="h3 mb-3 font-weight-normal text-white">Sign Up</h1>
		<label for="name" class="sr-only">Name</label>
		<form:errors path="name" cssClass="alert alert-danger error-name" />


		<form:input type="text" id="name" cssClass="form-control"
			placeholder="Name" path="name" />


		<form:errors path="email" cssClass="alert alert-danger error-email" />
		<label for="inputEmail" class="sr-only">Email address</label>

		<form:input type="email" id="inputEmail" cssClass="form-control"
			placeholder="Email address" path="email" />
		<label for="inputPassword" class="sr-only">Password</label>
		<form:errors path="password" cssClass="alert alert-danger error-password" />
		<form:input type="password" id="inputPassword" cssClass="form-control"
			placeholder="Password" path="password" />
		<span class="showpwd"><i class="far fa-eye" id="togglePassword"></i></span>


		<label for="income" class="sr-only">Income</label>
		<form:errors path="income" cssClass="alert alert-danger error-income" />
		<form:input type="number" id="income" cssClass="form-control"
			placeholder="Income" path="income" />
		<button class="btn btn-lg btn-primary btn-block" type="submit">
			Sign up &nbsp;<i class="fas fa-user-plus"></i>
		</button>
	</form:form>

	<script>
		const togglePassword = document.querySelector("#togglePassword");
		const password = document.querySelector("#inputPassword");
		togglePassword.addEventListener("click", function(e) {

			const type = password.getAttribute("type") === "password" ? "text"
					: "password";
			password.setAttribute("type", type);
			this.classList.toggle("fa-eye-slash");
		});
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>
