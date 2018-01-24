int led[8] = { 3, 4, 5, 6, 7, 8, 9, 10}; // Assign the pins for the leds

int Audio = A0;

int s, i;

void setup()

{

  for (i = 0; i < 8; i++)

    pinMode(led[i], OUTPUT);

}

void loop()

{

  s = analogRead(Audio);

  Serial.println(s);

  s = s / 35; //Change the sensitivity by changing Denominator

  if (s == 0)

  {

    for (i = 0; i < 8; i++)

    {

      digitalWrite(led[i], LOW);

    }

  }

  else

  {

    for (i = 0; i < s; i++)

    {

      digitalWrite(led[i], HIGH);

      delay(40);

    }

    for (i = i; i < 8; i++)

    {

      digitalWrite(led[i], LOW);

    }

  }

}
