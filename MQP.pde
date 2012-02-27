import guicomponents.*;
import processing.opengl.*;
import saito.objloader.*;
import netscape.javascript.*;

PApplet master = this;
float rotX, rotY;
tetrahedron demo;

boolean locked = false;

//Preset Colors
color RED = color(256, 0, 0);
color GREEN = color(0, 256, 0);
color BLUE = color (0, 0, 256);
color WHITE = color (0,0,0);
color PURPLE = color(256, 0, 256);
color YELLOW = color(256, 256, 0);
color ORANGE = color(256, 100, 0);
color AQUA = color(0, 100, 100);

class tetrahedron{
  int neighbors;
  boolean face1_status = false; //off
 boolean face2_status = false;
 boolean face3_status = false;
 boolean face4_status = false;
 color face1_color = WHITE;
 color face2_color = WHITE;
 color face3_color;
 color face4_color = PURPLE;
 OBJModel tetraBase;
 OBJModel face1_1;
 OBJModel face1_2;
 OBJModel face1_3;
 OBJModel face1_4;
 int ICSP = 1;
   int LED1R = 2;
   int LED1G = 3;
   int LED1B = 4;
   int pushButtonSwitch = 5;
   int LED2R = 6;
   int VCC = 7;
   int ground = 8;
   int LED2G = 9;
   int LED2B = 10;
   int LED3R = 11;
   int LED3G = 12;
   int LED3B = 13;
   int LED4R = 14;
   
   int I2C1 = 28;
   int I2C2 = 27;
   int Edge3Comm = 26;
   int Edge2Comm = 25;
   int Edge1Comm = 24;
   int Expansion = 23;
   int ground2 = 22;
   int expansionPin = 21;
   int AVCC = 20;
   int ICSP1 = 19;
   int ICSP2 = 18;
   int ICSP3 = 17;
   int LED4B = 16;
   int LED4G = 15;
   
   
//constructor
tetrahedron(){
  neighbors = 3;
  boolean face1_status = false; //off
  boolean face2_status = false;
  boolean face3_status = false;
  boolean face4_status = false;
  color face1_color;
  color face2_color;
  color face3_color; 
  color face4_color;
  
  OBJModel tetraBase = new OBJModel(master, "tetraBase.obj", "relative", POLYGON);
  //OBJModel face1_1 = new OBJModel(master, "tetraFace1_1.obj", "relative", POLYGON);
  //OBJModel face1_2 = new OBJModel(master, "tetraFace1_2.obj", "relative", POLYGON);
  //OBJModel face1_3 = new OBJModel(master, "tetraFace1_3.obj", "relative", POLYGON);
  //OBJModel face1_4 = new OBJModel(master, "tetraFace1_4.obj", "relative", POLYGON);
   
   tetraBase.enableDebug();
   tetraBase.enableTexture();
   tetraBase.scale(75);
   
  // face1_1.enableDebug();
   //face1_1.enableTexture();
   //face1_1.scale(75);
   
  // face1_2.enableDebug();
  // face1_2.enableTexture();
  // face1_2.scale(75);
   
  // face1_3.enableDebug();
  // face1_3.enableTexture();
  // face1_3.scale(75);
   
  // face1_4.enableDebug();
  // face1_4.enableTexture();
  // face1_4.scale(75);
}
}

void setup(){
  size(1240,980,OPENGL);
  demo = new tetrahedron();
}
void draw(){
    background(256);
    lights();
    translate(width/2, height/2, 0);
    rotateX(rotY);
    rotateY(rotX);

    demo.tetraBase.draw();
    //demo.face1_1.draw();
    //demo.face1_2.draw();
    //demo.face1_3.draw();
    //demo.face1_4.draw();
}

void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}

void keyPressed()
{
  println(key);
  switch(key){
  //
  }
}


