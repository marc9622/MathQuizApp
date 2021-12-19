class TakeQuizPage extends Page {
  int score;
  
  public void display() {
    allQuestions.get(currentQ).update();
    allQuestions.get(currentQ).display();
  
    fill(selectColor);
    rect(850,600,200,100,10);
    if(abs(mouseX-500)<100 &&  abs(mouseY-900)<50 && mousePressed){
      next();
    }
  
  }
  
  void next(){
    if(currentQ>=allQuestions.size()-1){
      return;
    }
    currentQ++;
  }
  
}
