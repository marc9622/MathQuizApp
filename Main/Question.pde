class Question {
  AnswerField answerField;

  int number;
  String question = "";
  String answer = "";
  boolean multi;
  
  Question(int nr, String question_, String answer_){
    number = nr;
    question = question_;
    answer = answer_;
    multi = true;
  }
  
  void display(){
    fill(0);
    text(question,500,50);
  }
}
