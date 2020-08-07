<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />

<style>
.error-name {
	position: absolute;
	right: 5.5%;
	width: 101px;
}

.error-cost {
	position: absolute;
	right: 5.5%;
	 width: 190px;
}

.alert {
	padding: .5rem 1rem;
}
</style>
</head>
<body>
	<%@ include file="common/main-nav.jspf"%>

	<div class="container-fluid">
		<div class="row">
			<%@ include file="common/side-nav.jspf"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="text-centre">
						Add New Expense <i class="fas fa-plus-circle"></i>
					</h1>
				</div>
				<div class="container mt-5 shadow">
					<form:form action="/verifyExpense" modelAttribute="newExpense"
						method="post" cssClass="form-signin">


						<form:errors path="name" cssClass="alert alert-danger error-name" />
						<div class="form-group">
							<form:input type="text" id="name" cssClass="form-control"
								placeholder="Name" path="name" />
						</div>


						<div class="input-group mb-3">
							<form:select path="category" cssClass="custom-select">
								<form:options items="${categoryList}" />
							</form:select>
							<div class="input-group-append">
								<label class="input-group-text" for="inputGroupSelect02">Options</label>
							</div>
						</div>
						<form:errors path="cost" cssClass="alert alert-danger error-cost" />
						<div class="form-group">
							<form:input type="number" id="cost"
								cssClass="form-control rounded" placeholder="Cost" path="cost"
								onfocus="this.value=''" />
						</div>
						<div class="form-group">
							<form:textarea type="text" id="description"
								cssClass="form-control" placeholder="Comments"
								path="description" rows="3" />
						</div>
						<div class="form-group">
							<form:input type="text" id="date" cssClass="form-control rounded"
								placeholder="Date" path="date" />
						</div>
						<div class="d-flex justify-content-start">
							<button
								class=" btn-lg btn btn-outline-primary btn-inline-block ml-1 font-weight-bolder shadow mb-4"
								type="submit">
								Submit &nbsp; <i class="fas fa-check-circle"></i>
							</button>
							<a
								class="btn btn-lg btn-outline-danger btn-inline-block ml-3 font-weight-bolder shadow mb-4"
								href="/landingPage"> Cancel &nbsp; <i class="fas fa-times"></i>&nbsp;
							</a>

						</div>

					</form:form>
				</div>
			</main>
		</div>
	</div>
</body>
<%@ include file="common/footer.jspf"%>
