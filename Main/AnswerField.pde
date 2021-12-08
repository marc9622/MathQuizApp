class AnswerField extends TextField {
  
  public AnswerField(PVector pos, PVector size) {
    super(pos, size);
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY) {
    super(posX, posY, sizeX, sizeY);
  }

  public AnswerField(PVector pos, PVector size, color priCol, color secCol) {
    super(pos, size, priCol, secCol, "");
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY, color priCol, color secCol) {
    super(new PVector(posX, posY), new PVector(sizeX, sizeY), priCol, secCol, "");
  }
  
  //Overrider, så der kun kan tilføjes tal.
  public void addKey(int keyCode) {
    
  }
  
}
