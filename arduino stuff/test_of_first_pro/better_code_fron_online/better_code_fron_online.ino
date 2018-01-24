int led[3] = {2, 3, 4}; // Assign the pins for the leds
int mic= A0;     // 'mic' is the Arduino pin A0 = the analog output pin of the Microphone board (A0)
int val = 0;     // variable to store the analog microphone value
 
void setup () 
{
  for(int i = 0; i < 3; i++) {
    pinMode(led[i], OUTPUT);
  }
  Serial.begin (9600);
}
 
void loop () 
{
  int sensorValue = analogRead (mic);
  Serial.println(sensorValue);
  sensorValue = sensorValue/ 22;
  if (sensorValue > 1) {
    for(int i = 0; i < 3; i++) {
      digitalWrite(led[i], HIGH);
    }
  }
  else {
    for(int i = 0; i < 3; i++) {
      digitalWrite(led[i], LOW);
    }
}
}
