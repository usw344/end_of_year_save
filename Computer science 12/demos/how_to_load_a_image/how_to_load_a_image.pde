
PImage minePicture;
void setup() {
  size(1040, 720);  
  minePicture = loadImage("ubuntu.png");
  imageMode(CENTER);
}


void draw() {
  background(255);
  sssssimage(minePicture, mouseX, mouseY, minePicture.width*0.80, minePicture.height*0.75);

}