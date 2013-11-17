import processing.core.*; 
import processing.xml.*; 

import java.text.SimpleDateFormat; 
import java.util.TimeZone; 
import java.util.Date; 
import de.looksgood.ani.*; 
import com.onformative.yahooweather.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

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
  size(1024, 768);
  //set default system state
  currentState = HOME;
  //set default values for triangle starting point
  currentCatX = 50;
  currentCatY = 50;
  //init skyline
  skyline = loadImage("atlanta.jpg");
  //resizes the image to the size of the application
  //a background image must be the same size as the application, or a runtime error is thrown
  skyline.resize(1024, 768);
  
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
  int headerHeight = 95;
  setGradient(0, 0, 1024, headerHeight, green64c770, greenaeda79, Y_AXIS);
  
  //get and display date
  SimpleDateFormat date = new SimpleDateFormat("EEEEE, MMMMM d");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  date.setTimeZone(tz);
  String displayDate = date.format(new Date());
  //x and y values for beginnging position
  int datew = (int)textWidth(displayDate);
  int datexend = 1024 - 20;
  int datex = datexend - datew;
  int datey = 40;
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
  int atlBackw = 305;
  int atlBackh = 75;
  setGradient(0, datey, atlBackw, atlBackh, blue0052aa, blue006fe6, X_AXIS);
  int atlx;
  int atly;
  
  //NAVIGATION BAR
  //x, y, width values
  int navx = 70;
  //int navy = (120*displayWidth)/768;
  int navy = headerHeight + 25;
  int navw = 135;
  //calculate Height according to number of categories
  int categoryHeight = 90;
  int categories = 5;
  int navh = categoryHeight * categories;
  noStroke();
  setGradient(navx, navy, navw, navh, blue006fe6, blue00b1d3, Y_AXIS);
  
  //CONTENT AREA
  noStroke();
  fill(255, 0, 0);
  //x, y, width, and height values for the rectangle background behind the main data content area
  int contentx = 215;
  //int contenty = (120*displayHeight)/768;
  int contenty = navy;
  int contentw = 720;
  int contenth = 565;
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
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "main" });
  }
}