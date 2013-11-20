public class Home{
  public Home(){
    
  }
  
  public void drawPage(){
    PImage chart = loadImage("ADPTotalShootings-01.png");
    chart.resize(200, 200);
    image(chart, 400, 400);
  }
  
}
