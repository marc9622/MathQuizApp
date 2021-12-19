class Question {
  AnswerField answerField;
  int multiAns = 0;

  int number;
  String question = "";
  String answer = "", answer2 = "", answer3 = "", answer4 = "";

  Question(int nr, String question_, String answer_) {
    number = nr;
    question = question_;
    answer = answer_;
    multiAns = 0;
  }

  Question(int nr, String question_, String answer_, String answer2_, String answer3_, String answer4_) {
    number = nr;
    question = question_;
    answer = answer_;
    answer2 = answer2_;
    answer3 = answer3_;
    answer4 = answer4_;
    multiAns = 0;

    if (answer2 != null) {
      multiAns++;
      if (answer3 != null) {
        multiAns++;
        if (answer4 != null) {
          multiAns++;
        }
      }
    }
  }

  void display() {
    fill(0);
    text(question, 500, 50);
    
    for(int i = 1; i < multiAns ; i++){
      rect(width-150,150*i,100,100,10);
    }
    
  }
}
