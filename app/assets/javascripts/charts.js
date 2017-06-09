var Charts = function() {
  
  var bindChartButtonClick = function() {
    $("a.chart-button").on("click", function(e){
      e.preventDefault();
      var chartName = $(this).data("chart");
      
      initializeCharts(chartName);
    });
  }
  
  var getMonthBack = function() {
    var d = new Date();
    d.setMonth(d.getMonth() - 1);
    d.setHours(0,0,0);
    return d;
  }
  
  var initializeCharts = function(chartName) {
    $.ajax({
      dataType: "json",
      url: '/charts/'+chartName,
      global: false,
      success:  function(data) {
        var groupingUnits = [
                 ['week', [1]],
                 ['month', [1, 2, 3, 4, 6]]
             ];
          Highcharts.stockChart('charts', {
            rangeSelector : {
              selected: 3,
              inputEnabled:false,
              allButtonsEnabled: true,
              enabled: true,
              buttons: [{
              	type: 'minute',
              	count: 15,
              	text: '15m'
              }, {
              	type: 'minute',
              	count: 30,
              	text: '30m'
              }, {
              	type: 'hour',
              	count: 1,
              	text: '1h'
              }, {
              	type: 'hour',
               count: 6,
              	text: '6h'
              }, {
              	type: 'day',
              	count: 1,
              	text: '1d'
              }]
            },              
            xAxis: {
              type: 'datetime',
              min: getMonthBack()
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
              name: chartName,
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
      initializeCharts("bitcoin");
      bindChartButtonClick();
    }
    
  }
  
}();