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
				</div>

				<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

				<h1>
					Recent Transactions <i class="fas fa-history"></i>
				</h1>
				<div class="table-responsive">
					<table
						class="table table-striped table-hover table-bordered table-md">
						<thead class="thead-dark">
							<tr>
								<th>Name</th>
								<th>Category</th>
								<th>Cost</th>
								<th>Date</th>
								<th>Description</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${expenseList}" var="expense">
				<tr>
					<%-- 		<td>${expense.id}</td> --%>
					<td>${expense.name}</td>
					<td>${expense.category}</td>
					<td>${expense.cost}</td>
					<td><fmt:formatDate value="${expense.date}"
							pattern="dd/MM/yyyy" /></td>
					<td>${expense.description}</td>
				
					<td><a type="button" class="btn btn-success"
						href="/updateExpense?id=${expense.id}">Update</a></td>
					<td><a type="button" class="btn btn-danger"
						href="/deleteExpense?id=${expense.id}">Delete</a></td>
				</tr>

			</c:forEach>

		</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
 <script src="js/dashboard_graph.js"></script>
<%@ include file="common/footer.jspf"%>
