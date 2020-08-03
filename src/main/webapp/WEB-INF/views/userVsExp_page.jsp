
<%@ include file="common/header.jspf"%>
<link href="css/dashboard.css" rel="stylesheet" />
<style>
#exp,#inc{
display:none;
}
.checkbal,.main{
margin-top:-30px;
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
					<h1 class="text-centre">Expense VS Income</h1>
				</div>
				<input value="${exp}" id="exp"> <input value="${inc}"
					id="inc">
					
				<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
				<p class="d-flex justify-content-center checkbal">
					<button class="btn btn-primary " type="button" onclick="myFunction()"
						data-toggle="collapse" data-target="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample">
						Check Balance Income</button>
				</p>
				<div class="collapse" id="collapseExample">
					<div class="card card-body text-center">
					<p class="alert alert-info" id="demo"></p></div>
				</div>
				


			</main>
		</div>
	</div>
</body>
<script>
	var exp = document.getElementById("exp").value;
	var inc = document.getElementById("inc").value;

	var bal=inc-exp;
	if(bal>0){
		function myFunction() {
			  
			  document.getElementById("demo").innerHTML = bal;  
			}
	}
	else{
		  document.getElementById("demo").innerHTML = bal;  
		 var element = document.getElementById("demo");
		  element.classList.remove("alert-info");
		  element.classList.add("alert-danger");
		
	}
	
	var ctx = document.getElementById("myChart").getContext("2d");
	//Chart.defaults.global.defaultFontFamily = "Lato";
	Chart.defaults.global.defaultFontSize = 16;
	Chart.defaults.global.defaultFontColor = "#777";
	var chart = new Chart(ctx, {
		// The type of chart we want to create
		type : "bar", // bar, horizontalBar, pie, line, doughnut, radar, polarArea

		// The data for our dataset
		data : {
			labels : [ "Expense", "Income",

			],
			datasets : [ {
				label : "My First dataset",
				backgroundColor : [ "#ff507c","#2ef7f4", 

				],
				//  backgroundColor: 'transparent',
				data : [ exp, inc ],
				borderWidth : 1,
				borderColor : "#777",
				hoverBorderWidth : 3,
				hoverBorderColor : "#000",
				pointBackgroundColor : '#007bff'
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
