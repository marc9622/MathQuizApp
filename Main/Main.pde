ArrayList<TextField> keyListeners = new ArrayList<TextField>();

void settings() {
}

void setup() {
}

void draw() {
  background(255);
}

void keyPressed() {
  for(TextField i : keyListeners) {
    i.keyPress();
  }
}

void mouseClicked() {
  for(TextField i : keyListeners) {
    i.mousePress();
  }
}
