int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int go = 1;


void setup() {
  size(640, 360);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(238, 38, 82);
  
  // Draw the clock background
  fill(255);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(45, 45, 150);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  
  if (mouseOverCircle() == true) {
    background(45, 45, 150);
    fill(238, 38, 82); // change color
  }
  else {                        
    fill(45, 45, 150);
  }
  circle(60, 70, 100);
}

void mousePressed() {
  noLoop();
  fill(255);
  textSize(20);
  text("LetLeniLead", 30, 340);
  text("LetLeniLead", 510, 40);
}

void mouseReleased() {
  loop();
}

void keyPressed() {
  println(key);
}

boolean mouseOverCircle() {
  return ((mouseX >= 10) && (mouseX <= 100) && (mouseY >= 20) && (mouseY <= 100));
}
