var Charts = function() {
  
  var bindChartButtonClick = function() {
    $("a.chart-button").on("click", function(e){
      e.preventDefault();
      var chartName = $(this).data("chart");
      
      initializeChart(chartName);
    });
  }
  
  var initializeChart = function(chartName) {
    $.ajax({
      dataType: "json",
      url: '/charts/'+chartName,
      global: false,
      success:  function(data) {
          Highcharts.stockChart('charts', {
            rangeSelector : {
              selected: 3,
              inputEnabled:false,
              allButtonsEnabled: false,
              enabled: false
            },              
            xAxis: {
              type: 'datetime',
              dateTimeLabelFormats: {
               day: '%d %b %Y'    //ex- 01 Jan 2016
              }
            },
            scrollbar :{
              enabled: false
            },
            navigator:{
              enabled: false
            },
            title: {
              text: ''
            },
            series: [{
              name: chartName.toUpperCase(),
              tooltip: {
                  valueDecimals: 2
              },
              threshold: null,
              data: data
            }]
          });
      }
    }); 
  }
  
  return {
    
    init: function() {
      initializeChart("bitcoin");
      bindChartButtonClick();
    }
    
  }
  
}();