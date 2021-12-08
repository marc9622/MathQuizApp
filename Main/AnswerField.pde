class AnswerField extends TextField {
  
  public AnswerField(PVector pos, PVector size) {
    super(pos, size);
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY) {
    super(posX, posY, sizeX, sizeY);
  }

  public AnswerField(PVector pos, PVector size, String defaultText) {
    super(pos, size, defaultText);
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY, String defaultText) {
    super(posX, posY, sizeX, sizeY, defaultText);
  }

  public AnswerField(PVector pos, PVector size, color priCol, color secCol, String defaultText) {
    super(pos, size, priCol, secCol, defaultText);
  }
  
  //Overrider, så der kun kan tilføjes tal.
  public void addKey(int keyCode) {
    
  }
  
}
