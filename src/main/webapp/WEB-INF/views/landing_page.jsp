<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>Expense</title>
</head>
<body>
	Welcome ${user.name} Your Email is ${user.email} Your Income is
	${user.income} &#8377;





	<table class="table table-striped table-hover table-bordered ">
		<caption>Expense Table</caption>
		<thead class="thead-dark">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Cost</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${expenseList}" var="expense">
				<tr>
					<td>${expense.id}</td>
					<td>${expense.name}</td>
					<td>${expense.category}</td>
					<td>${expense.cost}</td>
					<td><fmt:formatDate value="${expense.date}"
							pattern="dd/MM/yyyy" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
		<a class="btn btn-primary" href="addExpense">addExpense</a>

	<%@ include file="common/footer.jspf"%>