//Statisk klasse, der holder styr på textfeldterne og sørger for, at man kun kan redigere i ét textfeldt af gangen.
static class InputManager {
  
  //Listen af alle textfeldter.
  private static ArrayList<TextField> keyListeners = new ArrayList<TextField>();
  
  //Index på hvilket textfeldt i listen, der er selected.
  private static int selectedTextField = 0;
  
  //Bruges af textfeldternes konstruktører til at tilføje dem til listen af tekstfeldter.
  static void add(TextField textField) {
    keyListeners.add(textField);
  }
  
  //Bruges af mouseClicked() og finder det textfeldt, der skal selectes, og unselecter alle andre textfeldter.
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
  
  //Bruges til at fortælle det selected textfeldt, at det skal registrere, hvad der bliver tastet.
  static void input() {
    keyListeners.get(selectedTextField).keyPress();
  }
}
