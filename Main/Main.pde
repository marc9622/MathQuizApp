import de.bezier.data.sql.*;

LoginPage loginPage;
ViewStatsPage stat;
SQLite Data;
TeacherCreateQuestions writeQuestions;
TakeQuizPage quiz;

ArrayList<Question> allQuestions = new ArrayList<Question>();
ArrayList<TextField> keyListeners = new ArrayList<TextField>();

int currentQ = 0;
boolean teacher;
int NrQuestions;
float frameNow;
int page = 0;

//Standard farvepalette til programmet. 
color strongTextColor = color(99, 181, 255);
color weakTextColor = color(150, 205, 255);
color fillColor = color(232, 244, 255);
color selectColor = color(196, 227, 255);

void settings() {
  size(1000, 700);
}

void setup() {
  Data = new SQLite( this, "questions.sqlite" );
  getQuestions();
  
  loginPage = new LoginPage();
  stat = new ViewStatsPage();
  writeQuestions = new TeacherCreateQuestions();
  quiz = new TakeQuizPage();
}

void draw() {
  background(255);
  switch(page){
    case 0:
      loginPage.display();
      break;
    case 1:
      writeQuestions.display();
      break;
    case 2:
      stat.display();
      break;
    case 3:
      quiz.display();
      break;
    default:
      clear();
      fill(255);
      text("ERROR: Page not found",width/2,height/2);
      break;
  }
}

void keyPressed() {
  InputManager.input();
}

void mouseClicked() {
  InputManager.select();
}

//Brugt til at gøre det simplere at tilføje tekst.
public void showText(String text, float x, float y, int size, color col) {
  textSize(size);
  fill(col);
  text(text, (int)x, (int)y);
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
  if ( Data.connect() ){
   
    Data.query( "SELECT Nr, Question, Answer, Multi FROM Questions;" );
    
    while(Data.next()){
      if(Data.getBoolean("Multi"))
        allQuestions.add(new MultipleChoiseQuestion(Data.getInt("Nr"),Data.getString("Question"),Data.getString("Answer")));
      else if(!Data.getBoolean("Multi"))
        allQuestions.add(new WriteBlankQuestion(Data.getInt("Nr"),Data.getString("Question"),Data.getString("Answer")));
      NrQuestions++;
    }
  }
}
