import com.onformative.yahooweather.*;
import de.looksgood.ani.easing.*;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Date;
import de.looksgood.ani.*;

//instance of weather library
YahooWeather weather;
//size junk
//int resolutionWidth = 1366;
//int resolutionHeight = 768;
int displayWidth = 1280;
int displayHeight = 642;
//int displayWidth = 1024;       
//int displayHeight = 768;                                   
//X dimension for the currently selected category - 
//X dimension of the left most point for moving triangle on navigation
int currentCatX;
//Y dimension for the currently selected catgory - 
//Y dimension of left most point for moving triangle on navigation
int currentCatY;
//navigation moving triangle state variables
int safetyTriY;
int transTriY;
int industryTriY;
int eduTriY;
int envTriY;
//Mock State Machine variables for navigation bar
int currentState;
final int HOME = 0;
final int SAFETY = 1;
final int TRANSPORTATION = 2;
final int INDUSTRY = 3;
final int EDUCATION = 4;
final int ENVIRONMENT = 5;
public Safety safe;
//required gradient code constants: http://processing.org/examples/lineargradient.html
int Y_AXIS = 1;
int X_AXIS = 2;
//COLORS
color blue0052aa = color(0, 82, 170);
color blue006fe6 = color(0, 111, 230);
color blue00b1d3 = color(0, 177, 211);
color blue0f3cff = color(15, 60, 255);
color blue1000c6 = color(16, 0, 198);
color green71ca5e = color(113, 202, 94);
color greenaeda79 = color(174, 218, 121);
color blue00bfd5 = color(0, 191, 213);
color green64c770 = color(100, 199, 112);
color black = color(0,0,0);

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

//IMAGES
//ATL Skyline image
PImage skyline;

//variables needed for mouseClicked()
//variables from navigation bar, header
int navy, categorydisplayHeight, navx, navw, headerdisplayHeight;

void setup(){
  size(1280, 642);
  //size(1024,768);   
  //set default system state
  currentState = SAFETY;
  safe = new Safety();
  //set initial triangle y value for default state
  currentCatY = ((95*displayHeight)/642 + ((25*displayHeight)/642)) + ((int)(.5*((90*displayHeight)/642)));
  //init skyline
  skyline = loadImage("atlanta.jpg");
  //resizes the image to the size of the application
  //a background image must be the same size as the application, or a runtime error is thrown
  skyline.resize(1280, 642);
  
  //Do not delete this line of code - initializes Ani animation library
  Ani.init(this);
  //initialize weather settings for atlanta
  //2357024 = WOEID for Fulton County, Atlanta, GA
  weather = new YahooWeather(this, 2357024, "f", 100);
}

void draw(){
  //update the weather information
  weather.update();
  //draw the atlanta skyline photo as the background
  background(skyline);
//background(255);
//image(skyline, 0, 0);
  
  //HEADER
  noStroke();
  headerdisplayHeight = (95*displayHeight)/642;
  setGradient(0, 0, displayWidth, headerdisplayHeight, green64c770, greenaeda79, Y_AXIS);
  //get and display date
  SimpleDateFormat date = new SimpleDateFormat("EEEEE, MMMMM d");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  date.setTimeZone(tz);
  String displayDate = date.format(new Date());
  textFont(openSansBold34);
  //x and y values for beginnging position
  int datew = (int)textWidth(displayDate);
  int datexend = displayWidth - ((20*displayWidth)/1366);
  int datex = datexend - (datew/2);
  int datey = (40*displayHeight)/642;
  fill(blue1000c6);
  text(displayDate, datex, datey);
  //get and display time
  SimpleDateFormat time = new SimpleDateFormat("h:mm a");
  //TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  time.setTimeZone(tz);
  String displayTime = time.format(new Date());
  //x and y values for beginning position
  int timew = (int)textWidth(displayTime);
  int timex = datexend - (timew/2);
  int timey = datey + 30;
  fill(blue1000c6);
  text(displayTime, timex, timey);
  //Atlanta text background
  int atlBackw = (305*displayWidth)/1366;
  int atlBackh = (75*displayHeight)/642;
  //setGradient(5, datey-25, atlBackw, atlBackh, blue0052aa, blue006fe6, X_AXIS);
  setGradient(0, datey - 25, atlBackw, atlBackh, blue0052aa, blue006fe6, X_AXIS);
  int atlx = 5;
  //ATLANTA header image with seal
  PImage atl = loadImage("header.png");
  image(atl, atlx, datey - 25);
  //Weather
  noStroke();
  fill(greenaeda79);
  int temperatureBackw = (215*displayWidth)/1024;
  rect(atlBackw + 1, datey-25, temperatureBackw, atlBackh + 1);
  int temperature = weather.getTemperature();
  int temperaturex = atlBackw + temperatureBackw - 25;
  int temperaturey = datey + (atlBackh/2) - 13;
  fill(blue1000c6);
  text(temperature, temperaturex-50, temperaturey);
  textFont(openSansBold14);
  text("o", temperaturex-20, temperaturey-15);
  textFont(openSansBold34);
  text("F", temperaturex, temperaturey);
  
  //NAVIGATION BAR
  //x, y, displayWidth values
  navx = (50*displayWidth)/1366;  
  //int navy = (120*displayWidth)/768;
  navy = headerdisplayHeight + ((25*displayHeight)/642);  //was int navy =...
  navw = (135*displayWidth)/1366; 
  //calculate displayHeight according to number of categories
  categorydisplayHeight = (90*displayHeight)/642; //was int categorydisplayHeight =...
  int categories = 5;
  int navh = categorydisplayHeight * categories; 
  noStroke();
  setGradient(navx, navy, navw, navh, blue006fe6, blue00b1d3, Y_AXIS);
  stroke(blue00b1d3);
  line(navx,navy+categorydisplayHeight, navx+navw, navy+categorydisplayHeight);
  line(navx, navy+categorydisplayHeight*2, navx+navw, navy+categorydisplayHeight*2);
  line(navx,navy+categorydisplayHeight*3, navx+navw, navy+categorydisplayHeight*3);
  line(navx,navy+categorydisplayHeight*4, navx+navw, navy+categorydisplayHeight*4);
  //Draw catgory text
  textFont(openSansSemi14);
  textAlign(CENTER);
  fill(0,0,0);
  int cat1y = navy + categorydisplayHeight - 17;
  text("SAFETY", navx - 16, cat1y, navx + navw - 20, navy + categorydisplayHeight);
  int cat2y = navy + (2*categorydisplayHeight) - 17;
  text("TRANSPORTATION", navx - 14, cat2y, navx + navw - 20, navy + (2*categorydisplayHeight));
  int cat3y = navy + (3*categorydisplayHeight) - 17;
  text("INDUSTRY", navx - 16, cat3y, navx + navw - 20, navy + (3*categorydisplayHeight));
  int cat4y = navy + (4*categorydisplayHeight) - 17;
  text("EDUCATION", navx - 14, cat4y, navx + navw - 20, navy + (4*categorydisplayHeight));
  int cat5y = navy + (5*categorydisplayHeight) - 17;
  text("ENVIRONMENT", navx - 14, cat5y, navx + navw - 20, navy + (5*categorydisplayHeight));
  //icons
  PImage safetyIcon = loadImage("safetyIcon.png");
  PImage carIcon = loadImage("carIcon.png");
  PImage industryIcon = loadImage("industryIcon.png");
  PImage bookIcon = loadImage("bookIcon.png");
  PImage environmentIcon = loadImage("environmentIcon.png");
  image(safetyIcon, navx + (navw/2) - 30, navy + (categorydisplayHeight/2) - 34);
  image(carIcon, navx + (navw/2) - 30, navy + categorydisplayHeight + (categorydisplayHeight/2) - 34);
  image(industryIcon, navx + (navw/2) - 30,  navy + (2*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
  image(bookIcon, navx + (navw/2) - 30,  navy + (3*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
  image(environmentIcon, navx + (navw/2) - 30,  navy + (4*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
  
  //CONTENT AREA
  noStroke();
  fill(255, 0, 0);
  //x, y, displayWidth, and displayHeight values for the rectangle background behind the main data content area
  int contentx = (215*displayWidth)/1366;
  //int contenty = (120*displayHeight)/768;
  int contenty = navy;
  int contentw = (735*displayWidth)/1024;
  int contenth = (565*displayHeight)/768; 
  //rect(contentx, contenty, contentw, contenth);
  setGradient(contentx, contenty, contentw, contenth, blue006fe6, blue00b1d3, Y_AXIS);

  //change page information
  switch(currentState){
   case HOME:
     Home home = new Home();
     home.drawPage();
     break;
   case SAFETY:
     /* added to display grid on Content Area*/
     //Safety safe = new Safety();
     safe.drawPage();  
     break;
   case TRANSPORTATION:
     Transportation trans = new Transportation();
     trans.drawPage();
     break;
   case INDUSTRY:
     Industry industry = new Industry();
     industry.drawPage();
     break;
   case EDUCATION:
     Education edu = new Education();
     edu.drawPage();
     break;
   case ENVIRONMENT:
     Environment env = new Environment();
     env.drawPage();
     break;
  }
  noStroke();
  fill(blue006fe6);
  currentCatX = contentx - 29;
  //currentCatY = navy + ((int)(.5*categorydisplayHeight));
  if(currentState != HOME){
    triangle(currentCatX, currentCatY, 
             contentx, currentCatY-14, 
             contentx, currentCatY+14);
  }  
  
  //FOOTER
  //int footerEndY = displayHeight - ((25*displayHeight)/768);
  int footerh = (35*displayHeight)/768;
  int footerSpace = displayHeight - (contenty + contenth);
  int footery = displayHeight - (footerSpace/2) - (footerh/2);
  setGradient(0, footery, displayWidth, footerh, greenaeda79, green64c770, Y_AXIS);
  int footerTxtY = footery + (footerh/2) + 7;
  textFont(openSansSemi14);
  fill(0, 0, 0);
  text("Copyright 2013 City of Atlanta, GA. All Rights Reserved", navx + 185, footerTxtY);
  String links = "Safety/Transportation/Industry/Education/Environment";
  int linksw = (int)textWidth(links);
  int rightSideSpace = displayWidth - (contentx + contentw);
  int footerLinksX = displayWidth - rightSideSpace - (linksw/2);
  text(links, footerLinksX, footerTxtY);
  
  //HOVER
  int x = mouseX;
  int y = mouseY;
  if(x >= navx && x <= navx + navw && y >= navy && y <= navy + categorydisplayHeight){
//     SAFETY hover
      safetyIcon = loadImage("safetyHoverIcon.png");
      image(safetyIcon, navx + (navw/2) - 30, navy + (categorydisplayHeight/2) - 34);
      fill(blue1000c6);
      textFont(openSansSemi14);
      textAlign(CENTER);
      text("SAFETY", navx - 16, cat1y, navx + navw - 20, navy + categorydisplayHeight);
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (2*categorydisplayHeight)){
//    TRANSPORTATION hover 
    carIcon = loadImage("carHoverIcon.png");
    image(carIcon, navx + (navw/2) - 30, navy + categorydisplayHeight + (categorydisplayHeight/2) - 34);
    fill(blue1000c6);
    textFont(openSansSemi14);
    textAlign(CENTER);
    text("TRANSPORTATION", navx - 14, cat2y, navx + navw - 20, navy + (2*categorydisplayHeight));
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (3*categorydisplayHeight)){
//    INDUSTRY hover
    industryIcon = loadImage("industryHoverIcon.png");
    image(industryIcon, navx + (navw/2) - 30,  navy + (2*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
    fill(blue1000c6);
    textFont(openSansSemi14);
    textAlign(CENTER);
    text("INDUSTRY", navx - 16, cat3y, navx + navw - 20, navy + (3*categorydisplayHeight));
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (4*categorydisplayHeight)){
//    EDUCATION hover
    bookIcon = loadImage("eduHoverIcon.png");
    image(bookIcon, navx + (navw/2) - 30,  navy + (3*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
    fill(blue1000c6);
    textFont(openSansSemi14);
    textAlign(CENTER);
    text("EDUCATION", navx - 14, cat4y, navx + navw - 20, navy + (4*categorydisplayHeight));
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (5*categorydisplayHeight)){
//    ENVIRONMENT hover
    environmentIcon = loadImage("envHoverIcon.png");
    image(environmentIcon, navx + (navw/2) - 30,  navy + (4*categorydisplayHeight) + (categorydisplayHeight/2) - 34);
    fill(blue1000c6);
    textFont(openSansSemi14);
    textAlign(CENTER);
    text("ENVIRONMENT", navx - 14, cat5y, navx + navw - 20, navy + (5*categorydisplayHeight));
  }
}

void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  //Safety safe = new Safety();
  
  if(x >= navx && x <= navx + navw && y >= navy && y <= navy + categorydisplayHeight){
     currentState = SAFETY;
     safetyTriY = navy + ((int)(.5*categorydisplayHeight));
     Ani.to(this, 1.0, "currentCatY", safetyTriY);
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (2*categorydisplayHeight)){
    currentState = TRANSPORTATION; 
    transTriY = navy + categorydisplayHeight + ((int)(.5*categorydisplayHeight));
    Ani.to(this, 1.0, "currentCatY", transTriY);
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (3*categorydisplayHeight)){
    currentState = INDUSTRY; 
    industryTriY = navy + (2*categorydisplayHeight) + ((int)(.5*categorydisplayHeight));
    Ani.to(this, 1.0, "currentCatY", industryTriY);
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (4*categorydisplayHeight)){
    currentState = EDUCATION; 
    eduTriY = navy + (3*categorydisplayHeight) + ((int)(.5*categorydisplayHeight));
    Ani.to(this, 1.0, "currentCatY", eduTriY);
  }
  else if(x >= navx && x <= navx + navw && y >= navy + categorydisplayHeight && y <= navy + (5*categorydisplayHeight)){
    currentState = ENVIRONMENT;
    envTriY = navy + (4*categorydisplayHeight) + ((int)(.5*categorydisplayHeight));
    Ani.to(this, 1.0, "currentCatY", envTriY);
  }
  else if(y <= headerdisplayHeight){
    currentState = HOME;
  }
  //expanding grid checks
   else if(x>=safe.box1x && x<safe.box1x +safe.boxwidth && y>safe.box1y && y<safe.box1y+safe.boxheight){
     Ani.to(this, 2.0, "safe.box1x", safe.box1x+30);
     Ani.to(this, 2.0, "safe.box1y", safe.box1y+30);
   }
   else if(x>=safe.box2x && x<safe.box2x +safe.boxwidth && y>safe.box2y && y<safe.box2y+safe.boxheight){
     Ani.to(this, 2.0, "safe.box2x", safe.box2x+30);
     Ani.to(this, 2.0, "safe.box2y", safe.box2y+30);
   }
   else if(x>=safe.box3x && x<safe.box3x +safe.boxwidth && y>safe.box3y && y<safe.box3y+safe.boxheight){
     Ani.to(this, 2.0, "safe.box3x", safe.box3x+30);
     Ani.to(this, 2.0, "safe.box3y", safe.box3y+30);
   }
   else if(x>=safe.box4x && x<safe.box4x +safe.boxwidth && y>safe.box4y && y<safe.box4y+ safe.boxheight){
     Ani.to(this, 2.0, "safe.box4x", safe.box4x+30);
     Ani.to(this, 2.0, "safe.box4y", safe.box4y+30);
   }
   else if(x>=safe.box5x && x<safe.box5x +safe.boxwidth && y>safe.box5y && y<safe.box5y+safe.boxheight){
     Ani.to(this, 2.0, "safe.box5x", safe.box5x+30);
     Ani.to(this, 2.0, "safe.box5y", safe.box5y+30);
   }
   else if(x>=safe.box6x && x<safe.box6x +safe.boxwidth && y>safe.box6y && y<safe.box6y+safe.boxheight){
     Ani.to(this, 2.0, "safe.box6x", safe.box6x+30);
     Ani.to(this, 2.0, "safe.box6y", safe.box6y+30);
   }
  
  //Ani.to(this, 1.0, "currentCatY", currentCatY+70);
}//end mouseClicked()

//Gradient Code
//http://processing.org/examples/lineargradient.html
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
