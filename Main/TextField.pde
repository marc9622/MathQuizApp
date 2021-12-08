public class TextField {

  PVector pos;
  PVector size;
  
  color priCol;
  color secCol;
  
  String defaultText;
  String input = "";

  boolean isSelected;

  public TextField(PVector pos, PVector size) {
    this.pos = pos.copy();
    this.size = size.copy();
  }
  
  public TextField(int posX, int posY, int sizeX, int sizeY) {
    this(new PVector(posX, posY), new PVector(sizeX, sizeY));
  }

  public TextField(PVector pos, PVector size, String defaultText) {
    this(pos, size);
    this.defaultText = defaultText;
  }
  
  public TextField(int posX, int posY, int sizeX, int sizeY, String defaultText) {
    this(new PVector(posX, posY), new PVector(sizeX, sizeY), defaultText);
  }

  public TextField(PVector pos, PVector size, color priCol, color secCol, String defaultText) {
    this(pos, size, defaultText);
    this.priCol = priCol;
    this.secCol = secCol;
  }
  
  public TextField(int posX, int posY, int sizeX, int sizeY, color priCol, color secCol, String defaultText) {
    this(new PVector(posX, posY), new PVector(sizeX, sizeY), priCol, secCol, defaultText);
  }

  public void display() {
    rectMode(CENTER);
    fill(priCol);
    stroke(secCol);
    rect(pos.x, pos.y, size.x, size.y, 10);
    
    textAlign(CENTER);
    fill(secCol);
    text(getDisplayText(), pos.x, pos.y);
  }
  
  private String getDisplayText() {
    if(input.isBlank())
      return defaultText;
    return input;
  }

  //Kaldes af main for at tilføje bogstav til input.
  public void addKey() {
    addKey(key, keyCode);
  }

  private void addKey(char letter, int code) {
    if (isSelected) {
      if (code == BACKSPACE) {
        delLetter();
      }
      else if (code == 32) { //Mellemrum
        addLetter(' ');
      }
      else if (code == ENTER || code == RETURN) {
        //NÅR MAN TRYKKER ENTER
      }
      else {
        if (isKeyLetter(letter) || isKeyNumber(letter))
          addLetter(letter);
      }
    }
  }
  
  //Tilføjer, et tegn til inputtet.
  void addLetter(char letter) {
    if(textWidth(input + letter) < size.x) {
      input += letter;
    }
  }
  
  //Kaldes, når der trykkes på backspace.
  private void delLetter() {
    if(!input.isEmpty())
      input = input.substring(input.length() - 1);
  }
  
  protected boolean isKeyLetter(char letter) {
    return (letter >= 'A' && letter <= 'Z') || (letter >= 'a' && letter <= 'z');
  }
  
  protected boolean isKeyNumber(char letter) {
    return letter >= '0' && letter <= '9';
  }
}
