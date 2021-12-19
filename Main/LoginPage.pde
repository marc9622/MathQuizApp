class LoginPage extends Page {
  
  boolean flipped = false;
  int flipperX = width/2-12;
  float frame = 0;
  
  TextField nameField;
  TextField passField;

  String statusText;

  protected void initiate() {
    nameField = new TextField(width * 1/2, height * 3/6, 200, 50, "Navn") {
      public void action() {
        InputManager.select(passField);
      }
    };
    passField = new TextField(width * 1/2, height * 4/6, 200, 50, "Kode") {
      //Overrider metoden, så den viste tekst bliver censoreret.
      protected void displayText(String input) {
        String text = "";
        for (int i = 0; i < input.length(); i++)
          text += '*';
        super.displayText(text);
      }
      //Overrider metoden, så man kører login metoden, når man trykker enter.
      public void action() {
        login();
      }
    };
  }

  public void display() {
    flipper();
    showText("Matematik Quiz", width * 1/2, height * 2/6, 50, strongTextColor);
    nameField.display();
    passField.display();
    if (statusText != null)
      showText(statusText, width * 1/2, height * 5/6, 15, strongTextColor);
  }

  private boolean login() {
    if (nameField.input.length() == 0) {
      statusText = "Indtast dit navn";
      return false;
    }
    if (passField.input.length() == 0) {
      statusText = "Indtast din kode";
      return false;
    }
    if (Data.connect()) {
      Data.query("SELECT Nr, Navn, Kode FROM ElevData");
      while (true) {
        if (Data.next())
          if (Data.getString("Navn").equals(nameField.input)) {
            if (Data.getString("Kode").equals(passField.input)) {
              //Her er brugeren logget ind. Så brug Data.getString("Nr") til et eller andet.
              statusText = "Logget ind :)";
              if(loginPage.flipped)
                page = 1;
              else
                page = 3;
              return true;
            }
            passField.input = "";
            statusText = "Koden er forkert";
            return false;
          } else
            continue;
        nameField.input = "";
        passField.input = "";
        statusText = "Kunne ikke finde bruger med givent navn";
        return false;
      }
    } else {
      statusText = "Kunne ikke forbinde til databasen";
      return false;
    }
  }
  
  void flipper(){
    if(abs(mouseX-width/2)<25 && abs(mouseY-(height-100))<13 && mousePressed && frame<frameCount-30){
      flipped = !flipped;
      frame = frameCount;
    }
    
    if(!flipped){
      fill(selectColor);
      flipperX = width/2-12;
    }
    if(flipped){
      fill(weakTextColor);
      flipperX = width/2+12;
    }
    
    rect(width/2,height-100,50,25,10);
    fill(strongTextColor);
    rect(flipperX,height-100,25,25,10);
    
    textSize(12);
    fill(0);
    text("Elev/Lærer",width/2,height-120);
  }
  
}
