import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Date;
import de.looksgood.ani.*;

//X dimension for the currently selected category - 
//X dimension of the left most point for moving triangle on navigation
int currentCatX;
//Y dimension for the currently selected catgory - 
//Y dimension of left most point for moving triangle on navigation
int currentCatY;

void setup(){
  size(displayWidth, displayHeight);
  //set default values for triangle starting point
  currentCatX = 50;
  currentCatY = 50;
  
  //Do not delete this line of code - initializes Ani animation library
  Ani.init(this);
}

void draw(){
  background(200, 200, 200);
  //Main Body/Content Background
  noStroke();
  fill(255, 0, 0);
  rect(100, 18, 1000, 600, 12);
  triangle(currentCatX, currentCatY, 
           currentCatX+50, currentCatY-25, 
           currentCatX+50, currentCatY+25);
           
  //HEADER
  //gets 12 hour based time from user's computer
  //displays as 12:08 PM
  SimpleDateFormat time = new SimpleDateFormat("h:mm a");
  TimeZone tz = TimeZone.getTimeZone("US/Eastern");
  time.setTimeZone(tz);
  String displayTime = time.format(new Date());
  fill(0,0,0);
  text(displayTime, 500, 50);
}

void mouseClicked(){

  Ani.to(this, 1.0, "currentCatY", currentCatY+50);
}
