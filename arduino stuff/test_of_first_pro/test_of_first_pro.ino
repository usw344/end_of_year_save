int led[3] = {2, 3, 4}; // Assign the pins for the leds

int Audio = A0;// pin of the sound detector

int soundValue; // name says it all



void setup() {

    Serial.begin(9600);
  
  for (int i = 0; i < 3; i++) {
    pinMode(led[i], OUTPUT); // setting up all the elements of an array to outPut methode.
  }
  //soundValue = 1;

  pinMode(3,OUTPUT);

}

void loop() {
  soundValue = analogRead(Audio); // taking the sound value from the sound meter on pin AO;
  Serial.println(soundValue); //converting into a binary;

  soundValue = soundValue /35; // setting it senstivity.

  Serial.println(soundValue);

  if(soundValue > 50){
    digitalWrite(3, HIGH);
    
  }
  else{
    digitalWrite(3,LOW);
  }
}


