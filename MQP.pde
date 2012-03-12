import guicomponents.*;
import processing.opengl.*;
import saito.objloader.*;
import netscape.javascript.*;
int windowWidth = 1240;
int windowHeight = 700;

PApplet master = this;
float rotX, rotY;
tetrahedron demo;
int numSided = 4;
GImageButton[] modButtons = new GImageButton[numSided];
VScrollbar vs;
HScrollbar hs;

String[] files;

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
 boolean face1_1status = false; //off
 boolean face2_1status = false;
 boolean face3_1status = false;
 boolean face4_1status = false;
 color face1_1color = WHITE;
 color face2_1color = WHITE;
 color face3_1color;
 color face4_1color = PURPLE;
 
 boolean face1_2status = false; //off
 boolean face2_2status = false;
 boolean face3_2status = false;
 boolean face4_2status = false;
 color face1_2color = WHITE;
 color face2_2color = WHITE;
 color face3_2color;
 color face4_2color = PURPLE;
 
 boolean face1_3status = false; //off
 boolean face2_3status = false;
 boolean face3_3status = false;
 boolean face4_3status = false;
 color face1_3color = WHITE;
 color face2_3color = WHITE;
 color face3_3color;
 color face4_3color = PURPLE;
 
 boolean face1_4status = false; //off
 boolean face2_4status = false;
 boolean face3_4status = false;
 boolean face4_4status = false;
 color face1_4color = WHITE;
 color face2_4color = WHITE;
 color face3_4color;
 color face4_4color = PURPLE;
//OBJModel tetraBase;
 //OBJModel face1_1;
 //OBJModel face1_2;
 //OBJModel face1_3;
 //OBJModel face1_4;
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
   OBJModel tetraBase = new OBJModel(master, "tetraBase.obj", "relative", POLYGON);
   OBJModel face1_1 = new OBJModel(master, "tetraFace1_1.obj", "relative", POLYGON);
   OBJModel face1_2 = new OBJModel(master, "tetraFace1_2.obj", "relative", POLYGON);
   OBJModel face1_3 = new OBJModel(master, "tetraFace1_3.obj", "relative", POLYGON);
   OBJModel face1_4 = new OBJModel(master, "tetraFace1_4.obj", "relative", POLYGON); 
   
   OBJModel face2_1 = new OBJModel(master, "tetraFace2_1.obj", "relative", POLYGON);
   OBJModel face2_2 = new OBJModel(master, "tetraFace2_2.obj", "relative", POLYGON);
   OBJModel face2_3 = new OBJModel(master, "tetraFace2_3.obj", "relative", POLYGON);
   OBJModel face2_4 = new OBJModel(master, "tetraFace2_4.obj", "relative", POLYGON); 

   OBJModel face3_1 = new OBJModel(master, "tetraFace3_1.obj", "relative", POLYGON);
   OBJModel face3_2 = new OBJModel(master, "tetraFace3_2.obj", "relative", POLYGON);
   OBJModel face3_3 = new OBJModel(master, "tetraFace3_3.obj", "relative", POLYGON);
   OBJModel face3_4 = new OBJModel(master, "tetraFace3_4.obj", "relative", POLYGON); 

   OBJModel face4_1 = new OBJModel(master, "tetraFace4_1.obj", "relative", POLYGON);
   OBJModel face4_2 = new OBJModel(master, "tetraFace4_2.obj", "relative", POLYGON);
   OBJModel face4_3 = new OBJModel(master, "tetraFace4_3.obj", "relative", POLYGON);
   OBJModel face4_4 = new OBJModel(master, "tetraFace4_4.obj", "relative", POLYGON); 

//constructor

tetrahedron(){
  neighbors = 3;
  
  boolean face1_1status = false; //off
  boolean face2_1status = false;
  boolean face3_1status = false;
  boolean face4_1status = false;
  color face1_1color;
  color face2_1color;
  color face3_1color; 
  color face4_1color;

  boolean face1_2status = false; //off
  boolean face2_2status = false;
  boolean face3_2status = false;
  boolean face4_2status = false;
  color face1_2color;
  color face2_2color;
  color face3_2color; 
  color face4_2color;

  boolean face1_3status = false; //off
  boolean face2_3status = false;
  boolean face3_3status = false;
  boolean face4_3status = false;
  color face1_3color;
  color face2_3color;
  color face3_3color; 
  color face4_3color;
  
  boolean face1_4status = false; //off
  boolean face2_4status = false;
  boolean face3_4status = false;
  boolean face4_4status = false;
  color face1_4color;
  color face2_4color;
  color face3_4color; 
  color face4_4color;

  
   
   tetraBase.enableDebug();
   tetraBase.enableTexture();
   tetraBase.scale(75);
   
   face1_1.enableDebug();
   face1_1.enableTexture();
   face1_1.scale(75);
   
   face1_2.enableDebug();
   face1_2.enableTexture();
   face1_2.scale(75);
   
   face1_3.enableDebug();
   face1_3.enableTexture();
   face1_3.scale(75);
   
   face1_4.enableDebug();
   face1_4.enableTexture();
   face1_4.scale(75);
   
   face2_1.enableDebug();
   face2_1.enableTexture();
   face2_1.scale(75);
   
   face2_2.enableDebug();
   face2_2.enableTexture();
   face2_2.scale(75);
   
   face2_3.enableDebug();
   face2_3.enableTexture();
   face2_3.scale(75);
   
   face2_4.enableDebug();
   face2_4.enableTexture();
   face2_4.scale(75);
   
   face3_1.enableDebug();
   face3_1.enableTexture();
   face3_1.scale(75);
   
   face3_2.enableDebug();
   face3_2.enableTexture();
   face3_2.scale(75);
   
   face3_3.enableDebug();
   face3_3.enableTexture();
   face3_3.scale(75);
   
   face3_4.enableDebug();
   face3_4.enableTexture();
   face3_4.scale(75);
   
   face4_1.enableDebug();
   face4_1.enableTexture();
   face4_1.scale(75);
   
   face4_2.enableDebug();
   face4_2.enableTexture();
   face4_2.scale(75);
   
   face4_3.enableDebug();
   face4_3.enableTexture();
   face4_3.scale(75);
   
   face4_4.enableDebug();
   face4_4.enableTexture();
   face4_4.scale(75);
}
}

void setup(){
  size(windowWidth, windowHeight,OPENGL);
  demo = new tetrahedron();
   files = new String[]{
    "triangleButtonOff.png", "triangleButtonOver.png", "triangleButtonDown.png"};
for(int i = 0; i < numSided; i++){
  
    if ( ( (i * 110) + 100) < windowWidth)
    {
      //tricon(110 * i,10);
      modButtons[i] = new GImageButton(this, "triangleButtonMask.png", files, 110 * i, 10); 
    }
    else if ( ( (i * 110) + 100) < (windowWidth * 2))
    {
      //tricon(110 * (i - (windowWidth / 110) ),10 + 110);
      modButtons[i] = new GImageButton(this, "triangleButtonMask.png", files, 110 * (i - (windowWidth / 110) ), 10 + 110); 
    }
    else
    {
      //tricon(110 * (i - (windowWidth / 55) ),10 + 220);
      modButtons[i] = new GImageButton(this, "triangleButtonMask.png", files, 110 * (i - (windowWidth / 55) ), 10 + 220); 
    }
}
    vs = new VScrollbar(width-10, 0, 20, height-20, 2);
    hs = new HScrollbar(0, height-10, width-20, 20, 2);
}
void draw(){
    background(220, 220, 255);
    lights();
    float leftPos = radians((vs.getPos() / windowHeight) * 360);
    float topPos = radians((hs.getPos() / windowWidth) * 360);
    vs.update();
    vs.display();
    hs.update();
    hs.display();  
    
    pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(leftPos);//Y
    rotateY(topPos);//X
//    rotateX(rotY);
//    rotateY(rotX);

    demo.tetraBase.draw();
    demo.face1_1.draw();
    demo.face1_2.draw();
    demo.face1_3.draw();
    demo.face1_4.draw();
    demo.face2_1.draw();
    demo.face2_2.draw();
    demo.face2_3.draw();
    demo.face2_4.draw();
    demo.face3_1.draw();
    demo.face3_2.draw();
    demo.face3_3.draw();
    demo.face3_4.draw();
    demo.face4_1.draw();
    demo.face4_2.draw();
    demo.face4_3.draw();
    demo.face4_4.draw();
    popMatrix();
        for(int i = 0; i < numSided; i++){
    if ( ( (i * 110) + 100) < windowWidth)
    {
      tricon(110 * i,10);
    }
    else if ( ( (i * 110) + 100) < (windowWidth * 2))
    {
      tricon(110 * (i - (windowWidth / 110) ),10 + 110);
    }
    else
    {
      tricon(110 * (i - (windowWidth / 55) ),10 + 220);
    }
}

}//end Draw

void tricon(int x, int y){
  pushMatrix();
  //println("tricon at " + x + " " + y);
  translate(x, y);
  stroke(0);
  strokeWeight(2);
  fill(255);
  //edge 3
  quad(10,90,30,78,70,78,90,90);
  //edge 2
  quad(90,90,70,78,50,44,50,21);
  //edge 1
  quad(50,21,50,44,30,78,10,90);
  //center 4
  triangle(50,44,70,78,30,78);
  popMatrix();
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

void handleImageButtonEvents(GImageButton imagebutton) { 
for(int i = 0; i < numSided;i++){
  if(imagebutton == modButtons[i])
    //lblOut.setText("Info - " + i);
    tint(0,random(255),0);
      //timer = millis();
 }
}
class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(153, 102, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


class VScrollbar
    {
      int swidth, sheight;    // width and height of bar
      int xpos, ypos;         // x and y position of bar
      float spos, newspos;    // x position of slider
      int sposMin, sposMax;   // max and min values of slider
      int loose;              // how loose/heavy
      boolean over;           // is the mouse over the slider?
      boolean locked;
      float ratio;

      VScrollbar (int xp, int yp, int sw, int sh, int l) {
        swidth = sw;
        sheight = sh;
        int heighttowidth = sh - sw;
        ratio = (float)sh / (float)heighttowidth;
        xpos = xp-swidth/2;
        ypos = yp;
        spos = ypos + sheight/2 - swidth/2;
        newspos = spos;
        sposMin = ypos;
        sposMax = ypos + sheight - swidth;
        loose = l;
      }

      void update() {
        if(over()) {
          over = true;
        } else {
          over = false;
        }
        if(mousePressed && over) {
          locked = true;
        }
        if(!mousePressed) {
          locked = false;
        }
        if(locked) {
          newspos = constrain(mouseY-swidth/2, sposMin, sposMax);
        }
        if(abs(newspos - spos) > 1) {
          spos = spos + (newspos-spos)/loose;
        }
      }

      int constrain(int val, int minv, int maxv) {
        return min(max(val, minv), maxv);
      }

      boolean over() {
        if(mouseX > xpos && mouseX < xpos+swidth &&
        mouseY > ypos && mouseY < ypos+sheight) {
          return true;
        } else {
          return false;
        }
      }

      void display() {
        fill(255);
        rect(xpos, ypos, swidth, sheight);
        if(over || locked) {
          fill(255, 255, 0);
        } else {
          fill(255, 0, 0);
        }
        rect(xpos, spos, swidth, swidth);
      }

      float getPos() {
        // Convert spos to be values between
        // 0 and the total width of the scrollbar
        return spos * ratio;
      }
    }
