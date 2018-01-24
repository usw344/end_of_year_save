//GOAL: make a 'traffic light' simulator. For now, just have the light 
// changing according to time. You may want to investigate the millis()
// function at processing.org/reference.


float timer,finalTime,start;
int r,g,b,state;


void setup() {
  size(600, 600);
  start = millis();
  r = 255;
  g = 0;
  b = 0;
}

void draw() {
  background(255);
  drawOutlineOfLights();
  theTime();
  changeStateOfLight();
  //println(finalTime);
}

void drawOutlineOfLights() {
  //box
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2, 75, 200, 10);
  
  //lights
  if (state == 1) {
    fill(255,0,0); 
    ellipse(width/2, height/2 - 65, 50, 50); //top
    println("1");
  }
  if (state == 3) {
    fill(255,172,520);
    ellipse(width/2, height/2, 50, 50); //middle
    println("3");
}
  
  if (state == 2) {
    fill(0,255,0);
    ellipse(width/2, height/2 + 65, 50, 50); //bottom
    println("2");
}
}

void theTime() {
  timer = millis()-start;
  finalTime = timer / 1000; // converting into seconds
  fill(100,100,34);
  textSize(64);;
  text(finalTime, 100,100);
}


void changeStateOfLight() {
  //turn red
  if (finalTime > 0 && finalTime < 1) {
    state = 1;
  }
  //turn green
  if (finalTime > 1 && finalTime < 3) {
     state = 2;
   }
  //turn yellow
  if (finalTime > 3 && finalTime < 5) {
    state = 3;
  }
  if (finalTime > 5);
    timer = millis()- finalTime;
    state = 1;
}
  
   
 