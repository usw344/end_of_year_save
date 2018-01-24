// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 22-1: Inheritance

// Object oriented programming allows us to defi ne classes in terms of other classes.
// A class can be a subclass (aka " child " ) of a super class (aka "parent").
// This is a simple example demonstrating this concept, known as "inheritance."
Square s[];
Circle c[];
Line l1[];
void setup() {
  size(800,800);
  smooth();
  s = new Square[20];
  c = new Circle[20];
  l1 = new Line[20];
  
  // A square and circle
  for (int i = 0; i < 20; i++){
    s[i] = new Square(random(20,200),random(90,400),random(0,100));
    c[i] = new Circle(random(400,800),random(10,125),random(40,150),color(random(0,175)));
    l1[i] = new Line(100,random(width/2,width -10),600,620);
}

}
void draw() {
  background(255);
    for(int j = 0; j < 20; j++) {
    l1[j].jiggle();
    c[j].jiggle();
    s[j].jiggle();
    c[j].display();
    s[j].display();
    l1[j].display();
    }
}