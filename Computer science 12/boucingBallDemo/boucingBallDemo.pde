//clickable button demo
// for Shao
// Sept 20, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight,ballX,ballY,ballSize, dxBall,dyBall;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;
int ballCounter,state;

void setup() {
  size(800, 800);
  state = 0;
  ballCounter =0;
  //declare where the button should be
  buttonX = 100;
  buttonY = 300;
  buttonWidth = 600;
  buttonHeight = 200;

  //calculate sides of button
  buttonTop = buttonY;
  buttonBottom = buttonY + buttonHeight;
  buttonLeftSide = buttonX;
  buttonRightSide = buttonX + buttonWidth;
  
  //set ball values
  ballX = width/2;
  ballY = height/2;
  ballSize = 40;
  dxBall = random(30,40);
  dyBall = random(25,30); 
}

void draw() {
  background(255);
  if (state == 0) {// start screen
    displayButton();
  
  } 
  else if (state == 1) { // boucing ball stuff
    bounceBall();
    checkIfGameDone();
  }
  else if (state == 2) { // END STUFF  
  endingScreen();
    
  }
}
void endingScreen() {
  textAlign(CENTER, CENTER);
  textSize(50);
  text("game Over",width/2,height/2);
  textSize(18);
  text("press any to reset",width/2,height/2+ 75);
}

void checkIfGameDone() {
  if (ballCounter >=10) {
    state = 2;
  }
}
void bounceBall() {
  //move the ball
  
  ballX += dxBall; 
  ballY += dyBall;
  
  bounceIfRequired();
  textSize(32);
  text(ballCounter,25,25);
  
  noStroke();
  ellipse(ballX,ballY, ballSize,ballSize);
  
  }
boolean mouseIsOnButton() {
  return ((mouseX > buttonLeftSide) &&
    (mouseX < buttonRightSide) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
}
void bounceIfRequired() {
  if ((ballX > width - ballSize/2) ||  (ballX < 0 + ballSize/2)) {
      dxBall *= -1;
      ballCounter ++;
  
}
  if ((ballY > height - ballSize/2) ||  (ballY < 0 + ballSize/2)) {
    dyBall *= -1;
    ballCounter++;
  }


}

void displayButton() {
  if (mouseIsOnButton() ) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

void mousePressed() {
  if (mouseIsOnButton()) {
    background(255);
    state = 1;
  }
}

void keyPressed() {
  if (state ==2) {
  state = 0;
  ballCounter = 0;
}
}