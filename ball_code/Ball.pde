class Ball {
  float x,y,radius,moveX,moveY;
  boolean changeColor;
  
  Ball(int _x, int _y, int _radius ) {
    x = _x;
    y = _y;
    radius = _radius/2;
    moveX = 18;
    moveY = 15;
    
  
}
  void display() {
    float dividing  = 1;
    if (changeColor) {

      dividing = random(1,20);
      changeColor = false;      
    }
    fill(x/dividing,y/dividing,radius);
    ellipse(x,y,radius*2,radius*2);
  
  }
  void move() {
    x = x + moveX;
    y = y + moveY;
  
  }
  void bounceIfNeeded() {
    if (x > width - radius) {
      moveX *= -1;
      changeColor = true;
      
    }
    if(y > height - radius) {
      moveY *= -1;
      changeColor = true;
      
    
    }
    if(y < radius) {
      moveY *= -1;
      changeColor = true;
    }
    if(x < radius) {
      moveX *= -1;
      changeColor = true;
    }
  }
  

}