class MakeQuestion{
  TextField field;
  boolean multi;
  String sql;

  MakeQuestion(){
  
    field = new TextField(width/2,height+300,400,300,"Write question");
  }
  
  void update(){
    
    if(keyCode == ENTER){
      sql = "INSERT INTO Questions(Nr, Question, Multi)VALUES ('" + NrQuestions+1 + "', '" + field.input + "', '" + multi + "');";
      Data.execute(sql);
    }
  
  }
  
  void display(){
    field.display();
  }
  
}
