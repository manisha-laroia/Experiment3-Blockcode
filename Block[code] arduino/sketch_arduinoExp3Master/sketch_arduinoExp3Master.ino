/*
   DIGF 6037 Creation & Computation
   Kate Hartman & Nick Puckett
   Experiment 3 - Lab 1
   Arduino to Processing - sending value for (3) digital values

   Circuit: 
   switch connected to pin 2 and ground
   switch connected to pin 3 and ground
   switch connected to pin 4 and ground   
*/

int switch2gr;
int switch3bl;
int switch4pink;
int switch5pur;
int switch6fast;

void setup() {
  //start serial connection
  Serial.begin(9600);
  //configure pins as inputs and enable the internal pull-up resistor
  //this helps to simpify the physical circuit
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(13, OUTPUT);

}

void loop() {
  // read the switch value
  switch2gr = digitalRead(2);
  // print out the switch value
  Serial.print(switch2gr);
  // print a comma to separate the values
  Serial.print(",");

  // read the switch value
  switch3bl = digitalRead(3);
  // print out the switch value
  Serial.print(switch3bl);
  // print a comma to separate the values
  Serial.print(",");

  // read the switch value
  switch4pink = digitalRead(4);
  // print out the switch value and add a line break
  Serial.print(switch4pink);
  Serial.print(",");

  switch5pur = digitalRead(5);
  Serial.print(switch5pur);
  Serial.print(",");

  switch6fast = digitalRead(6);
  Serial.println(switch6fast);
  
  delay(100); // the delay is necessary for the serial communication

  // Turn on the built in LED any time any of the switches are activated
  if (switch2gr == LOW || switch3bl == LOW || switch4pink == LOW || switch5pur == LOW || switch6fast == LOW) {
    digitalWrite(13, HIGH);
  } else {
    digitalWrite(13, LOW);
  }
}
