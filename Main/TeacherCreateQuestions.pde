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
    q1Button = new QuestionButton(140, 100, "Spørgsmål 1", qButtonAmount);
    q1Button.selectedQ();
    allQuestionButtons.add(q1Button);
    addQButton = new QuestionButton(140, 175, "+", 0);
    
    q1ButtonDelete = new QButtonDeleteButton(0, 0, q1Button, this);
    allQButtonDeleteButtons.add(q1ButtonDelete);
  }
  
  void display(){ 
    fill(255);
    stroke(secCol);
    rect(300, 75, width - 375, height - 150, 10);
    
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
  }
  
  void addQButton(){
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
}
