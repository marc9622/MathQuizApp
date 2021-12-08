class LoginField extends TextField {
  
  public LoginField(PVector pos, PVector size) {
    super(pos, size);
  }
  
  public LoginField(int posX, int posY, int sizeX, int sizeY) {
    super(posX, posY, sizeX, sizeY);
  }

  public LoginField(PVector pos, PVector size, String defaultText) {
    super(pos, size, defaultText);
  }
  
  public LoginField(int posX, int posY, int sizeX, int sizeY, String defaultText) {
    super(posX, posY, sizeX, sizeY, defaultText);
  }

  public LoginField(PVector pos, PVector size, color priCol, color secCol, String defaultText) {
    super(pos, size, priCol, secCol, defaultText);
  }
  
  public void addKey(int keyCode) {
    
  }
  
}
