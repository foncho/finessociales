groupChart = function(groups_data) {
  if($('#group-graph').length > 0) {
    chart1 = new Highcharts.Chart({
      chart: {
        renderTo: 'group-graph',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false

      },
      title: {
        text: ''
      },
      tooltip: {
         formatter: function() {
            return '<b>'+ this.point.name +'</b>: '+ this.y +' %';
         }
      },
      plotOptions: {
         pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
               enabled: true,
               color: '#000000',
               connectorColor: '#000000',
               formatter: function() {
                  return '<a href="/groups/'+this.point.config[2]+'">'+ this.point.name +'</a>';
               }
            }
         }
      },
      series: [{
                type: 'pie',
                name: 'Year budget share',
                data: groups_data
              }]
    });
  }
};
