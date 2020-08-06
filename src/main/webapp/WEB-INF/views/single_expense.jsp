<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="common/main-nav.jspf"%>

	<div class="container-fluid">
		<div class="row">
			<%@ include file="common/side-nav.jspf"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<!-- <div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1>
						Dashboard <i class="far fa-chart-bar"></i>
					</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">
								Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">
								Export</button>
						</div>
						<button type="button" class="btn btn-sm btn-outline-secondary">
							<span data-feather="calendar"></span> This Month
						</button>
					</div>
				</div> -->
				<h1>
					Recent Transactions  On  ${expenseCategory} &nbsp;<i class="fas fa-history"></i>
				</h1>
				<div class="table-responsive">
					<table
						class="table table-striped table-hover table-bordered table-md">
						<thead class="thead-dark">
							<tr>
								<th class="h5 text-white">Name</th>
								<th class="h5 text-white">Category</th>
								<th class="h5 text-white">Cost</th>
								<th class="h5 text-white">Date</th>
								<th class="h5 text-white">Description</th>
								<th class="h5 text-white">Update</th>
								<th class="h5 text-white">Delete</th>
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${expenseCategoryList}" var="expense">
				<tr>
					<%-- 		<td>${expense.id}</td> --%>
					<td class="h6 text-secondary">${expense.name}</td>
					<td class="h6 text-secondary">${expense.category}</td>
					<td class="h6 text-secondary">${expense.cost}</td>
					<td class="h6 text-secondary"><fmt:formatDate value="${expense.date}"
							pattern="dd/MM/yyyy" /></td>
					<td class="h6 text-secondary">${expense.description}</td>
				
					<td><a type="button" class="btn btn-success"
						href="/updateCategoryExpense?id=${expense.id}">Update</a></td>
					<td><a type="button" class="btn btn-danger"
						href="/deleteCategoryExpense?id=${expense.id}">Delete</a></td>
				</tr>

			</c:forEach>

		</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
<%@ include file="common/footer.jspf"%>
