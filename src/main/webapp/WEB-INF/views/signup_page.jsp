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

<style>
.footerr {
	top: 85%;
	left: 46%;
}
</style>

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
			placeholder="Email address" path="email" /> <span class="text-danger error-email  p-2 w-75 h-auto">${invaid_email}</span>
		<label for="inputPassword" class="sr-only">Password</label>
		<form:errors path="password" cssClass="alert alert-danger error-password" />
		<form:input type="password" id="inputPassword" cssClass="form-control"
			placeholder="Password" path="password" />
		<span class="showpwd"><i class="far fa-eye" id="togglePassword"></i></span>


		<label for="income" class="sr-only">Income</label>
		<form:errors path="income" cssClass="alert alert-danger error-income" />
		<form:input type="number" id="income" cssClass="form-control"
			placeholder="Income" path="income"  onfocus="this.value=''" />
	
		<button class="btn btn-lg btn-primary btn-inline-block ml-1" type="submit">
			Sign up &nbsp; <i class="fas fa-user-plus"></i>
		</button>
		<a class="btn btn-lg btn-danger btn-inline-block ml-3" href="/">
			Cancel &nbsp; <i class="fas fa-times"></i>&nbsp;
		</a>
	</form:form>
	<footer class="footerr position-absolute text-white h6 ">Copyright © 2020
		ALE SUMANTH. All Rights Reserved </footer>
<%@ include file="common/footer.jspf" %>
