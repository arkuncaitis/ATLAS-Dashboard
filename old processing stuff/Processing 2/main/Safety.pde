//class representing the webpage for the Safety category
public class Safety{
  //mock database tables for subcategories
  private Table fireData, crimeData;
  
 public Safety(){
   
   //populate data table for Fire subcategory
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
