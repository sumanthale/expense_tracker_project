<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="common/main-nav.jspf"%>

	<div class="container-fluid">
		<div class="row">
			<%@ include file="common/side-nav.jspf"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				 <div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1>
						Enter Transaction Date
					</h1>
					<form:form action="/getExpenseByDate" method ="post"  modelAttribute="addedDate">
						<div class="btn-toolbar mb-2 mb-md-0">
						<div class="input-group mb-3">
							<form:input type="text" id="date" cssClass="form-control rounded"
								placeholder="Date" path="date" />
							<div class="input-group-append">
								<input type="submit" class="input-group-text"  value="Submit">
							</div>
						</div>
					</div>
					</form:form>
					
				</div>
				<h1>
					 Transactions On ${added_date} 
				</h1>
				<div class="table-responsive">
					<table
						class="table table-striped table-hover table-bordered table-md">
						<thead class="thead-dark">
							<tr align="center">
								<th  class="h5 text-white">Name</th>
								<th  class="h5 text-white">Category</th>
								<th  class="h5 text-white">Cost</th>
								<th  class="h5 text-white">Date</th>
								<th  class="h5 text-white">Description</th>
							<!-- 	<th>Update</th>
								<th>Delete</th> -->
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${dateList}" var="expense">
				<tr align="center">
					<%-- 		<td>${expense.id}</td> --%>
					<td class="h6 text-secondary">${expense.name}</td>
					<td class="h6 text-secondary">${expense.category}</td>
					<td class="h6 text-secondary">${expense.cost}</td>
					<td class="h6 text-secondary"><fmt:formatDate value="${expense.date}"
							pattern="dd/MM/yyyy" /></td>
					<td class="h6 text-secondary">${expense.description}</td>
				
				<%-- 	<td><a type="button" class="btn btn-success"
						href="/updateDatedExpense?id=${expense.id}">Update</a></td>
					<td><a type="button" class="btn btn-danger"
						href="/deleteDatedExpense?id=${expense.id}">Delete</a></td> --%>
				</tr>

			</c:forEach>
													

		</tbody>
					</table>
					                                                ${NoExpenseOnDate} 
				</div>
			</main>
		</div>
	</div>
</body>
<%@ include file="common/footer.jspf"%>
