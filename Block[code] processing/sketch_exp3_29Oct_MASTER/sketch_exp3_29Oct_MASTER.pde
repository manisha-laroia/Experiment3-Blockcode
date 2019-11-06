/* https://natureofcode.com/book/chapter-1-vectors/ 
 * Daniel Shiffman, Nature of Code
 * Example 1.2: Bouncing ball with PVectors! */

/*
   DIGF 6037 Creation & Computation
 Kate Hartman & Nick Puckett
 Experiment 3 - Lab 1
 Arduino to Processing - sending value for (3) digital values
 
 Based on based on this Lab on the ITP Physical Computing site: 
 https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 */

PVector location, location1, location2, location3, location4, location5, location6, location7, location8, location9, location10; 
PVector velocity, velocity1, velocity2, velocity3, velocity4, velocity5, velocity6, velocity7, velocity8, velocity9, velocity10;
PVector acceleration;

import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port
int switch1;
int switch2;
int switch3;
int switch4;
int switch5;

void setup() {
  fullScreen();

  // List all the available serial ports in the console
  printArray(Serial.list());

  // Change the 6 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');


location = new PVector(0, 0);
velocity = new PVector(0.5, 0.8);

location1 = new PVector(0, 200);
velocity1 = new PVector(0.5, 0.8);

location2 = new PVector(0, 300);
velocity2 = new PVector(0.5, 0.8);

location3 = new PVector(0, 0);
velocity3 = new PVector(0.5, 0.8);

location4 = new PVector(0, 800);
velocity4 = new PVector(1, 2);

location5 = new PVector(0, 500);
velocity5 = new PVector(1, 2);

location6 = new PVector(0, 400);
velocity6 = new PVector(1, 2);

location7 = new PVector(0, 600);
velocity7 = new PVector(1, 2);

location8 = new PVector(0, 0);
velocity8 = new PVector(1, 2);

acceleration = new PVector(0, 0.1);

frameRate(200);
}

void draw() {

  background(0);
  
  if ((switch1==1) && (switch2==1) && (switch3==1) && (switch4==1) && (switch5==1)){
    idle();
    idle1();
    idle2();
    idle3();
  }  
    
  
  //turning on green strip
   if (switch1==0) {
    rectgr();
  } 

// turning on blue strip
  if (switch2==0) {
     rectbl();
  } 

//turning on pink strip
  if (switch3==0) {
    rectpink();
  }

//turning on purple strip  
  if (switch4==0) {
    rectpur();
  }
  
  //turning on speed
  if (switch5==0) {
     fast();
  } 


  location.add(velocity); 
  location1.add(velocity1);
  location2.add(velocity2);
  location3.add(velocity3);
  location4.add(velocity4);
  location5.add(velocity5);
  location6.add(velocity6);
  location7.add(velocity7);
  location8.add(velocity8);

  //We still sometimes need to refer to the individual components of a PVector and can do so using the dot syntax: location.x, velocity.y, etc.


  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  if ((location1.y > height) || (location1.y < 0)) {
    velocity1.y = velocity1.y * -1;
  }

  if  ((location2.y > height) || (location2.y < 0)) {
    velocity2.y = velocity2.y * -1;
  }

  if  ((location3.y > height) || (location3.y < 0)) {
    velocity3.y = velocity3.y * -1;
  }

  if  ((location4.y > height) || (location4.y < 0)) {
    velocity4.y = velocity4.y * -1;
  }

  if  ((location5.y > height) || (location5.y < 0)) {
    velocity5.y = velocity5.y * -1;
  }

  if  ((location6.y > height) || (location6.y < 0)) {
    velocity6.y = velocity6.y * -1;
  }

  if  ((location7.y > height) || (location7.y < 0)) {
    velocity7.y = velocity7.y * -1;
  }

  if  ((location8.y > height) || (location8.y < 0)) {
    velocity8.y = velocity8.y * -1;
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////

void rectgr() {

  int x = int(random(0, width/10));
  int y = int(random(0, height/10));

  noStroke();                                      
  fill(198, 255, 20); //g1                           // green bars for x = 200
  rect(200, 10*y, 80, 10);


  fill(96, 255, 0);  //g2
  rect(200, location2.y, 80, 20);
  rect(200, location7.y, 80, 10);
  rect(200, location4.y, 80, 20);
  rect(200, location3.y, 80, 10);
  rect(200, 10*y, 80, 120);


  fill(0, 255, 114);  //g3
  rect(200, location.y+ 600, 80, 10);
  rect(200, location6.y+ 600, 80, 20);
  rect(200, location1.y+ 600, 80, 10);
  rect(200, location8.y+ 600, 80, 20);
  rect(200, 10*y, 80, 30);

  fill(198, 255, 20); //g1                           // green bars for x = 600
  rect(600, 10*y, 80, 10);


  fill(96, 255, 0);  //g2
  rect(600, location4.y, 80, 20);
  rect(600, location3.y, 80, 10);
  rect(600, location7.y, 80, 20);
  rect(600, location2.y, 80, 10);
  rect(600, 10*y, 80, 120);


  fill(0, 255, 114);  //g3
  rect(600, location.y+ 600, 80, 10);
  rect(600, location1.y+ 600, 80, 20);
  rect(600, location6.y+ 600, 80, 10);
  rect(600, location8.y+ 600, 80, 20);
  rect(600, 10*y, 80, 30);

  fill(198, 255, 20); //g1                           // green bars for x = 1000
  rect(1000, 10*y, 80, 10);


  fill(96, 255, 0);  //g2
  rect(1000, location2.y, 80, 20);
  rect(1000, location3.y, 80, 10);
  rect(1000, location4.y, 80, 20);
  rect(1000, location7.y, 80, 10);
  rect(1000, 10*y, 80, 120);


  fill(0, 255, 114);  //g3
  rect(1000, location.y+ 600, 80, 10);
  rect(1000, location1.y+ 600, 80, 20);
  rect(1000, location6.y+ 600, 80, 10);
  rect(1000, location8.y+ 600, 80, 20);
  rect(1000, 10*y, 80, 30);
}

//////////////////////////////////////////////////////////////////////////////////////////////

void rectbl() {

  int x = int(random(0, width/10));
  int y = int(random(0, height/10));

  location.add(velocity);

  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  noStroke();                                      
  fill(0, 255, 228); //g1                           // blue bars for x = 100
  rect(100, 10*y, 80, 10);

  fill(108, 250, 255);  //g2
  rect(100, location2.y, 80, 20);
  rect(100, location3.y, 80, 10);
  rect(100, location4.y, 80, 20);
  rect(100, location7.y, 80, 10);
  rect(100, 10*y, 80, 120);

  fill(0, 162, 255);  //g3
  rect(100, location.y+ 600, 80, 10);
  rect(100, location1.y+ 600, 80, 20);
  rect(100, location6.y+ 600, 80, 10);
  rect(100, location8.y+ 600, 80, 20);
  rect(100, 10*y, 80, 30);


  fill(0, 255, 228); //g1                           // blue bars for x = 400
  rect(400, 10*y, 80, 10);

  fill(108, 250, 255);  //g2
  rect(400, location2.y, 80, 20);
  rect(400, location3.y, 80, 10);
  rect(400, location4.y, 80, 20);
  rect(400, location7.y, 80, 10);
  rect(400, 10*y, 80, 120);


  fill(0, 162, 255);  //g3
  rect(400, location.y+ 600, 80, 10);
  rect(400, location1.y+ 600, 80, 20);
  rect(400, location6.y+ 600, 80, 10);
  rect(400, location8.y+ 600, 80, 20);
  rect(400, 10*y, 80, 30);

  fill(0, 255, 228); //g1                           // blue bars for x = 800
  rect(800, 10*y, 80, 10);


  fill(108, 250, 255);  //g2
  rect(800, location2.y, 80, 20);
  rect(800, location3.y, 80, 10);
  rect(800, location4.y, 80, 20);
  rect(800, location7.y, 80, 10);
  rect(800, 10*y, 80, 120);


  fill(0, 162, 255);  //g3
  rect(800, location.y+ 600, 80, 10);
  rect(800, location1.y+ 600, 80, 20);
  rect(800, location6.y+ 600, 80, 10);
  rect(800, location8.y+ 600, 80, 20);
  rect(800, 10*y, 80, 30);
}

//////////////////////////////////////////////////////////////////////////////////////////////

void rectpink() {

  int x = int(random(0, width/10));
  int y = int(random(0, height/10));

  location.add(velocity);

  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  noStroke();                                      
  fill(255, 0, 234); //g1                           // pink bars for x = 300
  rect(300, 10*y, 80, 10);

  fill(255, 0, 153);  //g2
  rect(300, location2.y, 80, 20);
  rect(300, location3.y, 80, 10);
  rect(300, location4.y, 80, 20);
  rect(300, location7.y, 80, 10);
  rect(300, 10*y, 80, 120);

  fill(255, 102, 204);  //g3
  rect(300, location.y+ 600, 80, 10);
  rect(300, location1.y+ 600, 80, 20);
  rect(300, location6.y+ 600, 80, 10);
  rect(300, location8.y+ 600, 80, 20);
  rect(300, 10*y, 80, 30);


  fill(255, 0, 234); //g1                           // pink bars for x = 700
  rect(700, 10*y, 80, 10);

  fill(255, 0, 153);  //g2
  rect(700, location2.y, 80, 20);
  rect(700, location3.y, 80, 10);
  rect(700, location4.y, 80, 20);
  rect(700, location7.y, 80, 10);
  rect(700, 10*y, 80, 120);


  fill(255, 102, 204);  //g3
  rect(700, location.y+ 600, 80, 10);
  rect(700, location1.y+ 600, 80, 20);
  rect(700, location6.y+ 600, 80, 10);
  rect(700, location8.y+ 600, 80, 20);
  rect(700, 10*y, 80, 30);

  fill(255, 0, 234); //g1                           // pink bars for x = 1100
  rect(1100, 10*y, 80, 10);


  fill(255, 0, 153);  //g2
  rect(1100, location2.y, 80, 20);
  rect(1100, location3.y, 80, 10);
  rect(1100, location4.y, 80, 20);
  rect(1100, location7.y, 80, 10);
  rect(1100, 10*y, 80, 120);


  fill(255, 102, 204);  //g3
  rect(1100, location.y+ 600, 80, 10);
  rect(1100, location1.y+ 600, 80, 20);
  rect(1100, location6.y+ 600, 80, 10);
  rect(1100, location8.y+ 600, 80, 20);
  rect(1100, 10*y, 80, 30);
}

//////////////////////////////////////////////////////////////////////////////////////////////

void rectpur() {

  int x = int(random(0, width/10));
  int y = int(random(0, height/10));

  location.add(velocity);

  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  noStroke();                                      
  fill(222, 0, 255); //g1                           // purple bars for x = 500
  rect(500, 10*y, 80, 10);

  fill(232, 97, 252);  //g2
  rect(500, location2.y, 80, 20);
  rect(500, location3.y, 80, 10);
  rect(500, location4.y, 80, 20);
  rect(500, location7.y, 80, 10);
  rect(500, 10*y, 80, 120);

  fill(240, 143, 255);  //g3
  rect(500, location.y+ 600, 80, 10);
  rect(500, location1.y+ 600, 80, 20);
  rect(500, location6.y+ 600, 80, 10);
  rect(500, location8.y+ 600, 80, 20);
  rect(500, 10*y, 80, 30);


  fill(222, 0, 255); //g1                           // purple bars for x = 900
  rect(900, 10*y, 80, 10);

  fill(232, 97, 252);  //g2
  rect(900, location2.y, 80, 20);
  rect(900, location3.y, 80, 10);
  rect(900, location4.y, 80, 20);
  rect(900, location7.y, 80, 10);
  rect(900, 10*y, 80, 120);

  fill(240, 143, 255);  //g3
  rect(900, location.y+ 600, 80, 10);
  rect(900, location1.y+ 600, 80, 20);
  rect(900, location6.y+ 600, 80, 10);
  rect(900, location8.y+ 600, 80, 20);
  rect(900, 10*y, 80, 30);

  fill(222, 0, 255); //g1                           // purple bars for x = 1200
  rect(1200, 10*y, 80, 10);

  fill(232, 97, 252);  //g2
  rect(1200, location2.y, 80, 20);
  rect(1200, location3.y, 80, 10);
  rect(1200, location4.y, 80, 20);
  rect(1200, location7.y, 80, 10);
  rect(1200, 10*y, 80, 120);

  fill(240, 143, 255);  //g3
  rect(1200, location.y+ 600, 80, 10);
  rect(1200, location1.y+ 600, 80, 20);
  rect(1200, location6.y+ 600, 80, 10);
  rect(1200, location8.y+ 600, 80, 20);
  rect(1200, 10*y, 80, 30);
}

void idle() {
  int x = int(random(0, width/10));
  int y = int(random(0, height/10));
  noStroke();
  fill(0, 255, 114);
  rect(10*x, 10*y, 80, 10);
}

void idle1() {
  int x = int(random(0, width/10));
  int y = int(random(0, height/10));
  noStroke();  
  fill(108, 250, 255);
  rect(10*x, 10*y, 80, 10);
}

void idle2() {
  int x = int(random(0, width/10));
  int y = int(random(0, height/10));
  noStroke();  
  fill(255, 0, 153);
  rect(10*x, 10*y, 80, 10);
}


void idle3() {
  int x = int(random(0, width/10));
  int y = int(random(0, height/10));
  noStroke();
  fill(222, 0, 255);
  rect(10*x, 10*y, 80, 10);
}

void fast() {
  velocity.add(acceleration);
  velocity1.add(acceleration);
  velocity2.add(acceleration);
  velocity3.add(acceleration);
  velocity4.add(acceleration);
  velocity5.add(acceleration);
  velocity6.add(acceleration);
  velocity7.add(acceleration);
  velocity8.add(acceleration);
}

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    // println(myString);
    myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    // add a linefeed at the end:
    println();
    switch1 = sensors[0];  
    switch2 = sensors[1]; 
    switch3 = sensors[2];
    switch4 = sensors[3];
    switch5 = sensors[4];
  }
}
