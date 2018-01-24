class ammo{

  float x,y;
  ammo(float _x, float _y){
    x = _x;
    y = _y;

    
  }
  void shootDrawLoop(float whatIsXNow){// does all the work for you, call this to shoot
    display();
    
    moveShot(whatIsXNow);
    
    isHit();
    
  
  }
  
  
  
  void display(){
    fill(219,160,51);
    ellipse(x,y,50,50);  
  
  }
  
  void moveShot(float currentX){// moves the ammo and resets it when needed. takes in a currentX of the ai
    y += 15;
    
    if(y > height){// this means the bullet has passed you so reset time
      x = currentX;
      y = 200;// the y is constant for the ai
    }
  
}
  
  
  void isHit(){// a very crude method to see if you have been hit
  float toClose = 60;// this is what is considerd "hit"
  
  
  
  float theDisBetweenShotAndMouse = dist(x,y,mouseX,mouseY);// this calcs the distance
  
  if(theDisBetweenShotAndMouse < toClose){// checking to see if it is in range
    state = 2;// i know i shouldnt but this really is the most effiecent way to end the game :(
  
}

  }
}