import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

int go1 = 1;
int go2 = 1;

void setup() 
{
  size(200, 200);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
  background(255);             // Set background to white
  if (val == 1) {              // If the serial value is 0,
    fill(231, 206, 227);
    if (go1 == 1) {
      println("A3");
    }
    go1 = 0;
    print(".");
  } else if (val == 2) {
    fill(221, 253, 254);
    if (go2 == 1) {
      println("A4");
    }
    go2 = 0;
    print(".");
  }
  else {                       // If the serial value is not 0,
    fill(204);                 // set fill to light gray
  }
  rect(50, 50, 100, 100);
}



/*

// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

int switchPin = 4;                       // Switch connected to pin 4

void setup() {
  pinMode(switchPin, INPUT);             // Set pin 0 as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
    Serial.write(1);               // send 1 to Processing
  } else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  delay(100);                            // Wait 100 milliseconds
}

*/
