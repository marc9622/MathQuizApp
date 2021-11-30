public class TextField {

  PVector position;
  PVector size;
  
  String defaultText;
  String input = "";

  boolean isSelected;

  void display() {
  }

  //Kaldes af main for at tilføje bogstav til input.
  void addKey(int keyCode) {
  }

  void addKey(char letter, int code) {
    if (isSelected) {
      if (code == BACKSPACE) {
        delLetter();
      }
      else if (code == 32) {
        
      }
      else if (code == ENTER) {
        
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
