class Question {
  
  int number;
  String question = "";
  String answer = "";
  String mulitiQ1 = "";
  String mulitiQ2 = "";
  String mulitiQ3 = "";
  
  Question(int nr, String question_, String answer_){
    number = nr;
    question = question_;
    answer = answer_;
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
