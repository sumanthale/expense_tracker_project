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
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect02"
								onchange="fun(); return false;">
								<option selected value="bar">bar</option>
								<option value="pie">pie</option>
								<option value="horizontalBar">horizontalBar</option>
								<option value="doughnut">doughnut</option>
								<option value="line">line</option>
								<option value="radar">radar</option>
								<option value="polarArea">polarArea</option>
							</select>
							<div class="input-group-append">
								<label class="input-group-text" for="inputGroupSelect02">Charts</label>
							</div>
						</div>
					</div>
				</div>
		
				<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
				<input value="${FOOD}" id="FOOD" class="allsum"> <input
					value="${ENTERTAINMENT}" id="ENTERTAINMENT" class="allsum">
				<input value="${UTILITIES}" id="UTILITIES" class="allsum"> <input
					value="${SAVINGS}" id="SAVINGS" class="allsum"> <input
					value="${DEBT}" id="DEBT" class="allsum"> <input
					value="${INSURANCE}" id="INSURANCE" class="allsum"> <input
					value="${PERSONAL_CARE}" id="PERSONAL_CARE" class="allsum">
				<input value="${SHOPPING}" id="SHOPPING" class="allsum"> <input
					value="${EDUCATION}" id="EDUCATION" class="allsum"> <input
					value="${MISCELLANEOUS}" id="MISCELLANEOUS" class="allsum">
				<input value="${KIDS}" id="KIDS" class="allsum"> <input
					value="${TRANSPORTATION}" id="TRANSPORTATION" class="allsum">
				<input value="${OTHERS}" id="OTHERS" class="allsum">
				<h1>
					Recent Transactions <i class="fas fa-history"></i>
				</h1>
				<div class="table-responsive">
					<table
						class="table table-striped table-hover table-bordered table-md">
						<thead class="thead-dark">
							<tr align="center">
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
							<c:forEach items="${expenseList}" var="expense">
								<tr align="center">
									<%-- 		<td>${expense.id}</td> --%>
									<td class="h6 text-secondary">${expense.name}</td>
									<td class="h6 text-secondary">${expense.category}</td>
									<td class="h6 text-secondary">${expense.cost}</td>
									<td class="h6 text-secondary"><fmt:formatDate value="${expense.date}"
											pattern="dd/MM/yyyy" /></td>
									<td class="h6 text-secondary">${expense.description}</td>

									<td class="h6"><a type="button" class="btn btn-success"
										href="/updateExpense?id=${expense.id}">Update</a></td>
									<td class="h6"><a type="button" class="btn btn-danger"
										href="/deleteExpense?id=${expense.id}">Delete</a></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<h1 class="text-warning d-1 text-centre">${noExpFound}</h1>
				</div>
			</main>
		</div>
	</div>
</body>
<script src="js/dashboard_graph.js"></script>
<%@ include file="common/footer.jspf"%>
