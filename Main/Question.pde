class Question {
  AnswerField answerField;
  int multiAns = 0;
  int buttonI;

  int number;
  String question = "";
  String answer = "", answer2 = "", answer3 = "", answer4 = "";
  int AX1,AX2,AX3,AX4;
  
  boolean multi = true;

  Question(int nr, String question_, String answer_) {
    number = nr;
    question = question_;
    answer = answer_;
    multiAns = 0;
    answerField = new AnswerField(new PVector(1000,1000),new PVector(0,0));
  }

  Question(int nr, String question_, String answer_, String answer2_, String answer3_, String answer4_) {
    number = nr;
    question = question_;
    answer = answer_;
    answer2 = answer2_;
    answer3 = answer3_;
    answer4 = answer4_;
    multiAns = 2;
    answerField = new AnswerField(new PVector(1000,1000),new PVector(0,0));

    if (!answer2.equals("")) {
      multiAns++;
      if (!answer3.equals("")) {
        multiAns++;
        if (!answer4.equals("")) {
          multiAns++;
        }
      }
    }
    AX1 = int(random(1,5));
    if(multiAns < 3)
      return;
    while(AX2 == AX1 || AX2 == 0){
      AX2 = int(random(1,multiAns));
    }
    if(multiAns < 4)
      return;
    while(AX3 == AX1 || AX3 == AX2 || AX3 == 0){
      AX3 = int(random(1,multiAns));
    }
    if(multiAns < 5)
      return;
    while(AX4 == AX1 || AX4 == AX2 || AX4 == AX3 || AX4 == 0){
      AX4 = int(random(1,multiAns));
    }
  }

  void display() {
    fill(0);
    textSize(30);
    text(question, 500, 100);
    textSize(20);
    
    fill(selectColor);
    for(int i = 1; i < multiAns ; i++){
      if(abs(mouseX-(width-150))<45 && abs(mouseY-(100*i+50))<45 && mousePressed){
        buttonI = i;
      }
      if(i == buttonI)
        fill(weakTextColor);
      
      rect(width-150,100*i+50,90,90,10);
      fill(selectColor);
    }
    
    if(multiAns >1){
      if(buttonI == AX1)
        answerField.input = answer;
      if(buttonI == AX2)
        answerField.input = answer2;
      if(buttonI == AX3)
        answerField.input = answer3;
      if(buttonI == AX4)
        answerField.input = answer4;
      
      fill(strongTextColor);
      text(answer, width-150,100*AX1+50);
      text(answer2, width-150,100*AX2+50);
      text(answer3, width-150,100*AX3+50);
      text(answer4, width-150,100*AX4+50);
    }
  }
}
