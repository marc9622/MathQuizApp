import de.bezier.data.sql.*;

LoginPage loginPage;
SQLite Data;

ArrayList<TextField> keyListeners = new ArrayList<TextField>();
ArrayList<Question> allQuestions = new ArrayList<Question>();

int currentQ = 0;
boolean teacher;

void settings() {
  size(1000, 500);
}

void setup() {
  loginPage = new LoginPage();
  getQuestions();
}

void draw() {
  background(255);
  loginPage.display();
  
  if(currentQ < allQuestions.size() && !teacher){
    allQuestions.get(currentQ).update();
    allQuestions.get(currentQ).display();
  }
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

void getQuestions(){
  Data = new SQLite( this, "questions.sqlite" );
  if ( Data.connect() ){
    Data.query( "SELECT Nr, Question, Multi FROM Questions;" );
    
    while(Data.next()){
      if(Data.getBoolean("Multi"))
        allQuestions.add(new MultipleChoiseQuestion(Data.getInt("Nr"),Data.getString("Question")));
      else if(!Data.getBoolean("Multi"))
        allQuestions.add(new WriteBlankQuestion(Data.getInt("Nr"),Data.getString("Question")));
    }
  }
}
