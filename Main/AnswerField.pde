class AnswerField extends TextField {
  
  public AnswerField(PVector pos, PVector size) {
    super(pos, size);
    defaultText = "Svar her";
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY) {
    super(posX, posY, sizeX, sizeY);
  }

  public AnswerField(PVector pos, PVector size, color priCol, color secCol) {
    super(pos, size, priCol, secCol, "");
  }
  
  public AnswerField(int posX, int posY, int sizeX, int sizeY, color priCol, color secCol) {
    super(posX, posY, sizeX, sizeY, priCol, secCol, "");
  }
  
  //Overrider, så der kun kan tilføjes tal.
  void addKey(char letter, int code) {
    if (isSelected) {
      if (code == BACKSPACE) {
        delLetter();
      }
      else if (code == ENTER || code == RETURN) {
        action();
      }
      else {
        if (isKeyNumber(letter))
          addLetter(letter);
      }
    }
  }
  
}
