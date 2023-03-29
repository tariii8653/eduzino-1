$(function () {
  /* ChartJS
   * -------
   * Data and config for chartjs
   */
  'use strict';
  let data = {
    labels: ["2013", "2014", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"],
    datasets: [{
      label: '# of Votes',
      data: [100, 25, 3, 5, 2, 3, 60, 50, 60, 20, 10, 5],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
		'rgba(255, 99, 132, 0.2)',
		 'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)'
      ],
      borderWidth: 1,
      fill: false
    }]
  };
  let options = {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    },
    legend: {
      display: false
    },
    elements: {
      point: {
        radius: 0
      }
    }

  };
  

  // Get context with jQuery - using jQuery's .get() method.
  if ($("#barChart").length) {
    let barChartCanvas = $("#barChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
    let barChart = new Chart(barChartCanvas, {
      type: 'bar',
      data: data,
      options: options
    });
  }


  
});