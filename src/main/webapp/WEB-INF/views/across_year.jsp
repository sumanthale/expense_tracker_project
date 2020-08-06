
<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />
<style>
.allsum {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="common/main-nav.jspf"%>

	<input value="${january}" class="allsum">
	<input value="${feburary}" class="allsum">
	<input value="${march}" class="allsum">
	<input value="${april}" class="allsum">
	<input value="${may}" class="allsum">
	<input value="${june}" class="allsum">
	<input value="${july}" class="allsum">
	<input value="${august}" class="allsum">
	<input value="${september}" class="allsum">
	<input value="${october}" class="allsum">
	<input value="${november}" class="allsum">
	<input value="${december}" class="allsum">


	<div class="container-fluid">
		<div class="row">
			<%@ include file="common/side-nav.jspf"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="text-centre">Yearly Expenses</h1>
				</div>

				<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>





			</main>
		</div>
	</div>
</body>
<script>
	var sum = document.getElementsByClassName("allsum");
	var sumlis = [];
	for (var i = 0; i < sum.length; i++) {
		console.log(sum[i].value);
		sumlis.push(parseInt(sum[i].value));
	}
	var ctx = document.getElementById("myChart").getContext("2d");
	Chart.defaults.global.defaultFontSize = 16;
	Chart.defaults.global.defaultFontColor = "#777";
	var chart = new Chart(ctx, {
		type : "bar",
		data : {
			labels : [ "January", "February", "March", "April", "May", "June",
					"July", "August", "September", "October", "November",
					"December" ],
			datasets : [
					{
						label : "Total Expense's",
						backgroundColor : [ "#ff507c", "#2ef7f4",

						],
						borderWidth : 1,
						backgroundColor : [ "rgba(232, 67, 147,0.6)",
								"rgba(244, 67, 54,0.6)",
								"rgba(33, 150, 243,0.6)",
								"rgba(139, 195, 74,0.6)",
								"rgba(75, 192, 192, 0.6)",
								"rgba(109, 33, 79,1.6)",
								"rgba(255, 99, 132, 0.6)",
								"rgba(156, 39, 176,0.6)",
								"rgba(52, 73, 94,0.6)",
								"rgba(255, 235, 59,0.6)",
								"rgba(112, 161, 255,0.6)",
								"rgba(255, 165, 2,0.6)", ],
						data : sumlis,
						borderWidth : 1,
						borderColor : "#777",
						hoverBorderWidth : 3,
						hoverBorderColor : "#000",
						pointBackgroundColor : "#007bff",
					}, ],
		},

		// Configuration options go here
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true,
					},
				}, ],
			},
			legend : {
				display : false,
			},

		},
	});
</script>
<%@ include file="common/footer.jspf"%>
