class QuestionButton{
  color priCol = color(232, 244, 255);
  color secCol = color(99, 181, 255);
  color selCol = color(196, 227, 255);
  
  String buttonText = "";
  
  float x;
  float y;
  float w = 160;
  float h = 60;
  
  int qNr = 0;
  
  boolean clicked = false;
  
  boolean hidden = false; 
  
  boolean selected = false;
  
  MultipleChoiseQuestion buttonQuestion;
  
  QuestionButton(float x_, float y_, String buttonText_, int qNr_){
    x = x_;
    y = y_;
    buttonText = buttonText_;
    qNr = qNr_;
    buttonQuestion = new MultipleChoiseQuestion(qNr_, "", "");
  }
 
  void display(){
   if(hidden == false){
    rectMode(CENTER);
    textAlign(CENTER);
    stroke(secCol);
    if(clicked == true){
      fill(selCol);
    }else{
      fill(255);
    }
    
    if(selected == true){
      fill(selCol);
    }else{
      fill(255);
    }
    
    rect(x, y, w, h, 10); //80 100
    fill(0);
    textSize(18);
    text(buttonText, x, (y + 6));
    
    rectMode(CORNER);
    textAlign(LEFT);
   }
  }
  
  boolean clickedOn(){
    if(mouseX >= (x - w/2) && mouseX <= (x + w/2) && mouseY >= (y - h/2) && mouseY <= (y + h/2)){
      return true;
    }else{
      return false;
    }
  }
  
  void onClick(){
    if(clicked == true){
      clicked = false;
    } else {
      if(clickedOn() == true){
        clicked = true;
      }else{
        clicked = false;
      }
    }
  }
  
  void selectedQ(){
    selected = true;
  }
}
