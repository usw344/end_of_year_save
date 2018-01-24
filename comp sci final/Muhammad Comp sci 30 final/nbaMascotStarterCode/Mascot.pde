class mascot {

  float x, y, typeOfMasc, w, h, speed;
  
  PImage theMasc, invertedMasc;
  
  boolean inverted, getReadyToLose;
  
  ammo theShot; /// dont use an array cause the game would be impossible
  
  mascot(float _x, float _y, int _typeOfMasc, String _imageName, String _invertedImage, float theSpeed) {
    
    // setting the local
    x = _x;
    y = _y;
    
    
    // the width is hard value same for all
    w = width/8;
    h = height/8;
    
    
    //setting what behaviour it will show
    ///// p.s 1 is key, 2 is mouse, 3 is self(ai) thing
    typeOfMasc = _typeOfMasc;
    
    
    /// loading the images
    theMasc = loadImage(_imageName);
    invertedMasc = loadImage(_invertedImage);

    speed = theSpeed;
    
    // setting inital point of shooting
    theShot = new ammo(x, y);


    getReadyToLose = false;


  }
  void display() {
    imageMode(CENTER);
    
    // for some the image changed depeding on your mouse
    if (inverted) { // <<<---- inverted is a boolean changed at some places in the code
      image(invertedMasc, x, y, w, h);
    } 
   
    else {
      image(theMasc, x, y, w, h);
    }
  }

  void movement() {// consider this to be a drawloop

    if (typeOfMasc == 1) { // all code for keymovement mascs
      if (keyPressed && key == 'g') {
        getReadyToLose = true;// starts the moveing of the mascots
      }
      
      if(getReadyToLose){ //<<<<------ this is for the main movment of key masc. 
        speed = 5;
  
        x += speed * random(3, 3);// seting random speeds
        y += speed * random(4,5); 
  
  
        if (isBounceNeeded()) {
          speed = speed /2;// just slow them down so that they dont keep speeding up
          
          /// reset them after they go off screen
          x = random(0, width - w * 2);
          y = random(0, height - h*2);
      }
      }
    } 
    
    
    else if (typeOfMasc == 2) { // for mouse movement
      
      //// brutally simple just follow the mouse, and dont get hit 
      x = mouseX;
      y = mouseY;
    
  } 
  
  
    else if (typeOfMasc == 3) { // ai
      // added all the ai code this this function
      ai();
    }
  }


  boolean isBounceNeeded() {//// checks to see if key masc. is off the screen
    if (x > 0 && x < width && y > 0 && y < height) {
      return false;
    }
    return true;
  }
  
  // code for controlling the ai
  void ai() {
    if (x > mouseX) {// if mouseX is to left then switch image (see display()) and change the direction of the speed
      inverted = true;
      x -= speed;
    } 
    
    else {
      inverted = false;
      x += speed;
    }

    theShot.shootDrawLoop(x);// see the shoot loop in the ammo class. Handles all the ammo stuff
  }
}