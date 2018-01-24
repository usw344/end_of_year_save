
void setup() {
  size(1000,1000); 
}

void draw() {
  background(0); 
  for (int counter = 1; counter <= 6; counter += 1) {
      drawcar(counter *125, counter*100,100);
  }
}


void drawcar(int x, int y, int thesize) {
  // Using a local variable "offset"
  int offset = thesize/4;
  // Draw main car body
  rectMode(CENTER);
  stroke(200);
  fill(random(0,255),random(0,255), random(0,255));
  rect(x, y, thesize, thesize/2);
  // Draw four wheels relative to center
  fill(200);
  rect(x - offset, y - offset, offset, offset/2);
  rect(x + offset, y - offset, offset, offset/2);
  rect(x - offset, y + offset, offset, offset/2);
  rect(x + offset, y + offset, offset, offset/2);
}