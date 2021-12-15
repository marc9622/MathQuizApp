class ViewStatsPage extends Page{
  float averageScore1, averageScore2;
  int students;
  
  ViewStatsPage(){
  }
  
  public void display() {
    
    if ( Data.connect() ){
     Data.query( "SELECT Nr, Navn, Kode, Score1, Score2 FROM ElevData;" );
      while(Data.next()){
        students++;
        fill(0);
        text(Data.getString("Navn") + ": Score 1: " + Data.getInt("Score1") + " | Score 2: " + Data.getInt("Score2"),500,students*20+20);
        
        averageScore1 += Data.getInt("Score1");
        averageScore2 += Data.getInt("Score2");
      }
    }
    averageScore1 /= students;
    averageScore2 /= students;
    
    push();
    rectMode(CORNER);
    fill(fillColor);
    rect(50,height-averageScore1*2,100,averageScore1*2);
    fill(strongTextColor);
    rect(175,height-averageScore2*2,100,averageScore2*2);
    
    fill(0);
    text("Average score 1",52,height-10);
    text("Average score 2",177,height-10);
    
    strokeWeight(3);
    line(400,0,400,height);
    pop();
    students = 0;
  }
  
}
