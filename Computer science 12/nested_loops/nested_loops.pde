int w;
boolean colorIs;
void setup() {
  w = width/8;
  size(500,500);
  colorIs = false;
}

void draw() {
  background(255);
  for (int row = 0; row < width; row += width/8) {  
    colorIs = !colorIs;
    for (int column = 0; column < height; column += height/8) {
      if (colorIs) {
        fill(255);
      } else {
        fill(0);
      }
      rect(row, column, w, w);
      colorIs = !colorIs;
    }
  }
}