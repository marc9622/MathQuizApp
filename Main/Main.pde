<<<<<<< HEAD
LoginPage loginPage;
=======
import de.bezier.data.sql.*;
SQLite Data;
>>>>>>> bbb3a18a5e18b8de418aad9cc816d9577e4243e8

ArrayList<TextField> keyListeners = new ArrayList<TextField>();

void settings() {
  size(1000, 500);
}

void setup() {
<<<<<<< HEAD
  loginPage = new LoginPage();
=======
  Data = new SQLite( this, "questions.sqlite" );
  if ( Data.connect() ){
    Data.query( "SELECT Nr, Question, Multi FROM Questions;" );
  }
>>>>>>> bbb3a18a5e18b8de418aad9cc816d9577e4243e8
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
