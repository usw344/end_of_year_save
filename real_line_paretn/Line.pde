class Line extends Shape {
  float x1,y1,x2,y2;
  
  Line(float x_,float y_,float x1_, float y1__) {
    super(x_,y_,x1_);
    x1= x_;
    y1 = y_;
    x2 = x1_;
    y2 = y1__;
  }
  void display() {
    line(x,y,x2,y2);
  }
  void jiggle() {
    super.jiggle();
    x2 += random(-1,1);
    y2 += random(-1,1);
    
  
  }
  

}