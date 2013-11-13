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
   
   //populate data table for Crime subcategory
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
