var Charts = function() {
  
  var bindChartButtonClick = function() {
    $("a.chart-button").on("click", function(e){
      e.preventDefault();
      var chartName = $(this).data("chart");
      
      initializeChart(chartName);
    });
  }
  
  var getMonthBack = function() {
    var d = new Date();
    d.setMonth(d.getMonth() - 1);
    d.setHours(0,0,0);
    return d;
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
              type: 'datetime'
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