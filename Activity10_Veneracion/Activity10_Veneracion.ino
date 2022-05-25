int touch = 7;
int echoPin = 2; // attach pin D2 Arduino to pin Echo of HC-SR04
int trigPin = 3; //attach pin D3 Arduino to pin Trig of HC-SR04
long duration; 
int distance, distanceAve = 0;
int state, stateAve = 0; 

unsigned int count;


void setup() {
  Serial.begin(9600);
  pinMode(touch, INPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  state = state + digitalRead(touch);
  
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = distance + duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)

  count++;

  delay(1000);


  if (count = 15){
    stateAve = state / 15;
    distanceAve = distance / 15;

    if(stateAve == LOW) {
      Serial.write(1);
    } else {
      Serial.write(0);
    }
    
  Serial.write(distanceAve);
  }
}
