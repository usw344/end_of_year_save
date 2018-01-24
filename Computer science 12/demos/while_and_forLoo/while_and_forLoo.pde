void setup() { 
  size(1048,600);
}
void draw() {
  background(0);
  int counter = 0;
  while (counter < 1048) {
    fill(random(255),random(225),random(255));
    rect(random(width),random(height),random(50,100),random(50,100));
    counter++ ;  
  }



}