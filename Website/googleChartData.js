google.load('visualization', '1', {packages: ['corechart']});

var drawVisualization = function(name) {
	var data, options;
	var node = document.getElementById(name).getElementsByClassName('visualization')[0];
	if (name == 'safety1x1') {
		data = google.visualization.arrayToDataTable([
          ['Month', 'Percent'],
          ['Jan', .94],
          ['Feb', .93],
          ['March', .93],
          ['April', .93],
          ['May', .93],
          ['June', .90],
          ['July', .93]
        ]);
		
		options = {title: "911 Calls Answered in 10 Seconds",
                  width:600, height:400,legend :'none',
                  backgroundColor: { fill: 'transparent'},
                  hAxis: {title: "2013"},
                  vAxis: {format:'#%'}};
        }
                  
    	else if (name == 'safety2x1') {
		var data = google.visualization.arrayToDataTable([
          ['x', '# of Hires'],
          ['April',   12],
          ['May',  21],
          ['June',  15],
          ['July',  23]
        
        ]);
		
		options = {title:"New Police Officer Hires",
                  curveType: "function",
                  width: 600, height: 400,legend:'none',
                  backgroundColor: { fill: 'transparent'},
                  vAxis: {maxValue: 10},
                  hAxis: {title: "2013"}};
		
		}
	
		else if (name == 'safety3x1'){
		var data = google.visualization.arrayToDataTable([
          ['Month', 'Total Shootings', 'Non-Fatal Shootings (All Districts)'],
          ['Jan',  32,   26],
          ['Feb',  24,   20],
          ['March',  19,   16],
          ['April',  39,   35],
          ['May',  33,   29],
          ['June',  37,   32],
          ['July',  27,   20]
        ]);
		
		options = {title:"Total Shootings vs. Non-Fatal Shootings",
                  width:600, height:400,
                  backgroundColor: { fill: 'transparent'},
                  hAxis: {title: "2013"}};
		}
		
		else if(name == 'safety1x2'){
		var data = google.visualization.arrayToDataTable([
          ['Month', '# of Fire Alarms'],
          ['April',  516],
          ['May', 516],
          ['June', 575],
          ['July', 622]
        ]);
        
        options = {title:"Total Number of Fire Alarms",
                  width:600, height:400, legend: 'none',
                   backgroundColor: { fill: 'transparent'},
                  hAxis: {title: "2013"}};
		}
		
		else if(name == 'safety2x2'){
		var data = google.visualization.arrayToDataTable([
          ['Month', 'Total Fire Events'],
          ['Jan', 131],
          ['Feb', 194],
          ['March', 178],
          ['April', 128],
          ['May', 150],
          ['June', 115],
          ['July', 110]
          ]);
        
        options = {title:"Total Fire Events",
                  width:600, height:400, legend: 'none',
                  backgroundColor: { fill: 'transparent'},
                  hAxis: {title: "2013"}};
		}
		
		else if(name == 'safety3x2'){
		var data = google.visualization.arrayToDataTable([
          ['Month', 'Max Turnout Time'],
          ['April',  97],
          ['May',  279],
          ['June',  107],
          ['July',  90]
        ]);
        
        options = {title:"Maximum Fire Turnout Time",
                  width:600, height:400, legend: 'none',
                  backgroundColor: {fill: 'transparent'},
                  hAxis: {title: "2013"},
                  vAxis: {title: "time in seconds"}};
		}
	
	
	new google.visualization.ColumnChart(node).draw(data, options);
}