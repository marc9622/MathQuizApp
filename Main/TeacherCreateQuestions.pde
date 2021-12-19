class TeacherCreateQuestions{
  color secCol = color(99, 181, 255);
  
  ArrayList<QuestionButton> allQuestionButtons = new ArrayList<QuestionButton>();
  ArrayList<QButtonDeleteButton> allQButtonDeleteButtons = new ArrayList<QButtonDeleteButton>();
  QuestionButton q1Button;
  QuestionButton addQButton;
  
  QButtonDeleteButton q1ButtonDelete;
  
  int qButtonAmount = 1;
  
  int amountOfMaxQButtons = 10;
  
  TeacherCreateQuestions(){
    q1Button = new QuestionButton(100, 100, "Spørgsmål 1", qButtonAmount);
    q1Button.selectedQ();
    allQuestionButtons.add(q1Button);
    addQButton = new QuestionButton(100, 175, "+", 0);
    
    q1ButtonDelete = new QButtonDeleteButton(0, 0, q1Button, this);
    allQButtonDeleteButtons.add(q1ButtonDelete);
    
  }
  
  void display(){ 
    fill(255);
    stroke(secCol);
    rect(250, 75, width - 375, height - 150, 10);
    
    for(int i = 0; i < allQuestionButtons.size(); i++){
      QuestionButton button = allQuestionButtons.get(i);
      QButtonDeleteButton deleteButton = allQButtonDeleteButtons.get(i);
      
      button.display();
      
      if(deleteButton.qButton.qNr > 1) {
        deleteButton.display();
      }
      
      if(button.selected == true){
        button.buttonQuestion.teacherDisplay();
      }
    }
    
    addQButton.display();
    
    flipper();
  }
  
  void addQButton(){
    
    String sql = "INSERT INTO Questions(Nr, Question, Answer, Multi)VALUES ('" + NrQuestions+1 + "', '" + q1Button.buttonQuestion.questionInput.input + "', '" + q1Button.buttonQuestion.answerInput.input + "', '" + true + "');";
    Data.execute(sql);
    
    float previousX = allQuestionButtons.get(allQuestionButtons.size() - 1).x;
    float previousY = allQuestionButtons.get(allQuestionButtons.size() - 1).y;
    
    qButtonAmount++;
    QuestionButton newQButton = new QuestionButton(previousX, previousY + 75, "Spørgsmål " + qButtonAmount, qButtonAmount);
    
    QButtonDeleteButton deleteButton = new QButtonDeleteButton(0, 0, newQButton, this);
    allQButtonDeleteButtons.add(deleteButton);
    
    allQuestionButtons.add(newQButton);
    addQButton.y += (1 * 75);
    
    if(qButtonAmount == amountOfMaxQButtons){
      addQButton.hidden = true;
    }
  }  
  
    void flipper(){
    rectMode(CENTER);
    textAlign(CENTER);
    if(abs(mouseX-(width-85))<25 && abs(mouseY-35)<13 && mousePressed && frameNow<frameCount-30){
      page = 2;
      frameNow = frameCount;
    }
    
    fill(selectColor);
    rect(width-85,35,50,25,10);
    fill(strongTextColor);
    rect((width-85)-12,35,25,25,10);
    
    textSize(12);
    fill(0);
    text("Skift fane",width-85,20);
    
    rectMode(CORNER);
    textAlign(LEFT);
  }
  
}
