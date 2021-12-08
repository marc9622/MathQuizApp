import de.bezier.data.sql.*;
SQLite Data;

ArrayList<TextField> keyListeners = new ArrayList<TextField>();

void settings() {
}

void setup() {
  Data = new SQLite( this, "questions.sqlite" );
  if ( Data.connect() ){
    Data.query( "SELECT Nr, Question, Multi FROM Questions;" );
  }
}

void draw() {
  background(255);
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
