class QButtonDeleteButton {
  float x;
  float y;
  float w = 25;
  float h = 25;
  
  color col = color(224, 61, 61);
  
  QuestionButton qButton;
  TeacherCreateQuestions question;
  
  QButtonDeleteButton(float x_, float y_, QuestionButton qButton_, TeacherCreateQuestions question_) {
    x = qButton_.x - 100;
    y = qButton_.y;
    qButton = qButton_;
    question = question_;
  }
  
  void display() {
    rectMode(CENTER);
    textAlign(CENTER);
    
    stroke(224, 61, 61);
    fill(224, 61, 61);
    rect(qButton.x - 100, qButton.y, 25, 25, 10);
    fill(255);
    textSize(14);
    text("X", qButton.x - 100, qButton.y + 5);
    
    rectMode(CORNER);
    textAlign(LEFT);
  }
  
  void updateQButton(QuestionButton qButton_){
    x = qButton_.x - 100;
    y = qButton_.y;
    qButton = qButton_;
  }
  
  boolean clickedOn(){
    if(qButton.qNr > 1 && mouseX >= (x - w/2) && mouseX <= (x + w/2) && mouseY >= (y - h/2) && mouseY <= (y + h/2)){
      return true;
    }else{
      return false;
    }
  }
  
  void deleteQuestion() { 
    question.allQuestionButtons.remove(qButton.qNr - 1);
    question.allQButtonDeleteButtons.remove(qButton.qNr - 1);
    question.qButtonAmount--;
    
    for(int i = 1; i < question.allQuestionButtons.size(); i++){
      QuestionButton button = question.allQuestionButtons.get(i);
      QButtonDeleteButton deleteButton = question.allQButtonDeleteButtons.get(i);
      
      button.qNr = i + 1;
      button.buttonText = "Spørgsmål " + button.qNr;
      button.y = 100 + (75 * i);
      
      deleteButton.updateQButton(button);
    }
    
    question.addQButton.y -= 75;
  }
}
