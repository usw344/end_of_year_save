size(600,600);

int sizeOfeclipse = 600;

int numberOfC = 5;
while (numberOfC > 0) {
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(width/2, height/2,sizeOfeclipse , sizeOfeclipse);
  numberOfC = numberOfC - 1;
  sizeOfeclipse = sizeOfeclipse -100;
}