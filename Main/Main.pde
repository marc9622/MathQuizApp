import de.bezier.data.sql.*;

LoginPage loginPage;
ViewStatsPage stat;
SQLite Data;
TeacherCreateQuestions writeQuestions;
TakeQuizPage quiz;
ElevScore elevScore;

ArrayList<Question> allQuestions = new ArrayList<Question>();

ArrayList<Skater> skaterList = new ArrayList<Skater>();
PImage skaterImages [];
PImage sewer;
PImage light;
int skaterFrames;

int currentQ = 0;
boolean teacher;
int NrQuestions;
float frameNow;
int page = 0;
int score;

String name;

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
  
  sewer = loadImage("data/Sewer.png");
  light = loadImage("data/Light.png");
  
  skaterFrames = 33;
  skaterList.add( new Skater());

  skaterImages = new PImage[skaterFrames];
  for (int i = 0; i < skaterFrames; i++) {
    skaterImages[i] = loadImage("data/Skater" + nf(i, 2) + ".png");
  }
  
  loginPage = new LoginPage();
  stat = new ViewStatsPage();
  writeQuestions = new TeacherCreateQuestions();
  quiz = new TakeQuizPage();
  elevScore = new ElevScore();
  
  imageMode(CENTER);
  frameRate(60);
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
    case 4:
      elevScore.display();
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
    Data.query( "SELECT Nr, Question, Answer, Multi, Answer2, Answer3, Answer4 FROM Questions;" );
    
    
    //String sql="DELETE FROM Questions WHERE Nr=" + 11 +";";
    //Data.execute(sql);
    
    while(Data.next()){
      NrQuestions++;      
      if(Data.getString("Question").equals("")){
        continue;
      }

      if(!Data.getString("Answer2").equals("")){
        allQuestions.add(new Question(Data.getInt("Nr"),Data.getString("Question"),Data.getString("Answer"),Data.getString("Answer2"),Data.getString("Answer3"),Data.getString("Answer4"))); 
      }
      else if(Data.getString("Answer2").equals("")){
        allQuestions.add(new WriteBlankQuestion(Data.getInt("Nr"),Data.getString("Question"),Data.getString("Answer")));
      }
    }
  }
}
