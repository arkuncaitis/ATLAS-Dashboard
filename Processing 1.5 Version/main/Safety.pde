//class representing the webpage for the Safety category
public class Safety{
  //variables for X and Y locations and size
  int box1x, box1y, box2x, box2y, box3x, box3y, box4x, box4y, box5x, box5y, box6x, box6y, box7x, box7y, box8x, box8y, box9x, box9y;
  int boxwidth = 240, boxheight = 160;
  int displayWidth = 1366, displayHeight = 642;
  
 public Safety(){
   
 }
 
 public void drawPage(){
   box1x = 265*displayWidth/1366; 
   box1y = 162*displayHeight/642;
   box2x = 530*displayWidth/1366; 
   box2y = box1y;
   box3x = 795*displayWidth/1366; 
   box3y = box1y;
   box4x = box1x; 
   box4y = 400*displayHeight/642;
   box5x = box2x;
   box5y = box4y;
   box6x = box3x;
   box6y = box4y;
   box7x = box1x;
   box7y = 482*displayHeight/642;
   box8x = box2x;
   box8y = box7y;
   box9x = box3x;
   box9y = box7y;
   noStroke();
   fill(blue00bfd5);
   rect(box1x, box1y, boxwidth, boxheight);
   rect(box2x, box2y, boxwidth, boxheight);
   rect(box3x, box3y, boxwidth, boxheight);
   rect(box4x, box4y, boxwidth, boxheight);
   rect(box5x, box5y, boxwidth, boxheight);
   rect(box6x, box6y, boxwidth, boxheight);
//   rect(box7x, box7y, boxwidth, boxheight);
//   rect(box8x, box8y, boxwidth, boxheight);
//   rect(box9x, box9y, boxwidth, boxheight);
   fill(green71ca5e);
   textFont(openSansSemi36);
   text("Crime",box1x, box1y-45, 110, 50 );
   text("Fire", box1x-17,box4y-45, 110, 50 );
   //text("Traffic", box1x, box7y-45, 116, 50);
   
   noStroke();
   fill(green71ca5e);
   setGradient(box1x, box1y, boxwidth, boxheight/2, greenaeda79, green64c770, Y_AXIS);
   rect(box1x, box1y,boxwidth, boxheight/2);
   setGradient(box2x, box2y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
   rect(box2x, box2y,boxwidth, boxheight/2);
   setGradient(box3x, box3y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
   rect(box3x, box3y,boxwidth, boxheight/2);
   setGradient(box4x, box4y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
   rect(box4x, box4y,boxwidth, boxheight/2);
   setGradient(box5x, box5y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
   rect(box5x, box5y,boxwidth, boxheight/2);
   setGradient(box6x, box6y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
   rect(box6x, box6y,boxwidth, boxheight/2);
//   setGradient(box7x, box7y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
//   rect(box7x, box7y,boxwidth, boxheight/2);
//   setGradient(box8x, box8y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
//   rect(box8x, box8y,boxwidth, boxheight/2);
//   setGradient(box9x, box9y,boxwidth, boxheight/2 , greenaeda79, green64c770, Y_AXIS);
//   rect(box9x, box9y,boxwidth, boxheight/2);
   
   fill(blue1000c6);
   textFont(openSansSemi14);
   text("Aggravated Assualt\n YTD", box1x+boxwidth/2, box1y+16); 
   text("Homicides\n Committed", box2x+boxwidth/2, box2y+16);
   text("Shootings\n (Non-fatal)", box3x+boxwidth/2, box3y+16);
   text("Fire Fatalities", box4x+boxwidth/2, box4y+16);
   text("Total Fire\n Events", box5x+boxwidth/2, box5y+16);
   text("Fire Alarms\n Cited", box6x+boxwidth/2, box6y+16);
   
//   text("Citations\n Issued", box7x+boxwidth/2, box7y+16);
//   text("Traffic Cases\n Files", box8x+boxwidth/2, box8y+16);
//   text("Lorem Ipsum", box9x+boxwidth/2, box9y+16);

   fill(blue1000c6);
   textFont(openSansSemi36);
   text("68", box1x+boxwidth/2, box1y+boxheight/2+60);
   text("3", box2x+boxwidth/2, box2y+boxheight/2+60);
   text("16", box3x+boxwidth/2, box3y+boxheight/2+60);
   text("0",  box4x+boxwidth/2, box4y+boxheight/2+60);
   text("178", box5x+boxwidth/2, box5y+boxheight/2+60);
   text("100%", box6x+boxwidth/2, box6y+boxheight/2+60);
 }
  
}
