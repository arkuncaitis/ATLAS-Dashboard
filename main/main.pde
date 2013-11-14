import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Date;
import de.looksgood.ani.*;
import com.onformative.yahooweather.*;

//X dimension for the currently selected category - 
//X dimension of the left most point for moving triangle on navigation
int currentCatX;
//Y dimension for the currently selected catgory - 
//Y dimension of left most point for moving triangle on navigation
int currentCatY;
//ATL Skyline image
PImage skyline;
//instance of weather library
YahooWeather weather;
//Mock State Machine variables for navigation bar
int currentState;
final int HOME = 0;
final int SAFETY = 1;
final int TRANSPORTATION = 2;
final int INDUSTRY = 3;
final int EDUCATION = 4;
final int ENVIRONMENT = 5;

void setup(){
  //full screen size
  size(displayWidth, displayHeight);
  //set default system state
  currentState = HOME;
  //set default values for triangle starting point
  currentCatX = 50;
  currentCatY = 50;
  //init skyline
  skyline = loadImage("atlanta.jpg");
  //resizes the image to the size of the application
  //a background image must be the same size as the application, or a runtime error is thrown
  skyline.resize(displayWidth, displayHeight);
  
  //Do not delete this line of code - initializes Ani animation library
  Ani.init(this);
  //initialize weather settings for atlanta
  //2357024 = WOEID for Fulton County, Atlanta, GA
  weather = new YahooWeather(this, 2357024, "f", updateIntervallMillis);
}

void draw(){
  //update the weather information
  weather.update();
  //draw the atlanta skyline photo as the background
  background(skyline);
  
  //CONTENT AREA
  noStroke();
  fill(255, 0, 0);
  rect(100, 18, 1000, 600, 12);
  triangle(currentCatX, currentCatY, 
           currentCatX+50, currentCatY-25, 
           currentCatX+50, currentCatY+25);
           
  //HEADER
  
  //get and display date
  SimpleDateFormat date = new SimpleDateFormat("EEEEE, MMMMM d");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  date.setTimeZone(tz);
  String displayDate = date.format(new Date());
  fill(0,0,0);
  text(displayDate, 500, 100);
  
  //get and display time
  SimpleDateFormat time = new SimpleDateFormat("h:mm a");
  //TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  time.setTimeZone(tz);
  String displayTime = time.format(new Date());
  fill(0,0,0);
  text(displayTime, 500, 50);
}

void mouseClicked(){
  int x = mouseX;
  int y = mouseY;  
  
  Ani.to(this, 1.0, "currentCatY", currentCatY+50);
}
