// State Variables Demo
// Sept 28, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;

float[] ballX, ballY, ballSize, dxBall, dyBall;
float[] r,g,b;
int numberOfballs;
int state;
int bounceCounter;
boolean isHittingBall;

void setup() {
  size(800, 800);

  numberOfballs = 3;
  state = 0;
  bounceCounter = 0;

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

  //makespace in the ram

  ballX = new float[numberOfballs];
  ballY = new float[numberOfballs];
  ballSize = new float[numberOfballs];
  dxBall = new float[numberOfballs];
  dyBall = new float[numberOfballs];
  r = new float[numberOfballs];
  g = new float[numberOfballs];
  b = new float[numberOfballs];
  
  


  //set values for ball
  for (int counter =0 ; counter < numberOfballs; counter ++) {
    ballX[counter] = width/2;
    ballY[counter] = height/2;
    ballSize[counter] = 100;
    dxBall[counter] = random(1,10);
    dyBall[counter] = random(0.6);
    r[counter] = random(10,255);
    g[counter] = random(10,255);
    b[counter] = random(10,255);
  }
  isHittingBall = false;
}

void draw() {
  background(255);
  if (state == 0) {  //start screen
    displayButton();
  } else if (state == 1) {  //bouncing ball part
    bounceBall();
    checkIfGameDone();
  } else if (state == 2) {  //ending screen
    endingScreen();
  }
}

void endingScreen() {
  background(0);
  fill(255);
  textSize(72);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  textSize(30);
  text("Press any key to reset the game", width/2, height/2 + 75);
}

void checkIfGameDone() {
  if (bounceCounter >= 1000) {
    state = 2;
  }
}

void bounceBall() {
  //move ball
  for (int i = 0; i < numberOfballs;i++) {
    ballX[i] += dxBall[i];
    ballY[i] += dyBall[i];
  
    bounceIfRequired(i);
    displayBounces();

  
    //display ball
    noStroke();
    fill(r[i],g[i],b[i]);
    ellipse(ballX[i], ballY[i], ballSize[i], ballSize[i]);
  }
}

void displayBounces() {
  textAlign(LEFT);
  textSize(32);
  text(bounceCounter, 25, 50);
}

void bounceIfRequired(int ballNumber) {
  //is it hitting the right or left side?
  if ( (ballX[ballNumber] > width - ballSize[ballNumber]/2) || (ballX[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dxBall[ballNumber] *= -1;
    bounceCounter++;
  }

  //is it hitting the top or bottom?
  if ( (ballY[ballNumber] > height - ballSize[ballNumber]/2) || (ballY[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dyBall[ballNumber] *= -1;
    bounceCounter++;
  }
}

boolean mouseIsOnButton() {
  return ((mouseX > buttonLeftSide) &&
    (mouseX < buttonRightSide) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
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
  if (state == 2) { //if on ending screen
    state = 0;
    bounceCounter = 0;
  }
}