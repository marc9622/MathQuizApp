import de.bezier.data.sql.*;

LoginPage loginPage;
SQLite Data;

ArrayList<TextField> keyListeners = new ArrayList<TextField>();

void settings() {
  size(1000, 500);
}

void setup() {
  loginPage = new LoginPage();
  Data = new SQLite( this, "questions.sqlite" );
  if ( Data.connect() ){
    Data.query( "SELECT Nr, Question, Multi FROM Questions;" );
  }
}

void draw() {
  background(255);
  loginPage.display();
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
