//Statisk klasse, der holder styr på textfelterne og sørger for, at man kun kan redigere i ét textfelt af gangen.
static class InputManager {
  
  //Listen af alle textfelter.
  private static ArrayList<TextField> keyListeners = new ArrayList<TextField>();
  
  //Index på hvilket textfelt i listen, der er selected.
  private static int selectedTextField = -1;
  
  static void clear() {
    keyListeners.clear();
  }
  
  //Bruges af textfelternes konstruktører til at tilføje dem til listen af tekstfelter.
  static void add(TextField textField) {
    keyListeners.add(textField);
  }
  
  //Brugt til at fjerne et tekstfelt fra listen af tekstfelter og sikrer, at det selectede tekstfelt ikke ændres.
  static void remove(TextField textField) {
    if(keyListeners.indexOf(textField) == selectedTextField)
      deselect();
    else if(keyListeners.indexOf(textField) < selectedTextField)
      selectedTextField--;
  }
  
  //Bruges af mouseClicked() og finder det textfelt, der skal selectes, og unselecter alle andre textfelter.
  static void select() {
    for(int i = 0; i < keyListeners.size(); i++) {
      if(keyListeners.get(i).mousePress()) {
        selectedTextField = i;
        for(i++; i < keyListeners.size(); i++)
          keyListeners.get(i).isSelected = false;
        return;
      }
      else {
        keyListeners.get(i).isSelected = false;
      }
    }
  }
  
  static void select(TextField textField) {
    selectedTextField = keyListeners.indexOf(textField);
    for(int i = 0; i < keyListeners.size(); i++) {
      if(i == selectedTextField)
        keyListeners.get(i).isSelected = true;
      else
        keyListeners.get(i).isSelected = false;
    }
  }
  
  static void selectNext() {
    keyListeners.get(selectedTextField).isSelected = false;
    selectedTextField++;
    if(selectedTextField >= keyListeners.size())
      selectedTextField = 0;
    keyListeners.get(selectedTextField).isSelected = true;
  }
  
  static void deselect() {
    
  }
  
  //Bruges til at fortælle det selected textfelt, at det skal registrere, hvad der bliver tastet.
  static void input() {
    keyListeners.get(selectedTextField).keyPress();
  }
}
