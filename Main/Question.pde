class Question {
  
  int number;
  String question = "";
  String answer = "";
  
  Question(int nr, String question_){
    number = nr;
    question = question_;
  }
  
  void update(){
    if(keyCode == ENTER){
      currentQ ++;
    }
  }
  
  void display(){
    text(question,width/3,100);
  }
}
