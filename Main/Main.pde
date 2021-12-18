import de.bezier.data.sql.*;

LoginPage loginPage;
SQLite Data;

int currentQ = 0;

TeacherCreateQuestions writeQuestions;

ArrayList<TextField> keyListeners = new ArrayList<TextField>();
ArrayList<Question> allQuestions = new ArrayList<Question>();

color strongTextColor = color(99, 181, 255);
color weakTextColor = color(150, 205, 255);
color fillColor = color(232, 244, 255);
color selectColor = color(196, 227, 255);

void settings() {
  fullScreen();
}

void setup() {
  loginPage = new LoginPage();
  getQuestions();
  writeQuestions = new TeacherCreateQuestions();
}

void draw() {
  background(255);
  //loginPage.display();
  writeQuestions.display();
}

void keyPressed() {
  for(TextField i : keyListeners) {
    i.keyPress();
  }
}

void mouseClicked() {
  for(TextField i : keyListeners) {
    i.mousePress();
  }
}

//tilføjet her
void mousePressed() {
  writeQuestions.addQButton.onClick();
  for(int i = 0; i < writeQuestions.allQuestionButtons.size(); i++){
    QuestionButton button = writeQuestions.allQuestionButtons.get(i);
    
    if(button.selected == true){
      if(button.buttonQuestion.addMultipuleQuestionButton.clickedOn() == true){
        button.buttonQuestion.addMulitiQInput();
      }
    }
  }
  
  for(int i = 0; i < writeQuestions.allQuestionButtons.size(); i++){
    QuestionButton button = writeQuestions.allQuestionButtons.get(i);
    button.onClick();
    
    if(button.clickedOn() == true){
      for(int j = 0; j < writeQuestions.allQuestionButtons.size(); j++){
        QuestionButton b = writeQuestions.allQuestionButtons.get(j);
        b.selected = false; 
      }
      
      button.selectedQ();
    }
  }
  
  if(writeQuestions.addQButton.clickedOn() == true){
      writeQuestions.addQButton();
  }
  
  for(int i = 0; i < writeQuestions.allQButtonDeleteButtons.size(); i++){
    QButtonDeleteButton button = writeQuestions.allQButtonDeleteButtons.get(i);
    
    if(button.clickedOn() == true){
      button.deleteQuestion();
    }
  }
}
//tilføjet her 
void mouseReleased() {
  writeQuestions.addQButton.onClick();
  //writeQuestions.addMultipuleQuestionButton.onClick();
  
  for(int i = 0; i < writeQuestions.allQuestionButtons.size(); i++){
    QuestionButton button = writeQuestions.allQuestionButtons.get(i);
    button.onClick();
  }
}

void getQuestions(){
  Data = new SQLite( this, "questions.sqlite" );
  if ( Data.connect() ){
    Data.query( "SELECT Nr, Question, Multi FROM Questions;" );
    
    while(Data.next()){
      if(Data.getBoolean("Multi"))
        allQuestions.add(new MultipleChoiseQuestion(Data.getInt("Nr"),Data.getString("Question"), Data.getString("Answer")));
      else if(!Data.getBoolean("Multi"))
        allQuestions.add(new WriteBlankQuestion(Data.getInt("Nr"),Data.getString("Question")));
    }
  }
  
}
