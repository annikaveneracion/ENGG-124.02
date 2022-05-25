import processing.net.*;
Client c;

import processing.serial.*;
Serial myPort;

int touch, distance;
int touchAve, distanceAve;
//put your thingspeak write key here
String tskey = "2NURH6U0H7WY7WO3";


void setup() 
{
  size(440, 440);
  background(0);             // Set background to white
  stroke(255);
  textSize(24);
  text("Thingspeak multi field ...", 25, 50);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  serialEvent();
  
  background(0);
  stroke(255);
  String s;
  s = " Sent values: " + str(touch) + ", " + str(distance);
  fill(255,20,147);
  text(s, 25, 100);
  
  c = new Client(this, "api.thingspeak.com", 80); // Connect to server on port 80
  c.write("GET http://"+"api.thingspeak.com/update?api_key=" + tskey + "&field1="+touch+"&field2="+distance);
  c.write("\r\n");
  println("   Sending data to thingspeak...");
  
  println(touch);
  println(distance);
 
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int q=1; q<=16; q++) {
    delay(1000);
  }
  
  if(keyPressed || mousePressed) {
    exit();
  }
 
}

void serialEvent() {
  if (myPort.available() > 0) {
    touch = myPort.read();
    distance = myPort.read();
  
  }   
}
