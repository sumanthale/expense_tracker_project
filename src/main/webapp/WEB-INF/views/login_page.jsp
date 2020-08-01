<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">


<title>Expense</title>
</head>
<body>
	<form class="form-signin position-absolute" action="/verifyLogin"
		method="post">
		<h1 class="h3 mb-3 font-weight-normal text-white">Sign in</h1>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="email" id="inputEmail" class="form-control"
			placeholder="Email address" name="email" required autofocus /> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" id="inputPassword" class="form-control"
			name="password" placeholder="Password" required />
			<span class="showpwd"><i class="far fa-eye" id="togglePassword"></i></span>
		<div class="checkbox mb-1 text-white">
			<label> <input type="checkbox" value="remember-me" />
				Remember me
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">
			Sign in &nbsp;<i class="fas fa-sign-in-alt"></i>
		</button>
		<div class=" text-center text-danger font-weight-bold">${error}</div>

		<small id="new" class="form-text text-center text-white">Don't
			have an account <a class="text-success" id="signup"
			href="/signUpForm">Sign up</a>
		</small>
	</form>

<%@ include file="common/footer.jspf" %>
