public class TextField {

  private PVector pos;
  private PVector size;
  
  private color priCol = strongTextColor;
  private color secCol = weakTextColor;
  private color fillCol = fillColor;
  private color selCol = selectColor;
  
  String defaultText = "";
  String input = "";
  private int textSize = 25;

  public boolean isSelected;
  
  boolean hidden = false; 

  public TextField(PVector pos, PVector size) {
    this.pos = pos.copy();
    this.size = size.copy();
    InputManager.add(this);
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
    this.fillCol = priCol;
    this.priCol = secCol;
  }
  
  public TextField(int posX, int posY, int sizeX, int sizeY, color priCol, color secCol, String defaultText) {
    this(new PVector(posX, posY), new PVector(sizeX, sizeY), priCol, secCol, defaultText);
  }

  public void display() {
    rectMode(CENTER);
    if(isSelected)
      fill(selCol);
    else
      fill(fillCol);
    stroke(priCol);
    rect(pos.x, pos.y, size.x, size.y, 10);
    
    displayText(input);
  }
  
  //Overriden af passField i LoginPage.
  protected void displayText(String input) {
    textAlign(CENTER);
    textSize(textSize);
    String text = "";
    if(input.length() == 0) {
      fill(secCol);
      text = defaultText;
    }
    else {
      fill(priCol);
      text = input;
    }
    text(text, pos.x, pos.y + textSize / 3);
  }
  
  //Registrere om dette tekstfeldt skal selectes ud fra musens position.
  public boolean mousePress() {
    if(mouseX > pos.x - size.x / 2 &&
       mouseX < pos.x + size.x / 2 &&
       mouseY > pos.y - size.y / 2 &&
       mouseY < pos.y + size.y / 2
       ) {
      isSelected = !isSelected;
      return isSelected;
    }
    return false;
  }

  //Kaldes af main for at tilføje bogstav til input.
  public void keyPress() {
    addKey(key, keyCode);
  }

  protected void addKey(char letter, int code) {
    if (isSelected) {
      if (code == BACKSPACE) {
        delLetter();
      }
      else if (code == 32) { //Mellemrum
        addLetter(' ');
      }
      else if (code == TAB) {
        tab();
      }
      else if (code == ENTER || code == RETURN) {
        action();
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
  protected void delLetter() {
    if(!input.isEmpty())
      input = input.substring(0, input.length() - 1);
  }
  
  protected boolean isKeyLetter(char letter) {
    return (letter >= 'A' && letter <= 'Z') || (letter >= 'a' && letter <= 'z');
  }
  
  protected boolean isKeyNumber(char letter) {
    return letter >= '0' && letter <= '9';
  }
  
  public void tab() {
    InputManager.selectNext();
  }
  //Lavet til at blive overridden.
  public void action() {}
}
