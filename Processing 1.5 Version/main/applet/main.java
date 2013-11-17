import processing.core.*; 
import processing.xml.*; 

import de.looksgood.ani.easing.*; 
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








//size junk
int resolutionWidth = 1366;
int resolutionHeight = 768;
int displayWidth = 1366;
int displayHeight = 642;
//int displayWidth = 1024;       
//int displayHeight = 768;                                   
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
int black = color(0,0,0);

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

//Navigation bar variables needed for mouseClicked()
int navy, categorydisplayHeight;

public void setup(){
  size(1366, 642);
  //size(1024,768);   
  //set default system state
  currentState = SAFETY;
  //set default values for triangle starting point
  currentCatX = 185;
  currentCatY = 128;
  //init skyline
  skyline = loadImage("atlanta.jpg");
  //resizes the image to the size of the application
  //a background image must be the same size as the application, or a runtime error is thrown
  skyline.resize(1366, 642);
  
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
//background(255);
//image(skyline, 0, 0);
  
  //HEADER
  noStroke();
  int headerdisplayHeight = (95*displayHeight)/768;
  setGradient(0, 0, displayWidth, headerdisplayHeight, green64c770, greenaeda79, Y_AXIS);
  
  //get and display date
  SimpleDateFormat date = new SimpleDateFormat("EEEEE, MMMMM d");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  date.setTimeZone(tz);
  String displayDate = date.format(new Date());
  textFont(openSansBold34);
  //x and y values for beginnging position
  int datew = (int)textWidth(displayDate);
  int datexend = displayWidth - ((20*displayWidth)/1024);
  int datex = datexend - datew;
  int datey = (40*displayHeight)/768;
  fill(blue1000c6);
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
  setGradient(5, datey-25, atlBackw, atlBackh, blue0052aa, blue006fe6, X_AXIS);
  int atlx;
  int atly;
  
  //NAVIGATION BAR
  //x, y, displayWidth values
  int navx = (50*displayWidth)/1024;  
  //int navy = (120*displayWidth)/768;
  navy = headerdisplayHeight + ((25*displayHeight)/768);  //was int navy =...
  int navw = (135*displayWidth)/1024; 
  //calculate displayHeight according to number of categories
  categorydisplayHeight = (90*displayHeight)/768; //was int categorydisplayHeight =...
  int categories = 5;
  int navh = categorydisplayHeight * categories; 
  noStroke();
  setGradient(navx, navy, navw, navh, blue006fe6, blue00b1d3, Y_AXIS);
  stroke(black);
  line(50,navy+categorydisplayHeight, 50+navw, navy+categorydisplayHeight);
  line(50, navy+categorydisplayHeight*2, 50+navw, navy+categorydisplayHeight*2);
  line(50,navy+categorydisplayHeight*3, 50+navw, navy+categorydisplayHeight*3);
  line(50,navy+categorydisplayHeight*4, 50+navw, navy+categorydisplayHeight*4);
  
  //CONTENT AREA
  noStroke();
  fill(255, 0, 0);
  //x, y, displayWidth, and displayHeight values for the rectangle background behind the main data content area
  int contentx = (215*displayWidth)/1024;
  //int contenty = (120*displayHeight)/768;
  int contenty = navy;
  int contentw = (720*displayWidth)/1024;
  int contenth = (565*displayHeight)/768; //=441
  //rect(contentx, contenty, contentw, contenth);
  setGradient(contentx, contenty, contentw, contenth, blue006fe6, blue00b1d3, Y_AXIS);
  fill(blue006fe6);
  triangle(currentCatX, currentCatY, 
           currentCatX+29, currentCatY-14, 
           currentCatX+29, currentCatY+14);
           
  /* added to display grid on Content Area*/
  Safety safe = new Safety();
  safe.drawPage();         
}

public void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  
  if(x < 50+navy && x>50 && y>navy+categorydisplayHeight && y<navy+categorydisplayHeight*2){ //click on first category
    if(currentCatY >navy+categorydisplayHeight && currentCatY<navy+categorydisplayHeight*2){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70);
      currentCatY +=70;
    }
    else if(currentCatY >navy+categorydisplayHeight*2 && currentCatY<navy+categorydisplayHeight*3){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*2);
      currentCatY += 70*2;
    }
    else if(currentCatY >navy+categorydisplayHeight*3 && currentCatY<navy+categorydisplayHeight*4){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*3);
      currentCatY += 70*3;
    }
    else if(currentCatY >navy+categorydisplayHeight*4 && currentCatY<navy+categorydisplayHeight*5){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*4);
      currentCatY += 70*4;
    }
  }//end click first category
  
  else if(x < 50+navy && x>50 && y>navy+categorydisplayHeight*2 && y<navy+categorydisplayHeight*3){ //click 2nd category
    if(currentCatY >navy && currentCatY<navy+categorydisplayHeight){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70);
      currentCatY -= 70;
    }
    else if(currentCatY >navy+categorydisplayHeight*2 && currentCatY<navy+categorydisplayHeight*3){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70);
      currentCatY += 70;
    }
    else if(currentCatY >navy+categorydisplayHeight*3 && currentCatY<navy+categorydisplayHeight*4){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*2);
      currentCatY += 70*2;
    }
    else if(currentCatY >navy+categorydisplayHeight*4 && currentCatY<navy+categorydisplayHeight*5){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*3);
      currentCatY += 70*3;
    }
  }//end click on second category
  
  else if(x < 50+navy && x>50 && y>navy+categorydisplayHeight*3 && y<navy+categorydisplayHeight*4){//click on third category
    if(currentCatY >navy && currentCatY<navy+categorydisplayHeight){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*2);
      currentCatY -= 70*2;
    }
    else if(currentCatY >navy+categorydisplayHeight && currentCatY<navy+categorydisplayHeight*2){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70);
      currentCatY -= 70;
    }
    else if(currentCatY >navy+categorydisplayHeight*3 && currentCatY<navy+categorydisplayHeight*4){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70);
      currentCatY += 70;
    }
    else if(currentCatY >navy+categorydisplayHeight*4 && currentCatY<navy+categorydisplayHeight*5){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70*2);
      currentCatY += 70*2;
    }
  }//end click on third category
  
  else if(x < 50+navy && x>50 && y>navy+categorydisplayHeight*4 && y<navy+categorydisplayHeight*5){//click on 4th category
    if(currentCatY >navy && currentCatY<navy+categorydisplayHeight){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*3);
      currentCatY -= 70*3;
    }
    else if(currentCatY >navy+categorydisplayHeight && currentCatY<navy+categorydisplayHeight*2){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*2);
      currentCatY -= 70*2;
    }
    else if(currentCatY >navy+categorydisplayHeight*2 && currentCatY<navy+categorydisplayHeight*3){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70);
      currentCatY -= 70;
    }
    else if(currentCatY >navy+categorydisplayHeight*4 && currentCatY<navy+categorydisplayHeight*5){
      Ani.to(this, 1.0f, "currentCatY", currentCatY+70);
      currentCatY += 70;
    }
  }//end click on fourth category
  
  else if(x < 50+navy && x>50 && y>navy+categorydisplayHeight*5 && y<navy+categorydisplayHeight*6){ //click on 5th category
    if(currentCatY >navy && currentCatY<navy+categorydisplayHeight){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*4);
      currentCatY -= 70*4;
    }
    else if(currentCatY >navy+categorydisplayHeight && currentCatY<navy+categorydisplayHeight*2){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*3);
      currentCatY -= 70*3;
    }
    else if(currentCatY >navy+categorydisplayHeight*2 && currentCatY<navy+categorydisplayHeight*3){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70*2);
      currentCatY -= 70*2;
    }
    else if(currentCatY >navy+categorydisplayHeight*3 && currentCatY<navy+categorydisplayHeight*4){
      Ani.to(this, 1.0f, "currentCatY", currentCatY-70);
      currentCatY -= 70;
    }
  }//end click on fifth category
  
  //Ani.to(this, 1.0, "currentCatY", currentCatY+70);
}//end mouseClicked()

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
  //variables for X and Y locations and size
  int box1x, box1y, box2x, box2y, box3x, box3y, box4x, box4y, box5x, box5y, box6x, box6y, box7x, box7y, box8x, box8y, box9x, box9y;
  int boxwidth = 150, boxheight = 110;
  
 public Safety(){
   
 }
 
 public void drawPage(){
   box1x = 270; 
   box1y = 162;
   box2x = 480; 
   box2y = box1y;
   box3x = 690; 
   box3y = box1y;
   box4x = box1x; 
   box4y = 322;
   box5x = box2x;
   box5y = box4y;
   box6x = box3x;
   box6y = box4y;
   box7x = box1x;
   box7y = 482;
   box8x = box2x;
   box8y = box7y;
   box9x = box3x;
   box9y = box7y;
   stroke(0);
   rect(box1x, box1y, boxwidth, boxheight);
   rect(box2x, box2y, boxwidth, boxheight);
   rect(box3x, box3y, boxwidth, boxheight);
   rect(box4x, box4y, boxwidth, boxheight);
   rect(box5x, box5y, boxwidth, boxheight);
   rect(box6x, box6y, boxwidth, boxheight);
   rect(box7x, box7y, boxwidth, boxheight);
   rect(box8x, box8y, boxwidth, boxheight);
   rect(box9x, box9y, boxwidth, boxheight);
   fill(green71ca5e);
   textFont(openSansSemi36);
   text("Crime",box1x, box1y-45, 110, 50 );
   text("Fire", box1x,box4y-45, 110, 50 );
   text("Traffic", box1x, box7y-45, 116, 50);
   
   fill(blue0f3cff);
   textFont(openSansSemi14);
   text("Aggravated Assualt\n YTD", box1x+15, box1y+14); 
   text("Homicides\n Committed", box2x+15, box2y+14);
   text("Shootings\n (Non-fatal)", box3x+15, box3y+14);
   text("Fire Fatalities", box4x+15, box4y+14);
   text("Total Fire\n Events", box5x+15, box5y+14);
   text("Fire Alarms\n Cited", box6x+15, box6y+14);
   text("Citations\n Issued", box7x+15, box7y+14);
   text("Traffic Cases\n Files", box8x+15, box8y+14);
   text("Lorem Ipsum", box9x+15, box9y+14);
 }
  
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "main" });
  }
}
