class WriteBlankQuestion extends Question{
  AnswerField answer;
  
  WriteBlankQuestion(){
    
    answer = new AnswerField();
  }
  
  void update(){
    super.update();
    answer.display();
  }
  
}
