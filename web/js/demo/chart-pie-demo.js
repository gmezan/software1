Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");

var donacion_egresados = 19;
var donacion_alumnos = 23 ;

// dataTable[][2] = condicion
// dataTable[][3] = donacion


var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ['Alumnos', 'Egresados'],
    datasets: [{
      data: [donacion_alumnos,donacion_egresados],
      backgroundColor: ['#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false,
      position: 'right'

    },
    cutoutPercentage: 50,

  },
});