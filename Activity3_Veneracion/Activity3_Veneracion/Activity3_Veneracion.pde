int circleX1, circleY1, circleX2, circleY2;  // Position of circle buttons
int circleSize = 100;   // Diameter of circle
color circleColor1, circleColor2;
boolean circleOver1 = false;
boolean circleOver2 = false;
boolean out = false;
int print;
PrintWriter output;

void setup() 
{
  size(400, 400);
  circleColor1 = color(225, 221, 143);
  circleColor2 = color(224, 119, 125);
  circleX1 = (width-300)/2+circleSize/2+10;
  circleY1 = height/2;
  circleX2 = (width+100)/2+circleSize/2+10;
  circleY2 = height/2;
  ellipseMode(CENTER);
 
  output = createWriter("data.txt");
  frameRate(12);
}

void draw() 
{
  update(mouseX, mouseY);
  
  fill(circleColor1);
  ellipse(circleX1, circleY1, circleSize, circleSize);
  textAlign(CENTER);
  fill(0);
  textSize(30);
  text("START", circleX1, circleY1+10);
  
  fill(circleColor2);
  ellipse(circleX2, circleY2, circleSize, circleSize);
  textAlign(CENTER);
  fill(0);
  textSize(30);
  text("STOP", circleX2, circleY2+10);

  
  if (mouseButton==LEFT && circleOver1==false && mousePressed==true && out==true) {
    ellipse(mouseX, mouseY, 5, 5);
    point(mouseX, mouseY);
    output.println("(" + mouseX + ", " + mouseY + ")");
    println("(" + mouseX + ", " + mouseY + ")");
  } else if (out==false && print==1) {
    out = false;
    keyPressed();
  }

}

void mousePressed() {
  if (circleOver1) {
   out = true;
   print = 1;
   circleOver1=false;
   } circleOver1=true;
   if (circleOver2) {
     out = false;
     print = 0;
     keyPressed();
     circleOver1 = false;
   }
}

void keyPressed() {
  output.flush(); 
  output.close();
  exit();
}

void update(int x, int y) {
  if ( overCircle1(circleX1, circleY1, circleSize) ) {
    circleOver1 = true;
    circleOver2 = false;
  } else if ( overCircle2(circleX2, circleY2, circleSize) ) {
    circleOver1 = false;
    circleOver2 = true;
  } else {
    circleOver1 = circleOver2 = false;
  }
}

boolean overCircle1(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle2(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
