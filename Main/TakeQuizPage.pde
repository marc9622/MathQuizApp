class TakeQuizPage extends Page {

  public void display() {

    fill(fillColor);
    strokeWeight(3);
    rect(width/2-10,52,width+20,200);
    strokeWeight(2);
   
    allQuestions.get(currentQ).display();
  
    fill(selectColor);
    rect(775,650,300,50,10);
    fill(strongTextColor);
    textSize(30);
    text("Næste spørgsmål",775,660);
    if(abs(mouseX-775)<150 &&  abs(mouseY-650)<25 && mousePressed && frameNow<frameCount-30){
      next();
      frameNow = frameCount;
    }
    
  //image(sewer, width/2, height/2, width, height);

  for (Skater s : skaterList) {
    s.display();
    s.updateFrames();
  }

  //image(light, width/2, height/2, width, height);
    
  }
  
  void next(){
    
    
      if(allQuestions.get(currentQ).answerField.input.equals(allQuestions.get(currentQ).answer)){
        score++;
        for (Skater s : skaterList) {
          s.idle = false;
          s.trick = true;
          s.fail = false;
      }
    }
    else{
      for (Skater s : skaterList) {
        s.idle = false;
        s.trick = false;
        s.fail = true;
      }
    }
    
    if(currentQ>=allQuestions.size()-1){
      String sql = "UPDATE ElevData SET Score1 = '"+ score + "' WHERE Navn ='" + name +"';";
      Data.execute(sql);
      page = 4;
      return;
    }
    currentQ++;
  }
  
}
