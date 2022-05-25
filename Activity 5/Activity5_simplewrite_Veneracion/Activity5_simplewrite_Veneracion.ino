char val; // Data received from the serial port
int led;

void setup() {
  Serial.begin(9600); // Start serial communication at 9600 bps
  for(led = 2; led <= 13; led++)
    pinMode(led, OUTPUT);
}

void loop() {
  while (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == 'H') { // If H was received
    for(led = 2; led <= 13; led++) {
      digitalWrite(led, HIGH); // turn the LED on
    }
  } else {
    for(led = 2; led <= 13; led++) {
      digitalWrite(led, LOW); // Otherwise turn it OFF
    }
  }
  delay(10); // Wait 10 milliseconds for next reading
}
