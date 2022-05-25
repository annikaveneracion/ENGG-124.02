int led;
int ldr;
int xVal=0; //joystick x-axis
int yVal=0; //joystick y-axis
int bVal=0; //joystick button

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(8, INPUT);
  digitalWrite(8, HIGH);
  
  for(led = 2; led <= 11; led++)
    pinMode(led, OUTPUT);
}

void loop() {
  xVal = analogRead(A0);
  yVal = analogRead(A2);
  bVal = digitalRead(8);
  ldr = analogRead(A1);
  Serial.print(xVal);
  Serial.print(",");
  Serial.print(yVal);
  Serial.print(", ");
  Serial.print(!bVal);
  Serial.print(", ");
  Serial.println(ldr);

  //convert analogRead to binary
  for (int i=0; i <= 9; i++) {
    if (bitRead(ldr,i)) {
      digitalWrite((i+2),HIGH);
      }
      else {
        digitalWrite((i+2),LOW);
      }
  }
}
