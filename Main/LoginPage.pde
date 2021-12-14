class LoginPage {

  //Anonym class, med overridden action().
  TextField nameField = new TextField(width * 1/2, height * 3/6, 200, 50, "name") {
    //Overrider metoden, så man selecter passField, når man trykker enter.
    public void action() {
      InputManager.select(passField);
    }
  };
  //Anonym class, der censorerer inputtet, og kører login().
  TextField passField = new TextField(width * 1/2, height * 4/6, 200, 50, "password") {
    //Overrider metoden, så den viste tekst bliver censoreret.
    protected String getDisplayText() {
      if (input.length() == 0)
        return defaultText;
      String text = "";
      for (int i = 0; i < input.length(); i++)
        text += '*';
      return text;
    }
    //Overrider metoden, så man kører login metoden, når man trykker enter.
    public void action() {
      if (login()) {
        println("Logget ind :)");
      }
    }
  };

  public LoginPage() {
  }

  void display() {
    showText("<program name>", width * 1/2, height * 2/6, 50, primaryColor);
    nameField.display();
    passField.display();
  }

  private boolean login() {
    if (Data.connect()) {
      Data.query("SELECT Nr, Navn, Kode FROM ElevData");
      while (true) {
        if (Data.next())
          if (Data.getString("Navn").equals(nameField.input)) {
            if (Data.getString("Kode").equals(passField.input)) {
              //Brug Data.getString("Nr") til et eller andet.
              return true;
            }
            println("Koden er forkert");
            return false;
          } else
            continue;
        println("Kunne ikke finde bruger med givent navn");
        return false;
      }
    } else {
      println("Kunne ikke forbinde til databasen");
      return false;
    }
  }
}
