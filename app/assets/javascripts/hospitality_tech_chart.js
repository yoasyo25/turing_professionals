

$(document).ready(function(){
  if($('div').is('.insights')){
  $.ajax({
    type: 'GET',
    url: '/api/v1/industry_tech?name=Hospitality',
    success: function(data) {
      var technologies = Object.keys(data)
      var companies = Object.values(data)
      console.log(technologies, companies)
       Highcharts.chart('container-hospitality-tech', {
         chart: {
             type: 'column'
         },
         title: {
             text: 'Hospitality'
         },
         xAxis: {
             categories: technologies,
         },
         yAxis: {
             min: 0,
             title: {
                 text: 'Number of Companies'
             }
         },
         legend: {
             enabled: false
         },
         colors: [
          '#283044',
          '#216869',
          '#70798C',
          '#7FEFBD',
          '#000000',
          '#C2BBF0',
          '#3590F3',
          '#8FB8ED',
          '#B8336A',
          '#E0BAD7',
          '#5F634F',
          '#DF2935'
        ],

        plotOptions: {
            series: {
                colorByPoint: true
            }
        },
         series: [{
             name: 'Companies',
             data: companies
         }]
       });
     }
   });
 }
 });
