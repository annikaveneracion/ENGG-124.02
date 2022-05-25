//============ Activity 6 - Veneracion =============//

import processing.serial.*;

Serial myPort;
int val;

int rectSize = 90;     // Diameter of rect
int rectX1, rectY1, rectX2, rectY2, rectX3, rectY3, rectX4, rectY4, rectX5, rectY5, rectX6, rectY6, rectX7, rectY7;
color rectColor1, rectColor2, rectColor3, rectColor4, rectColor5, rectColor6, rectColor7;
boolean rectOver1, rectOver2, rectOver3, rectOver4, rectOver5, rectOver6, rectOver7 = false;

void setup() 
{
  size(500, 500);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
  rectColor1 = color(225, 0, 0); //r
  rectColor2 = color(255, 165, 0); //o
  rectColor3 = color(255, 255, 0); //y
  rectColor4 = color(0, 255, 0); //g
  rectColor5 = color(0, 0, 255); //b
  rectColor6 = color(75, 0, 130); //i
  rectColor7 = color(148, 0, 211); //v
  
  rectX1 = rectX4 = 100;
  rectX2 = rectX5 = rectX7 = 200;
  rectX3 = rectX6 = 300;
  rectY1 = rectY2 = rectY3 = 100;
  rectY4 = rectY5 = rectY6 = 200;
  rectY7 = 300;
}

void draw() {
  update(mouseX, mouseY);
  background(255);
  
  if (rectOver1 == true) {
    fill(204);
    if(mousePressed) {
      myPort.write('R'); 
      println("R");
    }
  } else {
    fill(rectColor1);
  }
  rect(rectX1, rectY1, rectSize, rectSize);
  
  if (rectOver2 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('O');
      println("O");
    }
  } else {
    fill(rectColor2);
  }
  rect(rectX2, rectY2, rectSize, rectSize);
  
  if (rectOver3 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('Y'); 
      println("Y");
    }
  } else {
    fill(rectColor3);
  }
  rect(rectX3, rectY3, rectSize, rectSize);
  
  if (rectOver4 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('G'); 
      println("G");
    }
  } else {
    fill(rectColor4);  
  }
  rect(rectX4, rectY4, rectSize, rectSize);
  
  if (rectOver5 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('B'); 
      println("B");
    }
  } else {
    fill(rectColor5);
  }
  rect(rectX5, rectY5, rectSize, rectSize);
  
  if (rectOver6 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('I'); 
      println("I");
    }
  } else {
    fill(rectColor6);
  }
  rect(rectX6, rectY6, rectSize, rectSize);
  
  if (rectOver7 == true) {
    fill(204); 
    if (mousePressed) {
      myPort.write('V'); 
      println("V");
    }
  } else {
    fill(rectColor7);
  }
  rect(rectX7, rectY7, rectSize, rectSize);
}

void update(int x, int y) {
  if ( overRect1(rectX1, rectY1, rectSize, rectSize) ) {
    rectOver1 = true;
    rectOver2 = false;
    rectOver3 = false;
    rectOver4 = false;
    rectOver5 = false;
    rectOver6 = false;
    rectOver7 = false;
  } else if ( overRect2(rectX2, rectY2, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = true;
    rectOver3 = false;
    rectOver4 = false;
    rectOver5 = false;
    rectOver6 = false;
    rectOver7 = false;
  } else if ( overRect3(rectX3, rectY3, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = false;
    rectOver3 = true;
    rectOver4 = false;
    rectOver5 = false;
    rectOver6 = false;
    rectOver7 = false;
  } else if ( overRect4(rectX4, rectY4, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = false;
    rectOver3 = false;
    rectOver4 = true;
    rectOver5 = false;
    rectOver6 = false;
    rectOver7 = false;
  } else if ( overRect5(rectX5, rectY5, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = false;
    rectOver3 = false;
    rectOver4 = false;
    rectOver5 = true;
    rectOver6 = false;
    rectOver7 = false; 
  } else if ( overRect6(rectX6, rectY6, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = false;
    rectOver3 = false;
    rectOver4 = false;
    rectOver5 = false;
    rectOver6 = true;
    rectOver7 = false; 
  } else if ( overRect7(rectX7, rectY7, rectSize, rectSize) ) {
    rectOver1 = false;
    rectOver2 = false;
    rectOver3 = false;
    rectOver4 = false;
    rectOver5 = false;
    rectOver6 = false;
    rectOver7 = true; 
  } else {
    rectOver1 = rectOver2 = rectOver3 = rectOver4 = rectOver5 = rectOver6 = rectOver7 = false; 
  }
}

boolean overRect1(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect2(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect3(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect4(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect5(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect6(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRect7(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
