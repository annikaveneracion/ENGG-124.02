int go1 = 1;
int go2 = 1;
int go3 = 1;
int go4 = 1;
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 93;   // Diameter of circle
color rectColor, circleColor, triColor, triColor2, baseColor;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
boolean triOver = false;
boolean triOver2 = false;

int x1 = 70;      // three points of the triangle 1
int y1 = 345;
int x2 = 126;
int y2 = 235;
int x3 = 182;
int y3 = 345;

int a1 = 70+340;      // three points of the triangle 2
int b1 = 345;
int a2 = 126+340;
int b2 = 235;
int a3 = 182+340;
int b3 = 345;


void setup() {
  size(600, 600);
  rectColor = color(225, 221, 143);
  circleColor = color(224, 119, 125);
  triColor = color(150, 127, 147);
  triColor2 = color(76, 134, 168);
  baseColor = color(255);
  currentColor = baseColor;
  circleX = width/2+circleSize/2+10;
  circleY = height/2;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  if (rectOver) {
    fill(0);
    if (mousePressed) {
      if (go1 == 1) {
        println("rectangular button is pressed");
      }
      go1 = 0;
      print(".");
    }
  } else {
    fill(rectColor);
    if (go1 == 0) {
      println();
    }
    go1 = 1;
  }
  rect(rectX, rectY, rectSize, rectSize);
  
  if (circleOver) {
    fill(0);
    if (mousePressed) {
      if (go2 == 1) {
        println("circular button is pressed");
      }
      go2 = 0;
      print(".");
    }
  } else {
    fill(circleColor);
    if (go2 == 0) {
      println();
    }
    go2 = 1;
  }
  ellipse(circleX, circleY, circleSize, circleSize);
  
  if (triOver) {
    fill(0);
     if (mousePressed) {
      if (go3 == 1) {
        println("triangular button 1 is pressed");
      }
      go3 = 0;
      print(".");
    }
  } else {
    fill(triColor);
    if (go3 == 0) {
      println();
    }
    go3 = 1;
  }
  triangle(x1,y1, x2,y2, x3,y3);
  
  if (triOver2) {
    fill(0);
    if (mousePressed) {
      if (go4 == 1) {
        println("triangular button 2 is pressed");
      }
      go4 = 0;
      print(".");
    }
  } else {
    fill(triColor2);
    if (go4 == 0) {
      println();
    }
    go4 = 1;
  }
  triangle(a1,b1, a2,b2, a3,b3);
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
    triOver = false;
    triOver2 = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
    triOver = false;
    triOver2 = false;
  } else if ( overTriangle(x1, y1, x2, y2, x3, y3) ) {
    triOver = true;
    rectOver = false;
    circleOver = false;
    triOver2 = false;
  } else if ( overTriangle2(a1, b1, a2, b2, a3, b3) ) {
    triOver2 = true;
    triOver = false;
    rectOver = false;
    circleOver = false;
  } else {
    circleOver = rectOver = triOver = triOver2 = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
  }
  if (rectOver) {
    currentColor = rectColor;
  }
  if(triOver) {
    currentColor = triColor;
  }
  if(triOver2) {
    currentColor = triColor2;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
  int triarea = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );
  int area1 =    abs( (x1-mouseX)*(y2-mouseY) - (x2-mouseX)*(y1-mouseY) );
  int area2 =    abs( (x2-mouseX)*(y3-mouseY) - (x3-mouseX)*(y2-mouseY) );
  int area3 =    abs( (x3-mouseX)*(y1-mouseY) - (x1-mouseX)*(y3-mouseY) );
  if (area1+area2+area3 == triarea) {
    return true;
  } else {
    return false;
  }
}

boolean overTriangle2(int a1, int b1, int a2, int b2, int a3, int b3) {
  int triarea2 = abs( (a2-a1)*(b3-b1) - (a3-a1)*(b2-b1) );
  int area1 =    abs( (a1-mouseX)*(b2-mouseY) - (a2-mouseX)*(b1-mouseY) );
  int area2 =    abs( (a2-mouseX)*(b3-mouseY) - (a3-mouseX)*(b2-mouseY) );
  int area3 =    abs( (a3-mouseX)*(b1-mouseY) - (a1-mouseX)*(b3-mouseY) );
  if (area1+area2+area3 == triarea2) {
    return true;
  } else {
    return false;
  }
}
