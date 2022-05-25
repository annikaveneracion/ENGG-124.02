//processing source code for writing multiple values to fields of your
//thingspeak channel

import processing.net.*;
Client c;

int cnt=1, cnt2=3, control=0; 
//put your thingspeak write key here
String tskey = "EJK5FXJ67XWJQ6XR";

void setup() 
{
  size(440, 440);
  background(0);             // Set background to white
  stroke(255);
  textSize(24);
  text("Thingspeak multi field ...", 25, 50);
}

void draw()
{
  background(0);
  stroke(255);
  String s;
  s = " Sent values: " + str(cnt) + ", " + str(control) + ", " + str(cnt2);
  fill(255,20,147);
  text(s, 25, 100);
  
  c = new Client(this, "api.thingspeak.com", 80); // Connect to server on port 80
  c.write("GET http://"+"api.thingspeak.com/update?api_key=" + tskey + "&field1="+control+"&field2="+cnt+"&field3="+cnt2);
  c.write("\r\n");
  println("   Sending data to thingspeak...");
  
  cnt = (int) random(25)+5;
  control = (int) random(150) % 10;
  cnt2++;
  if (cnt2 == 20){
    cnt2--;
  }
  if (cnt2 == 0){
    cnt2++;
  }
  
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int q=1; q<=16; q++) {
    delay(1000);
  }
  println(cnt);
  println(control);
  println(cnt2);
}

void keyPressed() { // Press a key to save the data
  exit(); // Stop the program
}
