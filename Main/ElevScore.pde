class ElevScore extends Page{

  ElevScore(){
  }
  
  void display(){
    textSize(30);
    fill(10);
    text("Testen er nu færdig",width/2,100);
    text("Du fik " + score + " point",width/2,150);
  }
  
}
