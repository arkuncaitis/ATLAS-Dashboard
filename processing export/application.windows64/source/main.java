import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.text.SimpleDateFormat; 
import java.util.TimeZone; 
import java.util.Date; 
import de.looksgood.ani.*; 
import com.onformative.yahooweather.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {







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
//required gradient code constants: http://processing.org/examples/lineargradient.html
int Y_AXIS = 1;
int X_AXIS = 2;
//COLORS
//color headerGradientc1 = color(145, 227, 133);
//color headerGradientc2 = color(186, 221, 139);
//color backgroundOverlay = color(0, 124, 255);
//color contentGradientc1 = color(20, 156, 217);
//color contentGradientc2 = color(63, 167, 217);
int blue0052aa = color(0, 82, 170);
int blue006fe6 = color(0, 111, 230);
int blue00b1d3 = color(0, 177, 211);
int blue0f3cff = color(15, 60, 255);
int blue1000c6 = color(16, 0, 198);
int green71ca5e = color(113, 202, 94);
int greenaeda79 = color(174, 218, 121);
int blue00bfd5 = color(0, 191, 213);
int green64c770 = color(100, 199, 112);

//FONTS
/*PFont openSansBold14 = loadFont("OpenSans-Bold-14.vlw");
PFont openSansBold34 = loadFont("OpenSans-Bold-34.vlw");
PFont openSansBold50 = loadFont("OpenSans-Bold-50.vlw");
PFont openSansSemi14 = loadFont("OpenSans-Semibold-14.vlw");
PFont openSansSemi36 = loadFont("OpenSans-Semibold-36.vlw");*/
PFont openSansBold14 = createFont("Open Sans Bold", 14);
PFont openSansBold34 = createFont("Open Sans Bold", 34);
PFont openSansBold50 = createFont("Open Sans Bold", 50);
PFont openSansSemi14 = createFont("Open Sans Semibold", 14);
PFont openSansSemi36 = createFont("Open Sans Semibold", 36);

public void setup(){
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
  weather = new YahooWeather(this, 2357024, "f", 100);
}

public void draw(){
  //update the weather information
  weather.update();
  //draw the atlanta skyline photo as the background
    //background(255);
    //image(skyline, 0, 0);
    //tint(backgroundOverlay, 100);
    //image(skyline, 0, 0);
  background(skyline);
  
  //HEADER
  noStroke();
  int headerHeight = (95*displayHeight)/768;
  setGradient(0, 0, displayWidth, headerHeight, green64c770, greenaeda79, Y_AXIS);
  
  //get and display date
  SimpleDateFormat date = new SimpleDateFormat("EEEEE, MMMMM d");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  date.setTimeZone(tz);
  String displayDate = date.format(new Date());
  //x and y values for beginnging position
  int datew = (int)textWidth(displayDate);
  int datexend = displayWidth - ((20*displayWidth)/768);
  int datex = datexend - datew;
  int datey = (40*displayHeight)/768;
  fill(blue1000c6);
  textFont(openSansBold34);
  text(displayDate, datex, datey);
  
  //get and display time
  SimpleDateFormat time = new SimpleDateFormat("h:mm a");
  //TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  time.setTimeZone(tz);
  String displayTime = time.format(new Date());
  //x and y values for beginning position
  int timew = (int)textWidth(displayTime);
  int timex = datexend - timew;
  int timey = datey + 30;
  fill(blue1000c6);
  text(displayTime, timex, timey);
  
  //Atlanta text background
  int atlBackw = (305*displayWidth)/1024;
  int atlBackh = (75*displayHeight)/768;
  setGradient(0, datey, atlBackw, atlBackh, blue0052aa, blue006fe6, X_AXIS);
  int atlx;
  int atly;
  
  //NAVIGATION BAR
  //x, y, width values
  int navx = (70*displayWidth)/1024;
  //int navy = (120*displayWidth)/768;
  int navy = headerHeight + ((25*displayHeight)/768);
  int navw = (135*displayWidth)/1024;
  //calculate Height according to number of categories
  int categoryHeight = (90*displayHeight)/768;
  int categories = 5;
  int navh = categoryHeight * categories;
  noStroke();
  setGradient(navx, navy, navw, navh, blue006fe6, blue00b1d3, Y_AXIS);
  
  //CONTENT AREA
  noStroke();
  fill(255, 0, 0);
  //x, y, width, and height values for the rectangle background behind the main data content area
  int contentx = (215*displayWidth)/1024;
  //int contenty = (120*displayHeight)/768;
  int contenty = navy;
  int contentw = (720*displayWidth)/1024;
  int contenth = (565*displayHeight)/768;
  //rect(contentx, contenty, contentw, contenth);
  setGradient(contentx, contenty, contentw, contenth, blue006fe6, blue00b1d3, Y_AXIS);
  triangle(currentCatX, currentCatY, 
           currentCatX+50, currentCatY-25, 
           currentCatX+50, currentCatY+25);
}

public void mouseClicked(){
  int x = mouseX;
  int y = mouseY;  
  
  Ani.to(this, 1.0f, "currentCatY", currentCatY+50);
}

//Gradient Code
//http://processing.org/examples/lineargradient.html
public void setGradient(int x, int y, float w, float h, int c1, int c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      int c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      int c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
public class Home{
  
  public Home(){
    
  }
  
  public void drawPage(){
    
  }
  
}
//class representing the webpage for the Safety category
public class Safety{
  //mock database tables for subcategories
  private Table fireData, crimeData;
  
 public Safety(){
   
   //populate data table for Fire subcategory
   fireData = new Table();
     //columns
   fireData.addColumn("title");
   fireData.addColumn("isPercent");
   fireData.addColumn("January");
   fireData.addColumn("February");
   fireData.addColumn("March");
   fireData.addColumn("April");
   fireData.addColumn("May");
   fireData.addColumn("June");
   fireData.addColumn("July");
     //rows
   TableRow events = fireData.addRow();
   events.setString("title", "Total Fire Events");
   events.setString("isPercent", "N");
   events.setInt("January", 131);
   events.setInt("February", 194);
   events.setInt("March", 178);
   events.setInt("April", 128);
   events.setInt("May", 150);
   events.setInt("June", 115);
   events.setInt("July", 110);
   TableRow deaths = fireData.addRow();
   deaths.setString("title", "Fire Fatalities");
   deaths.setString("isPercent", "N");
   deaths.setInt("January", 0);
   deaths.setInt("February", 1);
   deaths.setInt("March", 0);
   deaths.setInt("April", 0);
   deaths.setInt("May", 0);
   deaths.setInt("June", 0);
   deaths.setInt("July", 0);
   TableRow falseAlarms = fireData.addRow();
   falseAlarms.setString("title", "False Alarms");
   falseAlarms.setString("isPercent", "Y");
   falseAlarms.setInt("April", 76);
   falseAlarms.setInt("May", 77);
   falseAlarms.setInt("June", 83);
   falseAlarms.setInt("July", 71);
   
   //populate data table for Crime subcategory
   crimeData = new Table();
     //columns
   crimeData.addColumn("title");
   crimeData.addColumn("isPercent");
   crimeData.addColumn("January");
   crimeData.addColumn("February");
   crimeData.addColumn("March");
   crimeData.addColumn("April");
   crimeData.addColumn("May");
   crimeData.addColumn("June");
   crimeData.addColumn("July");
     //rows
 }
 
 public void drawPage(){
   
 }
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
