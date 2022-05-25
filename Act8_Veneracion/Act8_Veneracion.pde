import processing.serial.*;

Serial myPort;
int val;
PImage backImg, birdImg, wallImg, startImg;
int cmo = -12;
int cmox = 1;
int gdelay = 50;
int gamestate = 1, score = 0, highScore = 0, x = -200, y, vy = 0;
int wx[] = new int[2], wy[] = new int[2];
boolean touch = false;

void setup() {
  size(600,800);
  fill(0);
  textSize(30);  
  birdImg =loadImage("mango1.png");
  backImg =loadImage("beach1.jpeg");
  wallImg =loadImage("wall.png");
  startImg=loadImage("startpage.jpg");
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() { //runs 60 times a second
if (myPort.available() > 0) {
  val = myPort.read();
}
  if(val == 1){
    touch = true;
    sensor();
  } else {
    touch = false;
  }
  if(gamestate == 0) {
    delay(gdelay);
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x+backImg.width, 0);
    x -= cmox; //6
    vy += 1;
    y += vy;
    
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(wallImg, wx[i], wy[i] - (wallImg.height/2+100));
      image(wallImg, wx[i], wy[i] + (wallImg.height/2+100));
      if(wx[i] < 0) {
        wy[i] = (int)random(200,height-200);
        wx[i] = width;
      }
      if(wx[i] == width/2) {
        highScore = max(++score, highScore);
      }
      if(y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) 
        gamestate=1;
      
      wx[i] -= 6;
    }
    image(birdImg, width/2, y);
    
    textAlign(CENTER);
    text(""+score, width/2, 300);
  }
  else {
    imageMode(CENTER);
    image(startImg, width/2,height/2);
    
    textAlign(CENTER);
    text("High Score: "+highScore, width/2, 300);
  }
}

void sensor() {
  vy = cmo; //-16
  if(gamestate==1 && touch == true) {
    wx[0] = 600;
    wy[0] = y = height/3;
    wx[1] = 900;
    wy[1] = 600;
    x = gamestate = score = 0;
    cmo = -16; 
  }
}
