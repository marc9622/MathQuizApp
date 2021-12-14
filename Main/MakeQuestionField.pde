class MakeQuestionField extends TextField{
  
  boolean multi;

  MakeQuestionField(){
    super(width / 2,height + 300, 400, 300, "Write question");
  }
  
  void action(){
    String sql = "INSERT INTO Questions(Nr, Question, Multi)VALUES ('" + NrQuestions+1 + "', '" + input + "', '" + multi + "');";
    Data.execute(sql);
  }
  
}
