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
        textSize(20);
        text(Data.getString("Navn") + ": Score 1: " + Data.getInt("Score1") + " | Score 2: " + Data.getInt("Score2"),450,students*30+20);
        textSize(14);
        
        averageScore1 += Data.getInt("Score1");
        averageScore2 += Data.getInt("Score2");

      }
    }
    averageScore1 /= students;
    averageScore2 /= students;
    
    push();
    rectMode(CORNER);
    fill(weakTextColor);
    rect(50,height-averageScore1*4,100,averageScore1*4);
    fill(strongTextColor);
    rect(175,height-averageScore2*4,100,averageScore2*4);
    
    fill(0);
    text("Average score 1",52,height-10);
    text("Average score 2",177,height-10);
    
    stroke(0,0,0,100);
    for(int i = 0 ; i < 11; i++){
    text(i*10,25,height-i*40);
    line(25,height-i*40,300,height-i*40);
    }
    stroke(0);
    strokeWeight(3);
    line(400,0,400,height);
    pop();
    students = 0;
    
    flipper();
  }
  
    void flipper(){
    rectMode(CENTER);
    textAlign(CENTER);
    if(abs(mouseX-(width-85))<25 && abs(mouseY-35)<13 && mousePressed && frameNow<frameCount-30){
      page = 1;
      frameNow = frameCount;
    }
    
    fill(weakTextColor);
    rect(width-85,35,50,25,10);
    fill(strongTextColor);
    rect((width-85)+12,35,25,25,10);
    
    textSize(12);
    fill(0);
    text("Skift fane",width-85,20);
    rectMode(CORNER);
    textAlign(LEFT);
  }
  
}
