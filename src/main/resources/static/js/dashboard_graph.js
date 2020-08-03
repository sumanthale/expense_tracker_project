var sum = document.getElementsByClassName("allsum");
var sumlis = [];
for (var i = 0; i < sum.length; i++) {
	console.log(sum[i].value);
	sumlis.push(parseInt(sum[i].value));
}
function fun() {
	var ctx = document.getElementById("myChart").getContext("2d");
	if (window.bar != undefined)
		window.bar.destroy();
	var gtype = document.getElementById("inputGroupSelect02").value;
	Chart.defaults.global.defaultFontFamily = "Ubuntu";
	Chart.defaults.global.defaultFontSize = 16;
	Chart.defaults.global.defaultFontColor = "#777";
	var istrue = false;
	if (gtype === 'pie' || gtype === 'doughnut' || gtype === "polarArea") {
		istrue = true;
	}
	window.bar = new Chart(ctx, {
		type : gtype, // bar, horizontalBar, pie, line, doughnut, radar,
						// polarArea

		data : {
			labels : [ "FOOD", "ENTERTAINMENT", "UTILITIES", "SAVINGS", "DEBT",
					"INSURANCE", "PERSONAL-CARE", "SHOPPING", "EDUCATION",
					"MISCELLANEOUS", "KIDS", "TRANSPORTATION", "OTHERS", ],
			datasets : [
					{
						label : "Total Cost",
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
								"rgba(255, 165, 2,0.6)",
								"rgba(123, 237, 159,.6)", ],
						// backgroundColor: 'transparent',
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
				display : istrue,
			},
		},
	});
}

fun();
