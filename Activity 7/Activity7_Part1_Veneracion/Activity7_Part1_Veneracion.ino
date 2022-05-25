// The Arduino code.
int xVal=0; //joystick x-axis
int yVal=0; //joystick y-axis
int bVal=0; //joystick button
int xValLow, xValHigh, yValLow, yValHigh;

void setup() {
  Serial.begin(9600); 
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(9, INPUT);
}

void loop() {
  xVal = analogRead(A0);
  yVal = analogRead(A1);
  bVal = digitalRead(9);

  xValLow = xVal;
  xValHigh = xVal >> 8;
  yValLow = yVal;
  yValHigh = yVal >> 8;
  Serial.write(xValLow);
  Serial.write(xValHigh);
  Serial.write(yValLow);
  Serial.write(yValHigh);
}
