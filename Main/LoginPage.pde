class LoginPage {

  TextField nameField = new TextField(width * 1/2, height * 3/6, 200, 50, "name") {
    //Overrider metoden, så man selecter passField, når man trykker enter.
    public void action() {
      InputManager.select(passField);
    }
  };
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
      
    }
  };

  public LoginPage() {
  }

  void display() {
    showText("<program name>", width * 1/2, height * 2/6, 50, primaryColor);
    nameField.display();
    passField.display();
  }

  private void login() {
    println("Logging in...");
  }
}
