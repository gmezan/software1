// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");

//obteniendo la data de la tabla:
var ga = document.getElementById("dataTable");
var i;
var donacion_egresados = 0;
var donacion_alumnos = 0 ;

// dataTable[][2] = condicion
// dataTable[][3] = donacion
for(i = 0; i < document.getElementById("dataTable").rows.length -2; i++ ){
  document.getElementById("dataTable").rows[i+1].cells[3].innerHTML = parseInt(document.getElementById("dataTable").rows[i+1].cells[3].innerHTML) + 50;
  if (document.getElementById("dataTable").rows[i+1].cells[2].innerHTML.toLowerCase() ==='egresado'){
    if (parseInt(document.getElementById("dataTable").rows[i+1].cells[3].innerHTML)<100){
      document.getElementById("dataTable").rows[i+1].cells[1].innerHTML = 'NO';
    }
    else{
      document.getElementById("dataTable").rows[i+1].cells[1].innerHTML = 'SI';
    }
    donacion_egresados += 1;
  }
  else{
    donacion_alumnos += 1;
  }

}

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
      display: true,
      position: 'right'

    },
    cutoutPercentage: 50,

  },
});