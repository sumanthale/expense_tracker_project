var ctx = document.getElementById("myChart").getContext("2d");
var chart = new Chart(ctx, {
  // The type of chart we want to create
  type: "bar",

  // The data for our dataset
  data: {
    labels: [
      "UTILITIES",
      "SAVINGS",
      "TRANSPORTATION",
      "FOOD",
      "DEBT",
      "INSURANCE",
      "PERSONAL_CARE",
      "ENTERTAINMENT",
      "SHOPPING",
      "EDUCATION",
      "MISCELLANEOUS",
      "KIDS",
      "OTHERS",

    ],
    datasets: [
      {
        label: "My First dataset",
        backgroundColor: "rgb(255, 99, 132)",
        borderColor: "rgb(255, 99, 132)",
        data: [0, 10, 5, 2, 20, 30, 45, 10, 5, 2, 20, 30, 45],
      },
    ],
  },

  // Configuration options go here
  options: {
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: false,
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});
