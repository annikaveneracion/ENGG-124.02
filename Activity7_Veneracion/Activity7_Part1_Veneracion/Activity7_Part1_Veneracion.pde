/*
 * Oscilloscope
*/
import processing.serial.*;

Serial port;  // Create object from Serial class
int xVal, yVal;
int xValLow, xValHigh, yValLow, yValHigh;
int[] xValues, yValues;
PrintWriter output;

void setup() 
{
  size(480, 480);
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[1], 9600);
  xValues = new int[width];
  yValues = new int[width];
  smooth();
  output = createWriter("data.txt");
}

int getY1(int xVal) {
  return (int)(xVal / 1023.0f * height) - 1;
}


int getY2(int yVal) {
  return (int)(yVal / 1023.0f * height) - 1;
}
  
void drawGrid() {
    stroke(150, 150, 0);
    line(0, height/5, width, height/5);
    line(0, height*2/5, width, height*2/5);
    line(0, height*3/5, width, height*3/5);
    line(0, height*4/5, width, height*4/5);
    stroke(150, 150, 150);
    line(0, height/10, width, height/10);
    line(0, height*3/10, width, height*3/10);
    line(0, height*5/10, width, height*5/10);
    line(0, height*7/10, width, height*7/10);
    line(0, height*9/10, width, height*9/10);
}

void draw()
{
  while (port.available() > 0) {
    
      xValLow = port.read();
      xValHigh = port.read();
      yValLow = port.read();
      yValHigh = port.read();
      
  }
  xVal = (xValHigh << 8) + xValLow;
  yVal = (yValHigh << 8) + yValLow;
  
  for (int i=0; i<width-1; i++) {
    xValues[i] = xValues[i+1];
    yValues[i] = yValues[i+1];
  }
  xValues[width-1] = xVal;
  yValues[width-1] = yVal;
  
  background(0);
  drawGrid();
    for (int x=1; x<width; x++) {
      stroke(255,0,0);
      line(width-x,   height-1-getY2(yValues[x-1]), 
           width-1-x, height-1-getY2(yValues[x]));
      stroke(0,255,0);
      line(width-x,   height-1-getY1(xValues[x-1]), 
           width-1-x, height-1-getY1(xValues[x]));
    }
    output.println((millis()/1000) + "s (" + millis() + "ms): " + xVal + ", " + yVal);
    println((millis()/1000) + "s (" + millis() + "ms): " + xVal + ", " + yVal);
    if (keyPressed || mousePressed) {
      output.flush(); 
      output.close();
      exit();
  }
  
}
