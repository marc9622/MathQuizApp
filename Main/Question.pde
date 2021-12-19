class Question {
  
  int number;
  String question = "";
  String answer = "";
  
  Question(int nr, String question_, String answer_){
    number = nr;
    question = question_;
    answer = answer_;
  }
  
  void update(){
    fill(0);
    text(question,500,50);
  }
  
  void display(){

  }
}
