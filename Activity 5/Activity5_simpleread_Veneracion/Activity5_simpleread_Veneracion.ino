// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

int switchPin1 = 17;                       
int switchPin2 = 18;

void setup() {
  pinMode(switchPin1, INPUT_PULLUP);        
  pinMode(switchPin2, INPUT_PULLUP);
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(switchPin1) == LOW) {  // If switch is ON,
    Serial.write(1);               // send 1 to Processing
  } else if (digitalRead(switchPin2) == LOW) {  // If switch is ON,
    Serial.write(2);               // send 1 to Processing
  } else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  delay(100);                            // Wait 100 milliseconds
}
