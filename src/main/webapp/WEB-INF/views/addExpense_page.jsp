<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>Expense</title>
</head>
<body>
	<form:form action="/verifyExpense" modelAttribute="newExpense"
		method="post" cssClass="form-signin">

		<form:errors path="name" cssClass="alert alert-danger error-name" />


		<form:input type="text" id="name" cssClass="form-control"
			placeholder="Name" path="name" />


		<form:errors path="category" cssClass="alert alert-danger error-email" />
		<%-- <form:input type="text" id="cost" cssClass="form-control"
			placeholder="Category" path="category" /> --%>

		 <form:select path="category" cssClass="custom-select">
			<form:options items="${categoryList}" />
		</form:select> 

		<form:errors path="cost" cssClass="alert alert-danger error-email" />
		<form:input type="number" id="cost" cssClass="form-control"
			placeholder="Cost" path="cost" onfocus="this.value=''" />

		<form:errors path="description"
			cssClass="alert alert-danger error-password" />
		<form:textarea type="text" id="description" cssClass="form-control"
			placeholder="Comments" path="description" />




		<form:errors path="date" cssClass="alert alert-danger error-income" />
		<form:input type="text" id="date" cssClass="form-control"
			placeholder="Income" path="date" />


		<button class="btn btn-lg btn-primary btn-inline-block ml-1"
			type="submit">
			Submit &nbsp; <i class="fas fa-user-plus"></i>
		</button>
		<a class="btn btn-lg btn-danger btn-inline-block ml-3"
			href="/landingPage"> Cancel &nbsp; <i class="fas fa-times"></i>&nbsp;
		</a>
	</form:form>

	<%@ include file="common/footer.jspf"%>