class ViewStatsPage extends Page{
  float averageScore1, averageScore2;
  int students;
  
  ViewStatsPage(){
    if ( Data.connect() ){
      Data.query( "SELECT Nr, Navn, Kode, Score1, Score2 FROM ElevData;" );
    }
  }
  
  public void display() {
    while(Data.next()){
      students++;
      text(Data.getString("Navn") + ": Score 1: " + Data.getInt("Score1") + " | Score 2: " + Data.getInt("Score2"),300,students*20+20);
      
      averageScore1 += Data.getInt("Score1");
      averageScore2 += Data.getInt("Score2");
    }
    averageScore1 /= students;
    averageScore2 /= students;
    
    push();
    rectMode(CORNER);
    fill(fillColor);
    rect(50,height-averageScore1,100,averageScore1);
    fill(strongTextColor);
    rect(175,height-averageScore2,100,averageScore2);
    pop();
  }
  
}
