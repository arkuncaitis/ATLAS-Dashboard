import de.looksgood.ani.*;

int currentCatX;
int currentCatY;

void setup(){
  size(displayWidth, displayHeight);
  currentCatX = 50;
  currentCatY = 50;
  
  Ani.init(this);
}

void draw(){
  background(200, 200, 200);
  noStroke();
  fill(255, 0, 0);
  rect(100, 18, 1000, 600, 12);
  triangle(currentCatX, currentCatY, 
           currentCatX+50, currentCatY-25, 
           currentCatX+50, currentCatY+25);
  if(mousePressed && mouseButton == LEFT){
    translate(0, 50);
  }
}

void mouseClicked(){
////  //int x = mouseX;
////  //int y = mouseY;
//  
//  int delta = 50;
//  while(delta > 0){
//    currentCatY = currentCatY + 1;
//  }

  Ani.to(this, 1.0, "currentCatY", currentCatY+50);
}
