class WriteBlankQuestion extends Question{
  
  WriteBlankQuestion(int nr, String question_,String answer_){
    super(nr,question_,answer_);
    answerField = new AnswerField(new PVector(775,300),new PVector(300,100));
    multi = false;
  }
  
  void display(){
    super.display();
    answerField.display();
  }
  
}
