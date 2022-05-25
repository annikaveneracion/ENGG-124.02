const int r = 11;
const int b = 9;
const int g = 6;
char val;

void setup() {
  Serial.begin(9600);
  pinMode(r, OUTPUT);
  pinMode(g, OUTPUT);
  pinMode(b, OUTPUT);

  RGB(255,255,255); // initialize
}

void RGB(int rValue, int gValue, int bValue){
  analogWrite(r, rValue);
  analogWrite(g, gValue);
  analogWrite(b, bValue);
}
     
void loop() {
  while (Serial.available()) {
    val = Serial.read();
  }
  if(val == 'R'){
    RGB(255, 0, 0); //red
    Serial.println("Red");
  } else if(val == 'O'){
    RGB(255, 165, 0); //orange
    Serial.println("Orange");
  } else if(val == 'Y'){
    RGB(255, 255, 0); //yellow
    Serial.println("Yellow");
  } else if(val == 'G'){
    RGB(0, 255, 0); //green
    Serial.println("Green");
  } else if(val == 'B'){
    RGB(0, 0, 255); //blue
    Serial.println("Blue");
  } else if(val == 'I'){
    RGB(75, 0, 130); //indigo
    Serial.println("Indigo");
  } else if(val == 'V'){
    RGB(148, 0, 211); //violet
    Serial.println("Violet");
  }
  delay(10);
}
