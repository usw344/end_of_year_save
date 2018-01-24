PImage thePassword;


void setup() {
  size(800,800);
  thePassword = loadImage("passwords.jpg");
}


void draw() {
  background(0);
  image(thePassword,0,0);
  
  loadPixels();
  color  cursorLocal = pixels[mouseY * width + mouseX];
  
  fill(cursorLocal);
  rect(350,450,100,100);
  
  fill(255);
  textSize(18);
  text("R: " + red(cursorLocal), 350, 600);
  text("G: " + green(cursorLocal), 350, 650);
  text("B: " + blue(cursorLocal), 350, 700);




}