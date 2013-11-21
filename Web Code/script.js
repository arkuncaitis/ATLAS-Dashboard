/*var jsonurl = "http://openweathermap.org/data/2.5/weather?q=Atlanta,GA&callback=?";
$.getJSON(jsonurl, function(data) {
	var condition = data.weather[0].main;
	$("#weather").append(data.main.temp + " F");
});*/

var activeTab = "safety";

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
		$("#time").html(moment().format("dddd, MMMM D") + "<br/>" + moment().format("h:mm A"));
	},
	error: function(error) {
		//$("#weather").html("<p>"+error+"</p>");
	}
});

var active = function(pageState){
	if(pageState == 'safety'){
	
	}
	else if(pageState == 'transportation'){
	
	}
	else if(pageState == 'industry'){
	
	}
	else if(pageState == 'edu'){
	
	}
	else{
	
	}
};
active('safety');