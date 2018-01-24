// I have included this code in order to help you get started.
// Feel free to use processing.org/reference if you 
// are having trouble with syntax

// there are a few images already in the data folder that you can use,
// but if you'd like to, you can do a quick Google Images search to 
// grab yourself some assets (images)

//size(600,600);
//background(255);
//PImage nbaMascot;
//nbaMascot = loadImage("raptors-r.png");
//float scalar = 0.75;

//imageMode(CENTER);
//tint(255, 200, 255, 150);
//image(nbaMascot, width/2,height/2, nbaMascot.width*scalar,nbaMascot.height*scalar);



masc1[] keyMasc;
masc2[] mouseMasc;
masc3[] aiMasc;
int keyMascLength, mouseMascLength, aiMascLength;


void setup() {
  size(600, 600);
  arrayStarter();



}


void draw() {
}




void arrayStarter() {
  keyMasc = new masc1[int(random(3, 6))];
  mouseMasc = new masc2[int(random(3, 6))];
  aiMasc = new masc3[int(random(3, 6))];

  for (int i = 0; i < keyMasc.length; i ++) {
    keyMasc[i] = new masc1();
  }
  for (int i = 0; i < mouseMasc.length; i ++) {
    mouseMasc[i] = new masc2();
  }
  for (int i = 0; i < aiMasc.length; i ++) {
    aiMasc[i] = new masc3();
  }
  keyMascLength = keyMasc.length;
  
  mouseMascLength = mouseMasc.length;
  
  aiMascLength = aiMasc.length;
}