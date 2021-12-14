class LoginPage {
  
  TextField nameField = new TextField(width * 1/2, height * 3/6, 200, 50, "name");
  LoginField passField = new LoginField(width * 1/2, height * 4/6, 200, 50, "password") {
    public void action() {
      println("Logging in...");
    }
  };
  
  public LoginPage() {
    
  }
  
  void display() {
    showText("<program name>", width * 1/2, height * 2/6, 50, primaryColor);
    nameField.display();
    passField.display();
  }
  
}
