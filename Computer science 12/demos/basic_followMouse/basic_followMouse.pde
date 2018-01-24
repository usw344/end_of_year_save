//global variables
boolean isHotOut;

void setup() {
  size(800, 500);
}

void draw() {
  background(0);
  if (isHotOut) {
    fill(255, 0, 0);
  }
  else {
    fill(0,255,0);
  }
  rectMode(CENTER);
  rect(mouseX, mouseY, 200,200);

}

void mouseClicked() {
  isHotOut = !isHotOut;

}