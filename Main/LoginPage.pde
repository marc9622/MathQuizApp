class LoginPage {
  
  TextField textField = new TextField(width * 1/2, height * 3/5 - 100, 200, 50, "name");
  LoginField loginField = new LoginField(width * 1/2, height * 3/5, 200, 50, "password");
  
  public LoginPage() {
    keyListeners.add(textField);
    keyListeners.add(loginField);
  }
  
  void display() {
    textField.display();
    loginField.display();
  }
  
}
