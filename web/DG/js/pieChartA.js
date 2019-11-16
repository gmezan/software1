//
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");

//obteniendo la data de la tabla:
var ga = document.getElementById("dataTable");
var i;
var dataT = [];
var labelsT = [];
var colorsT = [];
for(i = 0; i < document.getElementById("dataTable").rows.length -2; i++ ){
    dataT[i] = parseInt(document.getElementById("dataTable").rows[i+1].cells[4].innerHTML,10);
    labelsT[i] = document.getElementById("dataTable").rows[i+1].cells[0].innerHTML;
    colorsT[i] = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
}

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: labelsT,
    datasets: [{
      data: dataT,
      backgroundColor: colorsT,
      hoverBackgroundColor: colorsT,
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
      display: true,
      position: 'right'

    },
    cutoutPercentage: 50,

  },
});
