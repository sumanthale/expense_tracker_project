<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />

<style>
.error-name {
	position: absolute;
	right: 5.5%;
	width: 101px;
}

.error-income {
	position: absolute;
	right: 5.5%;
	width: 176px;
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
						Edit Your Details &nbsp;<i class="fas fa-user-edit"></i>
					</h1>
				</div>
				<div class="container mt-5 shadow">
					<form:form action="/verifyUpdateDetails" modelAttribute="user"
						method="post" cssClass="form-signin">


						<form:errors path="name" cssClass="alert alert-danger error-name" />
						<label for="name" class="h6">Name </label>
						<div class="form-group">
							<form:input type="text" id="name" cssClass="form-control"
								placeholder="Name" path="name" />
						</div>

						<form:errors path="email" cssClass="alert alert-danger error-name" />
						<label for="email" class="h6">Email </label>  ${invaid_email}
						<div class="form-group">
							<form:input type="email" id="email" cssClass="form-control"
								placeholder="Email" path="email" />
						</div>


						<form:errors path="password"
							cssClass="alert alert-danger error-name" />
						<label for="password" class="h6">Password </label>
						<div class="form-group">
							<form:input type="text" id="password" cssClass="form-control"
								placeholder="Password" path="password" />
						</div>

						<form:errors path="income"
							cssClass="alert alert-danger error-income" />
						<label for="income" class="h6">Income </label>
						<div class="form-group">
							<form:input type="number" id="income"
								cssClass="form-control rounded" placeholder="Cost" path="income" />
						</div>


						<div class="d-flex justify-content-start">
							<button
								class=" btn-lg btn btn-outline-primary btn-inline-block ml-1 font-weight-bolder shadow mb-4"
								type="submit">
								Update &nbsp; <i class="fas fa-user-plus"></i>
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
