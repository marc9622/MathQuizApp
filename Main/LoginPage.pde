class LoginPage {
  
  TextField textField = new TextField(width * 1/2, height * 3/6, 200, 50, "name");
  LoginField loginField = new LoginField(width * 1/2, height * 4/6, 200, 50, "password");
  
  public LoginPage() {
    
  }
  
  void display() {
    showText("<program name>", width * 1/2, height * 2/6, 50, primaryColor);
    textField.display();
    loginField.display();
  }
  
}
