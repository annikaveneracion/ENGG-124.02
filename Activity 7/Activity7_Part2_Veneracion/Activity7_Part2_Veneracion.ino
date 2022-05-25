// The Arduino code.
int xVal=0; //joystick x-axis
int yVal=0; //joystick y-axis
int bVal=0; //joystick switch
int ldr=0;
int yValLow, yValHigh, ldrLow, ldrHigh;

void setup() {
  Serial.begin(9600); 
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(9, INPUT);
}

void loop() {
  xVal = analogRead(A0);
  yVal = analogRead(A1);
  bVal = digitalRead(9);
  ldr = analogRead(A2);

  yValLow = yVal;
  yValHigh = yVal >> 8;
  ldrLow = ldr;
  ldrHigh = ldr >> 8;

  Serial.write(yValLow);
  Serial.write(yValHigh);
  Serial.write(ldrLow);
  Serial.write(ldrHigh);
}
