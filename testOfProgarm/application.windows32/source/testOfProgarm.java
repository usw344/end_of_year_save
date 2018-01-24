import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class testOfProgarm extends PApplet {

// State Variables Demo
// Sept 28, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;
float[] ballX, ballY, ballSize, dxBall, dyBall;
int[] ballColor;
int numberOfBalls;
int state;
int bounceCounter;

public void setup() {
  //size(800, 800);
  

  state = 0;
  bounceCounter = 0;
  numberOfBalls = 10;

  //declare where the button should be
  buttonWidth = 600;
  buttonHeight = 200;
  buttonX = width/2 - buttonWidth/2;
  buttonY = height/2 - buttonHeight/2;

  //calculate sides of button
  buttonTop = buttonY;
  buttonBottom = buttonY + buttonHeight;
  buttonLeftSide = buttonX;
  buttonRightSide = buttonX + buttonWidth;

  //make space in ram for the arrays
  ballX = new float[numberOfBalls];
  ballY = new float[numberOfBalls];
  ballSize = new float[numberOfBalls];
  dxBall = new float[numberOfBalls];
  dyBall = new float[numberOfBalls];
  ballColor = new int[numberOfBalls];

  //set values for ball
  for (int counter=0; counter<numberOfBalls; counter++) {
    ballSize[counter] = random(10, 100);
    ballX[counter] = random(ballSize[counter], width-ballSize[counter]);
    ballY[counter] = random(ballSize[counter], height-ballSize[counter]);
    
    dxBall[counter] = random(-10, 10);
    dyBall[counter] = random(-10, 10);
    ballColor[counter] = color(random(255), random(255), random(255), random(255));
  }
}

public void draw() {
  background(255);
  if (state == 0) {  //start screen
    displayButton();
  } else if (state == 1) {  //bouncing ball part
    bounceBall();
    detectCollision();
    //checkIfGameDone();
  } else if (state == 2) {  //ending screen
    endingScreen();
  }
}

public void detectCollision() {
  for (int i=0; i<numberOfBalls; i++) {
    for (int j=0; j<numberOfBalls; j++) {
      //don't check for collision with self
      if (i != j) {
        float distanceBetweenBalls = dist(ballX[i], ballY[i], ballX[j], ballY[j]);
        float sumOfRadii = ballSize[i]/2 + ballSize[j]/2;
        
        if (distanceBetweenBalls <= sumOfRadii) {  //collision!!!
          bounceCounter++;
          //put bounce on collision code here!
          dxBall[i] *= -1;
          dyBall[i] *= -1;
          
          //dxBall[j] *= -1;
          //dyBall[j] *= -1;
        }
      }
    }
  }
}

public void endingScreen() {
  background(0);
  fill(255);
  textSize(72);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  textSize(30);
  text("Press any key to reset the game", width/2, height/2 + 75);
}

public void checkIfGameDone() {
  if (bounceCounter >= 10) {
    state = 2;
  }
}

public void bounceBall() {
  for (int i=0; i<numberOfBalls; i++) {
    //move ball
    ballX[i] += dxBall[i];
    ballY[i] += dyBall[i];

    bounceIfRequired(i);
    displayBounces();

    //display ball
    noStroke();
    fill(ballColor[i]);
    ellipse(ballX[i], ballY[i], ballSize[i], ballSize[i]);
  }
}

public void displayBounces() {
  textAlign(LEFT);
  textSize(32);
  text(bounceCounter, 25, 50);
}

public void bounceIfRequired(int ballNumber) {
  //is it hitting the right or left side?
  if ( (ballX[ballNumber] > width - ballSize[ballNumber]/2) || (ballX[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dxBall[ballNumber] *= -1;
    //bounceCounter++;
  }

  //is it hitting the top or bottom?
  if ( (ballY[ballNumber] > height - ballSize[ballNumber]/2) || (ballY[ballNumber] < 0 + ballSize[ballNumber]/2) ) {
    dyBall[ballNumber] *= -1;
    //bounceCounter++;
  }
}

public boolean mouseIsOnButton() {
  return ((mouseX > buttonLeftSide) &&
    (mouseX < buttonRightSide) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
}

public void displayButton() {
  if (mouseIsOnButton() ) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

public void mousePressed() {
  if (mouseIsOnButton()) {
    background(255);
    state = 1;
  }
}

public void keyPressed() {
  if (state == 2) { //if on ending screen
    state = 0;
    bounceCounter = 0;
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "testOfProgarm" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
