
#include <Potentiometer.h>


const int relay1 =  2; 
const int relay2 =  3;
const int relay3 =  4;

int sensorPin = A5;
int sensorValue = 0;  // variable to store the value coming from the sensor
Potentiometer potentiometer = Potentiometer(2); //a Potentiometer at analog in 2

int mode = 0;	// for incoming serial data

int incomingByte = 0;	// for incoming serial data

int random1 = 0;
void setup() {
  Serial.begin(9600);	// opens serial port, sets data rate to 9600 bps

  pinMode(relay1, OUTPUT);      
  pinMode(relay2, OUTPUT);  
  pinMode(relay3, OUTPUT);     
  randomSeed(analogRead(0));

}

void loop(){
  Serial.print("potentiometer.getValue() ");

  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    if (incomingByte == 49){
      mode = 1;
    }
    if (incomingByte == 50){
      mode = 2;
    }
    if (incomingByte == 51){
      mode = 3;
    }
    if (incomingByte == 52){
      mode = 4;
    }
    if (incomingByte == 48){
      mode = 0 ;
    }

    // say what you got:
    Serial.print("Mode: ");
    Serial.println(mode, DEC);
  }
  
  sensorValue = analogRead(sensorPin); 
  Serial.println(sensorValue);  

  if (mode == 1){
    digitalWrite(relay1, HIGH); 
    digitalWrite(relay2, HIGH); 
    digitalWrite(relay3, HIGH); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, LOW); 
    delay(50);
  }
  if (mode == 2){
    digitalWrite(relay1, HIGH); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, LOW); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, HIGH); 
    digitalWrite(relay3, LOW); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, HIGH); 
    delay(50);
  }
  if (mode == 3){
    digitalWrite(relay1, HIGH); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, LOW); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, HIGH); 
    digitalWrite(relay3, LOW); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, HIGH); 
    delay(50);
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, HIGH); 
    delay(50);
    digitalWrite(relay1, LOW); 
    digitalWrite(relay2, HIGH); 
    digitalWrite(relay3, LOW); 
    delay(50);
    digitalWrite(relay1, HIGH); 
    digitalWrite(relay2, LOW); 
    digitalWrite(relay3, LOW); 
  }
  if (mode == 4){
    random1 = random(0, 4);
    Serial.println(random1);

    if (random1 == 0){
      digitalWrite(relay1, LOW); 
      digitalWrite(relay2, LOW); 
      digitalWrite(relay3, LOW);  
      delay(100);
    }
    
    if (random1 == 1){
      digitalWrite(relay1, HIGH); 
      digitalWrite(relay2, LOW); 
      digitalWrite(relay3, LOW);  
      delay(100);
    }
    if (random1 == 2){
      digitalWrite(relay1, LOW); 
      digitalWrite(relay2, HIGH); 
      digitalWrite(relay3, LOW);  
      delay(100);
    }
    if (random1 == 3){
      digitalWrite(relay1, LOW); 
      digitalWrite(relay2, LOW); 
      digitalWrite(relay3, HIGH);  
      delay(100);
    }

  } 



}






