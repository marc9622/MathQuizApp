class WriteBlankQuestion extends Question{
  AnswerField answer;
  
  WriteBlankQuestion(int nr, String question_){
    super(nr,question_);
    answer = new AnswerField(new PVector(width/3,300),new PVector(300,200));
  }
  
  void display(){
    super.update();
    answer.display();
  }
  
}
