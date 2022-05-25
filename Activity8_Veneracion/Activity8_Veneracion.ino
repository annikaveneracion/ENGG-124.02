int touch = 7;
int state; 

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // initialize the Arduino's pin as aninput
  pinMode(touch, INPUT);
}

void loop() {
  // read the state of the the input pin:
  state = digitalRead(touch);

  if(state == LOW) {
    Serial.write(1);
  } else {
    Serial.write(0);
  }

  delay(80);

}
