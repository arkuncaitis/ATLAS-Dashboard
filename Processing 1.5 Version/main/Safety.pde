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
