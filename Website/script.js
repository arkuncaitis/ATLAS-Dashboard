google.load('visualization', '1', {packages: ['corechart']});

var updateWeather = function() {
	$.simpleWeather({
		zipcode: '30308',
		unit: 'f',
		success: function(weather) {
			/*html = '<h2>'+weather.city+', '+weather.region+'</h2>';
			html += '<img style="float:left;" width="125px" src="images/weather/'+weather.code+'.png">';
			html += '<p>'+weather.temp+'&deg; '+weather.units.temp+'<br /><span>'+weather.currently+'</span></p>';
			html += '<a href="'+weather.link+'">View Forecast &raquo;</a>';*/
	 
			moment().tz("America/New_York").format();
	 
			$("#weather").html(weather.temp + "&deg;" + "F");
		},
		error: function(error) {
			//$("#weather").html("<p>"+error+"</p>");
		}
	});
};

var drawVisualization = function() {
	// Create and populate the data table.
	var data = google.visualization.arrayToDataTable([
	  ['Month', 'Total Dispatched 911 Calls'],
	  ['Jan', 29895],
	  ['Feb',  25277],
	  ['March',  29337],
	  ['April',  30436],
	  ['May',  31358],
	  ['June', 33864],
	  ['July', 33959]
	]);
	// Create and draw the visualization.
	new google.visualization.ColumnChart(document.getElementById('visualization')).
		draw(data,
			 {title:"Total Dispatched 911 Calls",
			  width:400, height:200,
			  backgroundColor: { fill:'transparent' },
			  hAxis: {title: "2013"}});
};

var load = function() {
	$(".close").click(function(event){
		event.currentTarget.parentNode.parentNode.classList.remove('selected');
		//event.currentTarget.parentNode.parentNode.removeClass("selected");	
		selectedBox = '';
		event.stopPropagation();
	});
	update();
};

var update = function() {
	updateWeather();
	$("#time").html(moment().format("dddd, MMMM D") + "<br/>" + moment().format("h:mm A"));
};

var selectedBox = '';
var select = function(id) {
	if (selectedBox == '') {
		$("#"+id).addClass("selected");
		selectedBox = id;
	}
	update();
};

var close = function(id) {
}

var resetSelected = function() {
	if (selectedBox != '') {
		$("#"+selectedBox).removeClass("selected");	
		selectedBox = '';
	}
};

var activeTab = 'home';
var changeTab = function(newTab) {
	$("#"+activeTab).addClass("hidden");
	$("#"+newTab).removeClass("hidden");
	$(".leftarrowdiv").removeClass(activeTab);
	$(".leftarrowdiv").addClass(newTab);
	
	resetSelected();
	
	activeTab = newTab;
};

var active = function(pageState){
	if (pageState == 'home') {
		changeTab('home');
		update();
	}
	else if(pageState == 'safety'){
		changeTab('safety');
		update();
	}
	else if(pageState == 'transportation'){
		changeTab('transportation');
		update();
	}
	else if(pageState == 'industry'){
		changeTab('industry');
		update();
	}
	else if(pageState == 'edu'){
		changeTab('edu');
		update();
	}
	else if(pageState == 'env'){
		changeTab('env');
		//drawVisualization();
		update();
	}
	else{
	
	}
};
google.setOnLoadCallback(load);