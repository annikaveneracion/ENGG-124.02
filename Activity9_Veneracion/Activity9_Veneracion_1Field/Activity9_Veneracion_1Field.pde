//processing source code for writing the value in variable val to field1 of your
//thingspeak channel

import processing.net.*;

Client c;
int val = 20;
//put your thingspeak write key here
String tskey = "EJK5FXJ67XWJQ6XR";
//https://thingspeak.com/channels/731272
void setup() {
  size(400, 400);
  background(0);
  delay(100);
}

void draw() {
  background(0);
  
  String s;
  s = "Sent ..." + str(val);
  textAlign(CENTER);
  fill(255,20,147);
  textSize(40);
  text(s, width/2, 50);
  
  c = new Client(this, "api.thingspeak.com", 80); // Connect to server on port 80
  //writes val value to your thingspeak channel
  c.write("GET http://" + "api.thingspeak.com/update?api_key=" + tskey + "&field1="+val);
  c.write("\r\n");
  //for free, you can only send (fastest) at 15 sec or more, setting 16 sec interval for writing
  for (int i = 1; i <= 16; i++){     
    delay(1000); 
  }
  
  val= (int) random(25)+10;
  println(val);
}
