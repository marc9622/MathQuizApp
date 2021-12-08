class WriteBlankQuestion extends Question{
  AnswerField answer;
  
  WriteBlankQuestion(){
    
    answer = new AnswerField(new PVector(500,300),new PVector(300,200));
  }
  
  void update(){
    super.update();
    answer.display();
  }
  
}
