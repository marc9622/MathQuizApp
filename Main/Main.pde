import de.bezier.data.sql.*;

LoginPage loginPage;
SQLite Data;

ArrayList<Question> allQuestions = new ArrayList<Question>();

int currentQ = 0;
boolean teacher;
int NrQuestions;

//Standard farvepalette til programmet. 
color strongTextColor = color(99, 181, 255);
color weakTextColor = color(150, 205, 255);
color fillColor = color(232, 244, 255);
color selectColor = color(196, 227, 255);

void settings() {
  size(1000, 500);
}

void setup() {
  loginPage = new LoginPage();
  Data = new SQLite( this, "questions.sqlite" );
  getQuestions();
}

void draw() {
  background(255);
  //viewStatsPage.display();
  loginPage.display();
  
  if(currentQ < allQuestions.size() && !teacher){
    allQuestions.get(currentQ).update();
    allQuestions.get(currentQ).display();
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
