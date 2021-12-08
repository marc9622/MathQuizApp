TextField feldt = new TextField(500, 100, 200, 50, "Type here");

void settings() {
  size(1000, 500);
}

void setup() {
}

void draw() {
  background(255);
  feldt.display();
}

void keyPressed() {
  feldt.keyPress();
}

void mouseClicked() {
  feldt.mousePress();
}
