// timer code. really usefull. 
Timer t1;

void setup() {
  size(600,600);
  t1 = new Timer(10,23);


}


void draw() {
  background(0);
  t1.begin();
  t1.pause();


}