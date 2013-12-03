google.load('visualization', '1', {packages: ['corechart']});

var drawVisualization = function(name) {
	var data, options;
	var node = document.getElementById(name).getElementsByClassName('visualization')[0];
	
	//SAFETY
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
                  width:500, height:300,legend :'none',
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
                  width: 500, height: 300,legend:'none',
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
                  width:500, height:300,
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
                  width:500, height:300, legend: 'none',
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
                  width:500, height:300, legend: 'none',
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
                  width:500, height:300, legend: 'none',
                  backgroundColor: {fill: 'transparent'},
                  hAxis: {title: "2013"},
                  vAxis: {title: "time in seconds"}};
		}
		
		//TRANSPORTATION
		else if(name == 'trans1x1'){
		var data = google.visualization.arrayToDataTable([
                ['Month', '# of Traffic Cases Filed'],
                ['May', 12370],
                ['June', 13416],
                ['July', 14918]
                ]);
        
        options = {title:"Number of Traffic Cases Filed",
                        width:500, height:300, legend: 'none',
                        backgroundColor: {fill: 'transparent'},
                        hAxis: {title: "2013"}};
		}
		
		else if(name == 'trans2x1'){
		var data = google.visualization.arrayToDataTable([
		['Month', 'Traffic Tickets Adjudicated within 10 Days', 'Traffic Tickets Adjudicated within 30 Days', 'Traffic Tickets Adjudicated within 60 Days'],
		['June 2013', .10, .27, .22] ]);
        
        options = {title:"Traffic Tickets Adjudicated",
		width:500, height:300,
		backgroundColor: {fill: 'transparent'},
		vAxis: {format:'#%'},
		chartArea: {  width: "50%", height: "70%" }};
		}
		
		else if(name == 'trans3x1'){
		var data = google.visualization.arrayToDataTable([
          ['June 2013', 'Percent'],
          ['Traffic Tickets Undisposed', 35],
          ['Traffic Tickets Adjudicated', 65]
        ]);
        
        options = {title:"Traffic Tickets Undisposed: June 2013",
                  backgroundColor: {fill: 'transparent'}};
		}
		
		else if(name == 'trans1x2'){
		var data = google.visualization.arrayToDataTable([
          ['Month', 'Asphalt/Street Repair Completed within SLA', 'Target Goal'],
          ['April',  .85, .90],
          ['May',  .89, .90],
          ['June',  .952, .90],
          ['July',  .96, .90]
        ]);
        
        options = {
          title : 'Asphalt/Street Repair Completed within SLA',
          width: 500,
          height: 300,
          vAxis: {format:'#%'},
          hAxis: {title: "2013"},
          backgroundColor: {fill: 'transparent'},
          chartArea: {  width: "50%", height: "70%" },
          seriesType: "bars",
          series: {1: {type: "line"}}};
		}
		
		else if(name == 'trans2x2'){
		 var data = google.visualization.arrayToDataTable([
          ['Month', 'Sidewalk/Concrete Repair Completed within SLA', 'Target Goal'],
          ['April',  .77, .90],
          ['May',  1.00, .90],
          ['June',  .947, .90],
          ['July',  .9881, .90]
		]);
        
        options = {
          title : 'Sidewalk/Concrete Repair Completed within SLA',
          width: 600,
          height: 300,
          vAxis: {format:'#%'},
          hAxis: {title: "2013"},
          backgroundColor: {fill: 'transparent'},
          chartArea: {  width: "50%", height: "70%" },
          seriesType: "bars",
          series: {1: {type: "line"}}};
		}
		
		else if(name == 'trans3x2'){
		var data = google.visualization.arrayToDataTable([
          ['Month', 'Street Light Repair Completed within SLA', 'Target Goal'],
          ['April',  .61, .90],
          ['May',  1.0, .90],
          ['June',  1.0, .90],
          ['July',  1.0, .90]
        ]);
        
        options = {
          title : 'Street Light Repair Completed within SLA',
          width: 500,
          height: 300,
          vAxis: {format:'#%'},
          hAxis: {title: "2013"},
          backgroundColor: { fill: 'transparent'},
          seriesType: "bars",
          series: {1: {type: "line"}}
        };
		}
		
		//INDUSTRY
		else if(name == 'industry1x1'){
		 var data = google.visualization.arrayToDataTable([
          ['Type', 'New WIA Clients'],
          ['Core', 397],
          ['Intensive', 477],
          ['Training', 3]
        
        ]);
        
        options = {title:"New WIA Clients",
                  curveType: "function",
                  width: 500, height: 300,legend:'none',
                  backgroundColor: {fill: 'transparent'},
                 hAxis: {title: "July 2013"}};
		}
		
		else if(name == 'industry2x1'){
		 var data = google.visualization.arrayToDataTable([
                ['Month', '# of Employees in City Workforce'],
                ['Jan', 7440],
                ['Feb', 7441],
                ['March', 7450],
                ['April', 7502],
                ['May', 7514],
                ['June', 7521],
                ['July', 7568]
                ]);
        
        options = {title:"Total Employees in City Workforce",
                        width:500, height:300, legend: 'none',
                        backgroundColor: {fill: 'transparent'},
                        hAxis: {title: "2013"}};
		}
		
		//wrong chart
		else if(name == 'industry1x2'){
		 var data = google.visualization.arrayToDataTable([
                      ['Month', 'Total Youth Attainment'],
                      ['July 2013', 234]
                      ]);
        
        options = {title:"Total Employees in City Workforce",
                        width:500, height:300, legend: 'none',
                        backgroundColor: {fill: 'transparent'},
                        hAxis: {title: "2013"}};
		}
		
		else if(name == 'industry2x2'){
		 var data = google.visualization.arrayToDataTable([
                ['Month', 'Intensive', 'Training'],
                ['July 2013', 44, 44]
                ]);
        
        options =  {title:"Total Youth Attainment",
                              width:300, height:400, legend: 'none', 
                              backgroundColor: {fill: 'transparent'}};
		}
		
		//EDUCATION
		else if(name == 'education1x1'){
		  var data = google.visualization.arrayToDataTable([
                      ['Month', 'Youth Enrolled in After-School/CBF Programs'],
                      ['Jan', 950],
                      ['Feb', 992],
                      ['March', 1027],
                      ['April', 1113],
                      ['May', 1120],
                      ['June', 2420],
                      ['July', 313]
                      ]);
        
        options = {title:"Youth Enrolled in After-School/CBF Programs",
                              width:500, height:300, legend: 'none',
                              backgroundColor: {fill: 'transparent'},
                              hAxis: {title: "2013"}};
		}
		
		else if(name == 'education2x1'){
		  var data = google.visualization.arrayToDataTable([
                      ['Month', '# of Youth'],
                      ['Jan', 1275],
                      ['Feb', 1503],
                      ['March', 1592],
                      ['April', 1662],
                      ['May', 1726],
                      ['June', 2175],
                      ['July', 1402]
                      ]);
        
        options = {title:"Youth Served in Recreation Center Programs",
                              width:500, height:300, legend: 'none',
                              backgroundColor: {fill: 'transparent'},
                              hAxis: {title: "2013"}};
		}
		
		//ENVIRONMENT
		else if(name == 'env1x1'){
		   var data = google.visualization.arrayToDataTable([
          ['Month', 'Drinking Water Compliance Rate as % of Prior 365 Days in Compliance', 'Wastewater Treatment Compliance Rate As % Of Prior 365 Days In Compliance', 'Target Goal'],
          ['Jan',  1.00, .98, 1.00],
          ['Feb',  1.00, .98, 1.00],
          ['March',  1.00, .98, 1.00],
          ['April',  1.00, .98, 1.00],
          ['May',  1.00, .97, 1.00],
          ['June',  1.00, .981, 1.00],
          ['July',  1.00, .98, 1.00]
        ]);
        
        options = {
          title : 'Drinking Water Compliance Rate as % of Prior 365 Days in Compliance',
          width: 500,
          height: 350,
          vAxis: {format:'#%', minValue: 0.00},
          backgroundColor: {fill: 'transparent'},
          hAxis: {title: "2013"},
          seriesType: "bars",
          series: {2: {type: "line"}}};
		}
		
		else if(name == 'env2x1'){
		   var data = google.visualization.arrayToDataTable([
          ['Month', 'Total Citywide Waste Collected/Processed in Tonnage'],
          ['Jan', 9072],
          ['Feb', 7302],
          ['March', 9799],
          ['April', 9987.08],
          ['May', 11101],
          ['June', 10087],
          ['July', 9889]
        ]);
        
        options = {title:"Total Citywide Waste Collected/Processed in Tonnage",
                  curveType: "function",
                  width: 500, height: 300,legend:'none',
                  backgroundColor: {fill: 'transparent'},
                 hAxis: {title: "2013"}};
		}
		
		else if(name == 'env1x2'){
		   var data = google.visualization.arrayToDataTable([
          ['Month', 'Total Tons'],
          ['Janu', 13807.84],
          ['Feb', 10726.01],
          ['March', 13084.02],
          ['April', 12997.21],
          ['May', 12588],
          ['June', 11766],
          ['July', 13801],
        ]);
        
        options = {title:"Total Tons of Waste Landfilled Citywide",
                  curveType: "function",
                  width: 500, height: 300,legend:'none',
                  backgroundColor: {fill: 'transparent'},
                 hAxis: {title: "2013"}};
		}
		
		else if(name == 'env2x2'){
		   var data = google.visualization.arrayToDataTable([
          ['Month', 'Dead Animal Removal Completed within SLA', 'Target Goal'],
          ['April',  .96, .90],
          ['May',  .96, .90],
          ['June',  .981, .90],
          ['July',  .984, .90]
        ]);
        
        options = {
          title : 'Dead Animal Removal Completed Within SLA',
          width: 500,
          height: 300,
          vAxis: {format:'#%', minValue: 0.00},
          
          hAxis: {title: "2013"},
          backgroundColor: {fill: 'transparent'},
          seriesType: "bars",
          series: {1: {type: "line"}}};
		}
	
	
	new google.visualization.ColumnChart(node).draw(data, options);
}