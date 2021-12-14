public abstract class Page {
  
  public Page() {
    InputManager.clear();
    initiate();
  }
  
  protected void initiate() {}
  
  public abstract void display();
  
}
