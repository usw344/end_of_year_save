PImage thePassword;


void setup() {
  fullScreen();
  thePassword = loadImage("Fish.jpg");
}
             

void draw() {
  background(0);
  image(thePassword,0,0,1000,1000);
  
  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    color thePixel = pixels[i];
    float r = red(thePixel);
    float g = green(thePixel);
    float b = blue(thePixel);
    
    float newR = r*.393 + g * .769 + b * .189;
    float newG = r*.393 + g * .769 + b * .189;
    float newB = r*.393 + g * .769 + b * .189;
    
    pixels[i] = color(newR,newG,newB);
  

}
  updatePixels();  
  
  color  cursorLocal = pixels[mouseY * width + mouseX];
  
  fill(cursorLocal);
  rect(1250,450,100,100);
  
  fill(255);
  textSize(18);
  text("R: " + red(cursorLocal), 1200, 600);
  text("G: " + green(cursorLocal), 1200, 650);
  text("B: " + blue(cursorLocal), 1200, 700);




}