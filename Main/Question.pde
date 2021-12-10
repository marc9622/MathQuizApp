class Question {
  int number;
  String question = "";
  
  Question(int nr, String question_){
    number = nr;
    question = question_;
  }
  
  void update(){
  
  }
  
  void display(){
    text(question,width/3,100);
  }
  
  
}
