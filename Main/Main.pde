import de.bezier.data.sql.*;

LoginPage loginPage;
SQLite Data;

ArrayList<Question> allQuestions = new ArrayList<Question>();

int currentQ = 0;
boolean teacher;
int NrQuestions;

//Standard farvepalette til programmet. 
color primaryColor = color(99, 181, 255);
color secondaryColor = color(232, 244, 255);
color selectedColor = color(196, 227, 255);

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
  inputManager.input();
}

void mouseClicked() {
  inputManager.select();
}

//Brugt til at gøre det simplere at tilføje tekst.
public void showText(String text, float x, float y, int size, color col) {
  textSize(size);
  fill(col);
  text(text, (int)x, (int)y);
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
      NrQuestions++;
    }
  }
}
