// ball demo with OOP

Ball b1, b2, b3;

void setup() {
  size(1000,1000);
  b1 = new Ball(200,200,100);
  b2 = new Ball(300,100,75);
  b3 = new Ball(100,300,50);
  


}



void draw() {
  background(255);
  b1.display();
  b1.move();
  b1.bounceIfNeeded();
  
  b2.display();
  b2.move();
  b2.bounceIfNeeded();
  
  b3.display();
  b3.move();
  b3.bounceIfNeeded();


}